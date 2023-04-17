package com.scribble.exception;

public class UserNotFoundException extends RuntimeException {
	
	private static final long serialVersionUID = -1316307985851450131L;

	public UserNotFoundException(String message) {
        super(message);
    }
}
