package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.MessageMapper;
import com.pojo.CommodityInfo;
import com.pojo.Message;
import com.pojo.Userlist;

@Service("messageService")
public class MessageService {
	@Resource
	private MessageMapper dao;
	
	public List<Message> selectmessages() throws Exception{
		return (List<Message>)dao.selectmessage();
	}
	/*
	* 通过id获取数据
	*/
	public Message findById(Integer id)throws Exception{
		return (Message)dao.selectByPrimaryKey(id);
	}
	
	/*
	* 添加数据，注册
	*/
	public int insertMessage(Message messages)throws Exception {
		return dao.insert(messages);
	}
	
}
