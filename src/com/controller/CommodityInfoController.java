package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pojo.CommodityInfo;
import com.pojo.Message;
import com.service.CommodityService;
import com.service.MessageService;

@Controller
@RequestMapping("/commodity_info")  
public class CommodityInfoController {
	@Resource(name="commodityService")
	private CommodityService commodityService;
	
	@Resource(name="messageService")
	private MessageService messageService;
	
	//ǰ��չʾ��Ʒ
		@RequestMapping(value="/ListCommodity")
		public String ListCommodity(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
			List<CommodityInfo> commoditys = new ArrayList<CommodityInfo>();
			try {
				commoditys = commodityService.selectListCommoditys();//���÷�����ȡ��Ʒ
				
				request.setAttribute("commoditys", commoditys);//����ǰ��
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "index";
		}
		
		
		/**
		 * ����id��ѯ��Ʒ������ҳ
		 */
		@RequestMapping(value="/queryById")
		public String queryById(Model model,@RequestParam("pid") Integer id){
			try{
				
				CommodityInfo var = commodityService.findById(id);
				System.out.println(var.getName());
				model.addAttribute("var", var);
				
				List<Message> messages = new ArrayList<Message>();
				List<Message> messagesadd = new ArrayList<Message>();
				messages = messageService.selectmessages();
				
				for(Message message : messages){
					if(message.getPid() == id){
						messagesadd.add(message);
					}
				}
				model.addAttribute("messagesadd", messagesadd);
				
			} catch(Exception e){
	            e.printStackTrace();
			}
			return "detail";
		}
		
		
		/**
		 * ����id��ѯ��Ʒ������ҳ
		 */
		@RequestMapping(value="/messageById")
		public String messageById(Model model,HttpServletRequest request, HttpServletResponse response,
				HttpSession session){
			try{
				
				Integer id =(Integer)request.getSession().getAttribute("pid");
				CommodityInfo var = commodityService.findById(id);
				System.out.println(var.getName());
				model.addAttribute("var", var);
				
				List<Message> messages = new ArrayList<Message>();
				List<Message> messagesadd = new ArrayList<Message>();
				messages = messageService.selectmessages();
				
				for(Message message : messages){
					if(message.getPid() == id){
						messagesadd.add(message);
					}
				}
				model.addAttribute("messagesadd", messagesadd);
				
			} catch(Exception e){
	            e.printStackTrace();
			}
			return "detail";
		}
}
