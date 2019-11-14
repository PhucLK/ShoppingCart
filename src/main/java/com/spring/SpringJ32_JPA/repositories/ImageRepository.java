package com.spring.SpringJ32_JPA.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.spring.SpringJ32_JPA.entities.Images;


@Repository
public interface ImageRepository extends CrudRepository<Images, Integer> {

}
