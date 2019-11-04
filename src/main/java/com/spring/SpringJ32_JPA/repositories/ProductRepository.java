package com.spring.SpringJ32_JPA.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.spring.SpringJ32_JPA.entities.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Integer> {

	@Query(value = "select * from Product where name like ?1 or description like ?2",nativeQuery = true)
	public List<Product> findProduct(String code, String code1);
}
