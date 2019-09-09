package com.controller;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.CommodityInfo;
import com.pojo.Orderitem;
import com.service.CommodityService;
import com.service.OrderitemService;

@Controller
@RequestMapping("/orderitem")
public class OrderitemController {
	@Resource(name="orderitemService")
	private OrderitemService orderitemService;
	
	@Resource(name="commodityService")
	private CommodityService commodityService;
	
	
	@RequestMapping("/insert")
	public String insert(Model model,HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception{
		
		Integer num = Integer.parseInt(request.getParameter("num"));
		Integer pid = Integer.parseInt(request.getParameter("pid"));
        System.out.println("获取的商品pid"+pid);

        CommodityInfo p = commodityService.findById(pid);
        System.out.println(p.getDesc());
        
        Orderitem oi = new Orderitem();
        oi.setNum(num);
        oi.setCommodity(p);
        oi.setPid(pid);
        
        List<Orderitem> ois = (List<Orderitem>) request.getSession().getAttribute("ois");
        if (null == ois) {
            ois = new ArrayList<Orderitem>();
            request.getSession().setAttribute("ois", ois);
        }
        
        boolean found = false;
        for (Orderitem orderItem : ois) {
            if (orderItem.getCommodity().getId() == oi.getCommodity().getId()) {
                orderItem.setNum(orderItem.getNum() + oi.getNum());
                found = true;
                break;
            }
        }
        
        if (!found)
            ois.add(oi);
		return "buyCart";
	}
	
	@RequestMapping("/delete")
	public String delete(Model model,HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception{
		Integer pid = Integer.parseInt(request.getParameter("pid"));
		List<Orderitem> ois = (List<Orderitem>) request.getSession().getAttribute("ois");
		List<Orderitem> ois4Delete = new ArrayList<>();
		
		if(null!=ois){
        	for (Orderitem io : ois) {
				if(io.getCommodity().getId()==pid){
					ois4Delete.add(io);
				}
			}
        }
        ois.removeAll(ois4Delete);
        return "buyCart";
	}
	
}
