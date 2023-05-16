package com.scribble.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.scribble.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {
	
	Optional<User> findByUsername(String username);

    @Query("SELECT u.username, u.email FROM User u WHERE u.username = ?1")
    Optional<Object[]> findUsernameAndEmailByUsername(String username);
}
