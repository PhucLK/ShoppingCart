package com.spring.SpringJ32_JPA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.SpringJ32_JPA.entities.Category;
import com.spring.SpringJ32_JPA.repositories.CategoryRepository;

@Service
public class CategoryService {

	@Autowired
	private CategoryRepository categoryRepository;

	public void save(Category c) {
		categoryRepository.save(c);
	}
}
