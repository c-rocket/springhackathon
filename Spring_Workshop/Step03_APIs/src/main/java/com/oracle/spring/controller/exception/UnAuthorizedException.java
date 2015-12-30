package com.oracle.spring.controller.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.UNAUTHORIZED)
public class UnAuthorizedException extends RuntimeException {

	public UnAuthorizedException(Exception e) {
		super(e);
	}

	public UnAuthorizedException() {
		super();
	}

}
