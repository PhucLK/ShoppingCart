package com.spring.SpringJ32_JPA.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.spring.SpringJ32_JPA.entities.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Integer>{

}
