package com.scribble.service;

import java.util.List;
import java.util.Optional;

import com.scribble.entity.Category;

public interface CategoryService {

public List<Category> getCategories();
    
    public Optional<Category> getCategoryById(Long id);
    
    public void saveCategory(Category category);
    
    public void updateCategory(Category category);
    
    public void deleteCategory(Long id);
	
}
