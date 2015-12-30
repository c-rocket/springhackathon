package com.oracle.spring.controller.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.CREATED)
public class CreationErrorException extends RuntimeException {

	public CreationErrorException(Exception e) {
		super(e);
	}

}
