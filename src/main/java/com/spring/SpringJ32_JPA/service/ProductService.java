package com.spring.SpringJ32_JPA.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.SpringJ32_JPA.entities.Product;
import com.spring.SpringJ32_JPA.repositories.ProductRepository;

@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;

	public void save(Product p) {
		productRepository.save(p);
	}

	public List<Product> getList() {
		return (List<Product>) productRepository.findAll();
	}

	public Product findProduct(int id) {
		return productRepository.findOne(id);
	}

	public void delete(int id) {
		productRepository.delete(id);
	}

	public List<Product> findProduct(String code, String code1) {
		return productRepository.findProduct(code + "%", "%" + code1 + "%");
	}
}
