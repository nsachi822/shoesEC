package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.domain.Items;
import com.example.repository.ItemsRepository;

@Service
public class ItemsService {
	
	@Autowired
	private ItemsRepository itemsRepository;
	
	
	public List<Items> findItems (){
		return itemsRepository.findItems();
	}

	public Items addItem(Items items) {
		return itemsRepository.addItem(items);
	}
	
}
