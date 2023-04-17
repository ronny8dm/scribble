package com.scribble.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.scribble.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
	
}
