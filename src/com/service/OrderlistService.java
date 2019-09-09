package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.OrderlistMapper;
import com.pojo.CommodityInfo;
import com.pojo.Orderlist;


@Service("orderlistService")
public class OrderlistService {
@Resource
	
	private OrderlistMapper dao;
	
	public void ItemInsert(Orderlist orderlist)throws Exception{
		dao.insert(orderlist);
	}
	
	public List<Orderlist> selectOrderlist() throws Exception{
		return (List<Orderlist>)dao.selectOrderList();
	}
	
//	/*
//	* 通过oid获取数据
//	*/
//	public CommodityInfo findById(Integer id)throws Exception{
//		return (CommodityInfo)dao.selectByPrimaryKey(id);
//	}
}
