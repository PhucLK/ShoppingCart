package com.spring.SpringJ32_JPA.repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.spring.SpringJ32_JPA.entities.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Integer> {

	@Query(value = "select * from Product where name like ?1 or description like ?2",nativeQuery = true)
	public List<Product> findProduct(String code, String code1);
	
	@Query(value = "select * from product limit ?1, ?2;", nativeQuery = true)
	public List<Product> getProductPage(int page, int total);
	
	Page<Product> findAll(Pageable pageable);
}
