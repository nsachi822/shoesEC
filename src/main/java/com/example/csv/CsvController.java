package com.example.csv;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.Order;
import com.example.service.OrderService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.dataformat.csv.CsvGenerator;
import com.fasterxml.jackson.dataformat.csv.CsvMapper;
import com.fasterxml.jackson.dataformat.csv.CsvSchema;

@Controller
public class CsvController {

	@Autowired
	DownloadHelper downloadHelper;
	
	@Autowired
	public OrderService orderService;
	
	@Autowired
	HttpSession session;
	
	public String getCsvText() throws JsonProcessingException{
		CsvMapper mapper = new CsvMapper();
		
		mapper.configure(CsvGenerator.Feature.ALWAYS_QUOTE_STRINGS, true);
		
		CsvSchema schema = mapper.schemaFor(Order.class).withHeader();
		
		
		List<Order> orderList = orderService.findAllOrder();
		session.setAttribute("orderList",orderList);
		
		
		return mapper.writer(schema).writeValueAsString(orderList);
	}
	
	@RequestMapping(value ="/download/csv",method=RequestMethod.POST)
	public ResponseEntity<byte[]> download() throws IOException{
		HttpHeaders headers = new HttpHeaders();
		downloadHelper.addContentDisposition(headers,"orderlist.csv");
		return new ResponseEntity<>(getCsvText().getBytes("MS932"),headers,HttpStatus.OK);
		
		
	}
	
}
