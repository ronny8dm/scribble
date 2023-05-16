package com.scribble.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.scribble.entity.User;
import com.scribble.exception.ServiceException;
import com.scribble.repository.UserRepository;
import com.scribble.service.UserService;

@Controller
@RequestMapping("/users")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private UserRepository UserRepo;

	@GetMapping("")
	public ModelAndView showUsers() {
		ModelAndView model = new ModelAndView("user-settings");
		List<User> users = userService.getUsers();
		model.addObject("users", users);
		model.addObject("page", "dashboard-sections/user-settings.jsp");
		model.setViewName("dashboard");
		return model;
	}

	@GetMapping("/new")
	public ModelAndView showUserForm() {
		ModelAndView mav = new ModelAndView("user-form");
		mav.addObject("user", new User());
		return mav;
	}

	@GetMapping("/{username}")
	public ModelAndView showUserDetails(@PathVariable("username") String username) {
	    ModelAndView mav = new ModelAndView("dashbaord");
	    Optional<Object[]> optionalUser = UserRepo.findUsernameAndEmailByUsername(username);
	    if (optionalUser.isPresent()) {
	        Object[] user = optionalUser.get();
	        mav.addObject("username", user[0]);
	        mav.addObject("email", user[1]);
	        return mav;
	    } else {
	        return new ModelAndView("404");
	    }
	}


	@RequestMapping(value = "/{username}/edit", method =  RequestMethod.POST)
	public String editUser(@Valid @ModelAttribute User user, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("user", user);
			return "user-form";
		}
		userService.updateUser(user);
		return "redirect:/users/" + user.getUsername();
	}

	@GetMapping("/{username}/delete")
	public String deleteUser(@PathVariable("username") String username, Authentication authentication)
			throws ServiceException {
		Optional<User> optionalUser = userService.getUserByUsername(username);
		if (optionalUser.isPresent()) {
			User user = optionalUser.get();
			if (authentication.getName().equals(user.getUsername())) {
				throw new ServiceException("You can't delete your own account");
			}
			userService.deleteUser(user);
			return "redirect:/users";
		} else {
			return "404";
		}
	}
}