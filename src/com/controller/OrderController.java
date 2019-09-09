package com.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Order;
import com.pojo.Orderitem;
import com.pojo.Orderlist;
//import com.pojo.Orderlist;
import com.pojo.Userlist;
import com.service.OrderService;
import com.service.OrderitemService;
import com.service.OrderlistService;
import com.service.UserlistService;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Resource(name="orderService")
	private OrderService orderService;
	
	@Resource(name="userlistService")
	private UserlistService userlistService;
	
	@Resource(name="orderitemService")
	private OrderitemService orderitemService;
	
	@Resource(name="orderlistService")
	private OrderlistService orderlistService;
	
	@RequestMapping("/insert")
	public String insert(Model model,HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception{
		
//		Userlist u = (Userlist) request.getSession().getAttribute("user");
		String username = (String) request.getSession().getAttribute("username");
		System.out.println(username);
		Userlist u = userlistService.selectCheck(username);
		if(null==u){
//            response.sendRedirect("/login.jsp");
            return "login";
        }
		Order o = new Order();
		o.setUser(u);
		o.setUsername(username);
		orderService.orderInsert(o);
		
		List<Orderitem> ois = (List<Orderitem>) request.getSession().getAttribute("ois");
		
		for (Orderitem oi : ois) {
			oi.setOid(o.getId());
			System.out.println(o.getId());
            orderitemService.ItemInsert(oi);
        }
		
		ois.clear();
		
        return "buyCart";

	}
	
	
	@RequestMapping("/insertlist")
	public String insertlist(Model model,HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception{
		
//		Userlist u = (Userlist) request.getSession().getAttribute("user");
		String username = (String) request.getSession().getAttribute("username");
		System.out.println(username);
		Userlist u = userlistService.selectCheck(username);
		if(null==u){
//            response.sendRedirect("/login.jsp");
            return "login";
        }
		Order o = new Order();
		o.setUser(u);
		o.setUsername(username);
		orderService.orderInsert(o);
		
		List<Orderlist> ois = (List<Orderlist>) request.getSession().getAttribute("ois");
		
		for (Orderlist oi : ois) {
			oi.setOid(o.getId());
//			System.out.println(o.getId());
//			System.out.println("__________________________"+oi.getNum());
			oi.setName(oi.getCommodity().getName());
			oi.setPrice(oi.getCommodity().getPrice());
			oi.setSmImg(oi.getCommodity().getSmImg());
			Float price = Float.parseFloat(oi.getCommodity().getPrice());
			Float cprice = (price * oi.getNum());
			oi.setCouprice(cprice.toString());
			
			orderlistService.ItemInsert(oi);
			
//			System.out.println("__________________________"+oi.toString());
        }
		
		ois.clear();
		
        return "buyCart";

	}
}
