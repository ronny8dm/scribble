package com.scribble.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.scribble.entity.Item;

public interface ItemRepository extends  JpaRepository<Item, Long>{

	 @Query("SELECT i FROM Item i WHERE i.name LIKE %:keyword% OR i.description LIKE %:keyword%")
	List<Item> searchItems(@Param("keyword") String keyword);
	
}
