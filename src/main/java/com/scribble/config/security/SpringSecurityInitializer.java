package com.scribble.config.security;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

/**
 * 
 * The SpringSecurityInitializer class extends the AbstractSecurityWebApplicationInitializer class
 * provided by Spring Security, which initializes the security filter chain that is responsible for
 * protecting the web application.
 * 
 * This class doesn't have any additional code other than extending the AbstractSecurityWebApplicationInitializer class,
 * but by doing so, it ensures that the Spring Security filter chain is loaded when the application starts up.
 *
 */
public class SpringSecurityInitializer extends AbstractSecurityWebApplicationInitializer {
	
}
