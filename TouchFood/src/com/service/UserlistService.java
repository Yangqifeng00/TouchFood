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
	* ͨ��username��ȡ����
	*/
	public Userlist selectCheck(String username)throws Exception{
		return (Userlist)dao.selectByname(username);
	}
	
	/*
	* ͨ��username��password��ȡ����
	*/
	public Userlist Login(String username,String password)throws Exception{
		return (Userlist)dao.selectBynameP(username,password);
	}
	/*
	* ������ݣ�ע��
	*/
	public void Register(Userlist userlist)throws Exception {
		dao.insert(userlist);
	}
	
	/*
	* �޸ĸ�����Ϣ
	*/
	public void updateInfo(Userlist userlist)throws Exception {
		dao.updateByPrimaryKey(userlist);
	}
	
}
