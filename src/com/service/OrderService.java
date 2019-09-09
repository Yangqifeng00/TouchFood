package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.OrderMapper;
import com.pojo.CommodityInfo;
import com.pojo.Order;

@Service("orderService")
public class OrderService {
	@Resource
	private OrderMapper dao;
	
	public void orderInsert(Order order)throws Exception{
		dao.insert(order);
	}
	
	/*
	* ͨ��id��ȡ����
	*/
	public Order findById(Integer id)throws Exception{
		return (Order)dao.selectByPrimaryKey(id);
	}
}
