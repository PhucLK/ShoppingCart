package com.spring.SpringJ32_JPA.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.spring.SpringJ32_JPA.entities.Orders;
import com.spring.SpringJ32_JPA.entities.User;

@Repository
public interface UserRepository extends CrudRepository<User, String>{
	@Query("Select u from User u where u.userName = ?1 and u.password = ?2")
	public User findUser(String userName,String password);
}
