package com.scribble.exception;

public class ServiceException extends RuntimeException {

	private static final long serialVersionUID = 3155738541263557575L;

	public ServiceException(String message) {
        super(message);
    }

    public ServiceException(String message, Throwable cause) {
        super(message, cause);
    }
}
