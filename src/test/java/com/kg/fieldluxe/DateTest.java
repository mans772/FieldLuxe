package com.kg.fieldluxe;

import java.time.LocalDateTime;

import org.junit.Test;

public class DateTest {

	@Test
	public void test() {
		LocalDateTime ldt = LocalDateTime.now();
		System.out.println(ldt);
		ldt = ldt.plusDays(7);
		System.out.println(ldt);
		
	}
}
