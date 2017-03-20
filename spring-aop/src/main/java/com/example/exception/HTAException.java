package com.example.exception;

public class HTAException extends RuntimeException{
	
	public HTAException(String message) {
		super(message);
	}
	
	public HTAException(String message, Throwable cause) {
		super(message, cause);
	}
}
