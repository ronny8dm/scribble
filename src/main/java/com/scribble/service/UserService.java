package com.scribble.service;

import java.util.List;
import java.util.Optional;

import com.scribble.entity.User;
import com.scribble.exception.ServiceException;

	public interface UserService {

    public List<User> getUsers() throws ServiceException;
        
    public Optional<User> getUserByUsername(String username) throws ServiceException;
    
    public void registerUser(User userForm) throws ServiceException;
    
    public void saveUser(User user) throws ServiceException;
    
    public void updateUser(User user) throws ServiceException;
    
    public void deleteUser(User user) throws ServiceException;
    
}		