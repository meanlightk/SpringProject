package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.mapper.PaymentMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PaymentService {
	
	@Autowired
	private PaymentMapper paymentMapper;


	

}
