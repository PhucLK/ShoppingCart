package com.spring.SpringJ32_JPA.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.SpringJ32_JPA.entities.OrderDetail;
import com.spring.SpringJ32_JPA.repositories.OrderDetailRepository;

@Service
public class OrderDetailService {

	@Autowired
	private OrderDetailRepository orderDetailRepository;

	public void save(OrderDetail od) {

		orderDetailRepository.save(od);
	}

	public OrderDetail findOrderDetail(int id) {
		return orderDetailRepository.findOne(id);
	}

	public List<OrderDetail> getListOrder() {
		return orderDetailRepository.getDetailOrders();
	}

	public List<OrderDetail> getListOrderWithDate(String date) {
		return orderDetailRepository.getDetailOrdersWithDate(date);
	}
}
