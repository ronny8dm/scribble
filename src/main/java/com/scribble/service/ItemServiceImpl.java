package com.scribble.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scribble.entity.Item;
import com.scribble.repository.ItemRepository;

@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	private ItemRepository itemRepo;

	@Override
	public List<Item> getItems() {
		return itemRepo.findAll();
	}

	@Override
	public Optional<Item> getItemById(Long id) {
		return itemRepo.findById(id);
	}

	@Override
	public void saveItem(Item item) {
		itemRepo.save(item);
	}

	@Override
	public void updateItem(Item item) {
		itemRepo.save(item);
	}

	@Override
	public void deleteItem(Long id) {
		itemRepo.deleteById(id);
	}

}
