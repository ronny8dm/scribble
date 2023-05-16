package com.scribble.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.scribble.entity.Category;

public interface CategoryRepository  extends  JpaRepository<Category, Long>{

}
