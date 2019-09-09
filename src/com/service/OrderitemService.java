package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.OrderitemMapper;
import com.pojo.Orderitem;

@Service("orderitemService")
public class OrderitemService {

	@Resource
	
	private OrderitemMapper dao;
	
	public void ItemInsert(Orderitem orderItem)throws Exception{
		dao.insert(orderItem);
	}
}
