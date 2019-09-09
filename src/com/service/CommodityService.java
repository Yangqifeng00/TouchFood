package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.CommodityInfoMapper;
import com.pojo.CommodityInfo;

@Service("commodityService")
public class CommodityService {
	@Resource
	private CommodityInfoMapper dao;
	
	public List<CommodityInfo> selectListCommoditys() throws Exception{
		return (List<CommodityInfo>)dao.selectListCommodity();
	}
	
	/*
	* 通过id获取数据
	*/
	public CommodityInfo findById(Integer id)throws Exception{
		return (CommodityInfo)dao.selectByPrimaryKey(id);
	}
	
}
