package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.pojo.Message;
import com.service.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {

	@Resource(name="messageService")
	private MessageService messageService;
	
	@RequestMapping(value="/insert")
	public void insert(HttpServletRequest request, HttpServletResponse response,HttpSession session){
//		ModelAndView mv = new ModelAndView();
		String pid0 = request.getParameter("pid");
		Integer pid=Integer.valueOf(pid0);
		String username1 = (String) request.getSession().getAttribute("username");
		
		
		String content = request.getParameter("content");
		String messTime = request.getParameter("messTime");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date date = null;
		try {
			// Fri Feb 24 00:00:00 CST 2012
			date = format.parse(messTime); 
		} catch (ParseException e) {
			e.printStackTrace();
		}
//		// 2012-02-24
//		date = java.sql.Date.valueOf(messTime);
		
		try{
			if(username1 != null){
				String username = username1.substring(0, 3) + "****" + username1.substring(7, username1.length());
				
				Message mes = new Message(username,pid,content,date);
				int addMesFlag = messageService.insertMessage(mes);
	//			mv.setViewName("detail");
				if(addMesFlag==1){
					request.setAttribute("messagesadd", mes);
				}
			}
		} catch(Exception e){
            e.printStackTrace();
		}
//		session.setAttribute("pid", pid);
//		return "redirect:/commodity_info/messageById";
	}
}
