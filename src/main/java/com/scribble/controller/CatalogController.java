package com.scribble.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.scribble.entity.Item;
import com.scribble.service.ItemService;

@Controller
public class CatalogController {

	@Autowired
	private ItemService itemService;

	@RequestMapping(value = { "/items" }, method = RequestMethod.GET)
	public ModelAndView listItems() {
		ModelAndView model = new ModelAndView();

		List<Item> theItems = itemService.getItems();
		model.addObject("items", theItems);

		model.addObject("page", "dashboard-sections/catalog.jsp");
		model.setViewName("dashboard");
		return model;
	}

	@RequestMapping(value = { "/items/new" }, method = RequestMethod.GET)
	public ModelAndView showAddItemForm() {
		ModelAndView model = new ModelAndView();

		model.addObject("item", new Item());

		model.addObject("page", "dashboard-sections/item-form.jsp");
		model.setViewName("dashboard");
		return model;
	}

	@RequestMapping(value = "/items/save", method = RequestMethod.POST)
	public String saveItem(@ModelAttribute("item") @Valid Item item, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("page", "dashboard-sections/item-form.jsp");
			return "dashboard";
		} else {
			if (item.getId() != null) {
				// retrieve the existing item from the database
				Optional<Item> optExistingItem = itemService.getItemById(item.getId());

				if (optExistingItem.isPresent()) {
					Item existingItem = optExistingItem.get();
					// update the properties of the existing item
					existingItem.setName(item.getName());
					existingItem.setDescription(item.getDescription());
					existingItem.setPrice(item.getPrice());
					existingItem.setImageUrl(item.getImageUrl());

					// save the updated item to the database
					itemService.saveItem(existingItem);
				}
			} else {
				itemService.saveItem(item);
			}
			return "redirect:/items";
		}
	}

	@RequestMapping(value = "/items/edit", method = RequestMethod.GET)
	public ModelAndView showEditItemForm(@RequestParam("itemId") Long itemId) {
		ModelAndView model = new ModelAndView();

		Optional<Item> item = itemService.getItemById(itemId);
		if (item.isPresent()) {
			model.addObject("item", item.get());
			model.addObject("page", "dashboard-sections/item-form.jsp");
		}

		model.setViewName("dashboard");
		return model;
	}
	
	@RequestMapping(value = "/items/search", method = RequestMethod.GET)
	public ModelAndView search(@RequestParam(value = "q", defaultValue = "") String query) {
	    List<Item> items = itemService.searchItems(query);
	    ModelAndView model = new ModelAndView();
	    model.addObject("items", items);
	    model.addObject("page", "dashboard-sections/catalog.jsp");
	    model.setViewName("redirect:/items");
	    return model;
	}

	@GetMapping("/items/delete")
	public String deleteItem(@RequestParam("itemId") Long itemId) {
		itemService.deleteItem(itemId);
		return "redirect:/items";
	}

}
