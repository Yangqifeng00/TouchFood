package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.CommodityInfo;
import com.pojo.Orderlist;
import com.service.CommodityService;
import com.service.OrderService;
import com.service.OrderlistService;

@Controller
@RequestMapping("/orderlist")
public class OrderlistController {
	@Resource(name="orderlistService")
	private OrderlistService orderlistService;
	
	@Resource(name="commodityService")
	private CommodityService commodityService;
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	@RequestMapping("/insert")
	public String insert(Model model,HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception{
		
		Integer num = Integer.parseInt(request.getParameter("num"));
		Integer pid = Integer.parseInt(request.getParameter("pid"));
        System.out.println("获取的商品pid"+pid);

        CommodityInfo p = commodityService.findById(pid);
        System.out.println(p.getDesc());
        
        Orderlist oi = new Orderlist();
        oi.setNum(num);
        oi.setCommodity(p);
        oi.setPid(pid);
        
        List<Orderlist> ois = (List<Orderlist>) request.getSession().getAttribute("ois");
        if (null == ois) {
            ois = new ArrayList<Orderlist>();
            request.getSession().setAttribute("ois", ois);
        }
        
        boolean found = false;
        for (Orderlist orderlist : ois) {
            if (orderlist.getCommodity().getId() == oi.getCommodity().getId()) {
            	orderlist.setNum(orderlist.getNum() + oi.getNum());
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
		List<Orderlist> ois = (List<Orderlist>) request.getSession().getAttribute("ois");
		List<Orderlist> ois4Delete = new ArrayList<>();
		
		if(null!=ois){
        	for (Orderlist io : ois) {
				if(io.getCommodity().getId()==pid){
					ois4Delete.add(io);
				}
			}
        }
        ois.removeAll(ois4Delete);
        return "buyCart";
	}
	
	@RequestMapping("/Findorderlist")
	public String Findorderlist(Model model,HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception{
		List<Orderlist> orderlist = new ArrayList<Orderlist>();
		String username = (String) request.getSession().getAttribute("username");
		
		List<Orderlist> orderlists = new ArrayList<Orderlist>();
		try {
			orderlist = orderlistService.selectOrderlist();//调用方法获取商品
			for(Orderlist oi : orderlist){
				System.out.println("好的好的好的好的好的好的好的好的好的"+oi.getOid());
				
				if(orderService.findById((Integer)oi.getOid()).getUsername().equals(username)){
					orderlists.add(oi);
					System.out.println(oi.getName());
				}
			}
			session.setAttribute("orderlists", orderlists);//传到前端
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("jashfjksv卡卡双方都开始看看思考思考思考思"
				+ "考思考思考看看思考思考思考思考思考思考库斯库斯看看思考思考思考思考思考思考开始看库斯库斯库斯库斯");
		
		
		return "Orderlist";
	}
}
