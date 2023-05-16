package com.scribble.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scribble.entity.Category;
import com.scribble.repository.CategoryRepository;


@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
    private CategoryRepository categoryRepo;

    @Override
    public List<Category> getCategories() {
        return categoryRepo.findAll();
    }

    @Override
    public Optional<Category> getCategoryById(Long id) {
        return categoryRepo.findById(id);
    }

    @Override
    public void saveCategory(Category category) {
        categoryRepo.save(category);
    }

    @Override
    public void updateCategory(Category category) {
        categoryRepo.save(category);
    }

    @Override
    public void deleteCategory(Long id) {
        categoryRepo.deleteById(id);
    }

}
