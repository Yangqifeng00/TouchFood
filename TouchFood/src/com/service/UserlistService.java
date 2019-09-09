package com.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.UserlistMapper;
import com.pojo.Userlist;

@Service("userlistService")
public class UserlistService {

	@Resource
	private UserlistMapper dao;
	
	/*
	* 通过username获取数据
	*/
	public Userlist selectCheck(String username)throws Exception{
		return (Userlist)dao.selectByname(username);
	}
	
	/*
	* 通过username和password获取数据
	*/
	public Userlist Login(String username,String password)throws Exception{
		return (Userlist)dao.selectBynameP(username,password);
	}
	/*
	* 添加数据，注册
	*/
	public void Register(Userlist userlist)throws Exception {
		dao.insert(userlist);
	}
	
	/*
	* 修改个人信息
	*/
	public void updateInfo(Userlist userlist)throws Exception {
		dao.updateByPrimaryKey(userlist);
	}
	
}
