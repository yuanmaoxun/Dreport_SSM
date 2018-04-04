package com.heuzoo.dreport.exception;

public class CannotAccessDataException extends Exception{
	private static final long serialVersionUID = 3511117223593515586L;
	String message;

	public String getMessage() {
		return message;
	}

	public CannotAccessDataException(String message) {
		super();
		this.message = message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
