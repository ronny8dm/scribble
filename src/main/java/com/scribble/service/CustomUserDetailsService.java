package com.scribble.service;

import java.util.Collection;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.scribble.entity.Authority;
import com.scribble.entity.User;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<User> userOpt = userService.getUserByUsername(username);
        if (!userOpt.isPresent()) {
            throw new UsernameNotFoundException("User not found");
        }
        User userFound = userOpt.get();
        return new org.springframework.security.core.userdetails.User(
        		userFound.getUsername(),
        		userFound.getPassword(),
        		userFound.isEnabled(),
        		true, true, true,
            getAuthorities(userFound.getAuthorities())
        );
    }

    private Collection<? extends GrantedAuthority> getAuthorities(Collection<Authority> authorities) {
        return authorities.stream()
            .map(authority -> new SimpleGrantedAuthority(authority.getAuthority()))
            .collect(Collectors.toList());
    }
}