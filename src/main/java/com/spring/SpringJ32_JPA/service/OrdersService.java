package com.spring.SpringJ32_JPA.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.SpringJ32_JPA.entities.Category;
import com.spring.SpringJ32_JPA.entities.OrderDetail;
import com.spring.SpringJ32_JPA.entities.Orders;
import com.spring.SpringJ32_JPA.entities.Product;
import com.spring.SpringJ32_JPA.repositories.CategoryRepository;
import com.spring.SpringJ32_JPA.repositories.OrderDetailRepository;
import com.spring.SpringJ32_JPA.repositories.OrdersRepository;
import com.spring.SpringJ32_JPA.repositories.ProductRepository;

@Service
public class OrdersService {

	@Autowired
	private OrdersRepository ordersRepository;
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private OrderDetailRepository orderDetailRepository;
	@Autowired
	private ProductRepository productRepository;

	public Orders saveOrders(List<OrderDetail> list) {
		Orders orders = new Orders();
		orders.setDateOrder(new Date());
		orders.setOrderDetail(list);
		orders.setTotal(getTotal(list));
		orders = ordersRepository.save(orders);
		return orders;
	}

	public double getTotal(List<OrderDetail> list) {
		double s = 0;
		for (OrderDetail o : list) {
			s = s + o.getProduct().getPrice() * o.getQuantity();
		}
		return s;
	}

	public List<Orders> getOrders() {
		return (List<Orders>) ordersRepository.findAll();
	}

//	public List<Orders> findOrdersJoinOrderDetail(int quantity, double total) {
//		return ordersRepository.findOrdersJoinOrderDetail(quantity, total);
//	}

	public List<Orders> findOrderr() {
		return ordersRepository.findOrderr();
	}
//
//	public List<Orders> findOrdersByDateOrderJoinQuantity(Date dateOrder, int quantity) {
//
//		return ordersRepository.findOrdersByDateOrderJoinQuantity(dateOrder, quantity);
//	}

}
