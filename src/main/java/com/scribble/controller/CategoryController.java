package com.scribble.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.scribble.entity.Category;
import com.scribble.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
    private CategoryService categoryService;

    @RequestMapping(value = {"/categories"}, method = RequestMethod.GET)
    public ModelAndView listCategories() {
        ModelAndView model = new ModelAndView();

        List<Category> theCategories = categoryService.getCategories();
        model.addObject("categories", theCategories);

        model.addObject("page", "dashboard-sections/category-list.jsp");
        model.setViewName("dashboard");
        return model;
    }

    @RequestMapping(value = {"/categories/new"}, method = RequestMethod.GET)
    public ModelAndView showAddCategoryForm() {
        ModelAndView model = new ModelAndView();

        model.addObject("category", new Category());

        model.addObject("page", "dashboard-sections/category-form.jsp");
        model.setViewName("dashboard");
        return model;
    }

    @RequestMapping(value = "/categories/save", method = RequestMethod.POST)
    public String saveCategory(@ModelAttribute("category") Category category, Model model) {
        categoryService.saveCategory(category);
        return "redirect:/categories";
    }

    @RequestMapping(value = "/categories/edit", method = RequestMethod.GET)
    public ModelAndView showEditCategoryForm(@RequestParam("categoryId") Long categoryId) {
        ModelAndView model = new ModelAndView();

        Optional<Category> category = categoryService.getCategoryById(categoryId);
        if (category != null) {
            model.addObject("category", category);
            model.addObject("page", "dashboard-sections/category-form.jsp");
        }

        model.setViewName("dashboard");
        return model;
    }

    @GetMapping("/categories/delete")
    public String deleteCategory(@RequestParam("categoryId") Long categoryId) {
        categoryService.deleteCategory(categoryId);
        return "redirect:/categories";
    }
	
}
