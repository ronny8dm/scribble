package com.scribble.service;

import java.util.List;
import java.util.Optional;

import com.scribble.entity.Item;

public interface ItemService {
	
	public List<Item> getItems();
    
    public Optional<Item> getItemById(Long id);
    
    public void saveItem(Item item);
    
    public void updateItem(Item item);
    
    public void deleteItem(Long id);
}
