package com.oracle.spring.util;

import java.math.BigDecimal;

public class BigDecimalUtil {

	public static BigDecimal parse(Object object) {
		if (object == null) {
			return null;
		} else if (object instanceof Integer) {
			return new BigDecimal((Integer) object);
		} else if (object instanceof String) {
			return new BigDecimal((String) object);
		}
		return null;
	}

}
