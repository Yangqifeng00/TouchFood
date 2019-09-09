package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mapper.MessageMapper;
import com.pojo.Message;

@Service("messageService")
public class MessageService {
	@Resource
	private MessageMapper dao;
	
	public List<Message> selectmessages() throws Exception{
		return (List<Message>)dao.selectmessage();
	}
	/*
	* ͨ��id��ȡ����
	*/
	public Message findById(Integer id)throws Exception{
		return (Message)dao.selectByPrimaryKey(id);
	}
	
	/*
	* ������ݣ�ע��
	*/
	public int insertMessage(Message messages)throws Exception {
		return dao.insert(messages);
	}
	
	/*
	 * ��ȡmessage��������
	 */
	public int findAllCount()throws Exception {
		return dao.selectmessageCount();
	}
}
