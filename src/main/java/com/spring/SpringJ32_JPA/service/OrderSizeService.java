package com.spring.SpringJ32_JPA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.SpringJ32_JPA.entities.OrderSize;
import com.spring.SpringJ32_JPA.repositories.OrderSizeRepository;

@Service
public class OrderSizeService {

	@Autowired
	OrderSizeRepository orderSizeRepository;
	
	public OrderSize save(OrderSize o) {
		return orderSizeRepository.save(o);
	}
}
