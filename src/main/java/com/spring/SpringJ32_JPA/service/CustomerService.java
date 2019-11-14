package com.spring.SpringJ32_JPA.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.SpringJ32_JPA.entities.Customer;
import com.spring.SpringJ32_JPA.repositories.CustomerRepository;

@Service
public class CustomerService {

	@Autowired
	private CustomerRepository customerRepository;

	public void save(Customer customer) {
		customerRepository.save(customer);
	}

	public List<Customer> findCustomerOrder() {

		return (List<Customer>) customerRepository.findCustomerOrder();
	}
}
