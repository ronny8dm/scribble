package com.scribble.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.scribble.entity.Authority;
import com.scribble.entity.User;
import com.scribble.exception.ServiceException;
import com.scribble.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public List<User> getUsers() throws ServiceException {
		try {
			return userRepository.findAll();
		} catch (Exception e) {
			throw new ServiceException("Error while fetching all users", e);
		}
	}
	

	@Override
	public Optional<User> getUserByUsername(String username) throws ServiceException {
		try {
			return userRepository.findById(username);
		} catch (Exception e) {
			throw new ServiceException("Error while fetching user by username", e);
		}
	}

	@Override
	public void registerUser(User userForm) throws ServiceException {
		try {
			userForm.setEnabled(true);
			userForm.setPassword(passwordEncoder.encode(userForm.getPassword()));
			saveUser(userForm);

			Authority authority = new Authority("ROLE_EMPLOYEE", userForm);
			userForm.getAuthorities().add(authority);
			updateUser(userForm);
		} catch (Exception e) {
			throw new ServiceException("Error while registering user", e);
		}
	}

	@Override
	public void saveUser(User user) throws ServiceException {
		try {
			userRepository.save(user);
		} catch (Exception e) {
			throw new ServiceException("Error while saving user", e);
		}
	}

	@Override
	public void updateUser(User user) throws ServiceException {
		try {
			userRepository.save(user);
		} catch (Exception e) {
			throw new ServiceException("Error while updating user", e);
		}
	}

	@Override
	public void deleteUser(User user) throws ServiceException {
		try {
			userRepository.delete(user);
		} catch (Exception e) {
			throw new ServiceException("Error while deleting user", e);
		}
	}
}