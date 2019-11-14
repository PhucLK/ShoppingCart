/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.SpringJ32_JPA.repositories;

import java.io.Serializable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.spring.SpringJ32_JPA.entities.Size;

/**
 *
 * @author Admin
 */
@Repository
public interface SizeRepository extends CrudRepository<Size, Integer>{
    
}
