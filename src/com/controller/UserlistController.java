package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.pojo.Userlist;

import com.service.UserlistService;



@Controller
@RequestMapping("/userlist")
public class UserlistController {
	@Resource(name="userlistService")
	private UserlistService userlistService;
	/*
	* 通过username和password获取数据
	*/

	//登录
	@RequestMapping(value="/Login")
	public String Login(Model model,HttpServletRequest request, HttpServletResponse response,HttpSession session,String username,String password){
		try{
			
			Userlist user = userlistService.Login(username,password);
			System.out.println(user.getTouImg());
			int id = user.getId();
			String tou_img = user.getTouImg();
			String sex = user.getSex();
			int age = user.getAge();
			String qq = user.getQq();
			String eMail = user.geteMail();
			String uaddress = user.getUaddress();
			if(user != null){
				session.setAttribute("username", username);
				session.setAttribute("tou_img", tou_img);
				session.setAttribute("id", id);
				session.setAttribute("password", password);
				session.setAttribute("sex", sex);
				session.setAttribute("age", age);
				session.setAttribute("qq", qq);
				session.setAttribute("eMail", eMail);
				session.setAttribute("uaddress", uaddress);
				
				String phoneNumber = username.substring(0, 3) + "****" + username.substring(7, username.length());
				session.setAttribute("phoneNumber", phoneNumber);
			}
		} catch(Exception e){
            e.printStackTrace();
		}
		return "redirect:/commodity_info/ListCommodity";
	}
	
	//注册
	@RequestMapping(value="/insert")
	public ModelAndView insert(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		
		//PrintWriter out = response.getWriter();

		//创建FileItem对象工厂
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		String dir = "C:/Users/admin/Desktop/TouchFood/TouchFood/WebRoot/img/avert/";
		//如果没以下两行设置的话，上传大的 文件 会占用 很多内存，  
		//设置暂时存放的 存储室 , 这个存储室，可以和 最终存储文件 的目录不同  
		/** 
		 * 原理 它是先存到 暂时存储室，然后在真正写到 对应目录的硬盘上， 
		 * 按理来说 当上传一个文件时，其实是上传了两份，第一个是以 .tem 格式的 
		 * 然后再将其真正写到 对应目录的硬盘上 
		 */
		
		String username = null;
		String password = null;
		String sex = null;
		String qq = null;
		String eMail = null;
		String Age = null;
		String uaddress = null;
		String touImg = "img/avert/";
		//设置文件位置
		factory.setRepository(new File(dir));  
		//设置 缓存的大小，当上传文件的容量超过该缓存时，直接放到 暂时存储室  
		factory.setSizeThreshold(1024*1024) ;  
		//高水平的API文件上传处理  
		ServletFileUpload upload = new ServletFileUpload(factory);
		//解决上传文件名的中文乱码  
        upload.setHeaderEncoding("UTF-8");
         //限制每个上传文件的大小
		upload.setFileSizeMax(1024*1024*2);
		//		 //限制上传文件的总大小
		upload.setSizeMax(1024*1024*4);
		try {  
			//可以上传多个文件  
			@SuppressWarnings("unchecked")
			List<FileItem> list = (List<FileItem>)upload.parseRequest(request);  
			for(FileItem item : list){  
				//获取表单的属性名字  
				String filename = item.getFieldName();  

				if(filename != null){
					if(item.isFormField()){
						String formName = item.getFieldName();
	                	String formValue = item.getString("utf-8");
	                	System.out.println("formName是"+formName);
	                	System.out.println("formValue是"+formValue);
	                	
	                	switch (formName) {
						case "username":
							username = formValue;
							System.out.println(username);
							break;
						case "password":
							password = formValue;
							
							break; 
						case "sex":
							sex = formValue;
							break;
						case "qq":
							qq = formValue;
							break;
						case "e_mail":
							eMail = formValue;
							break;
						case "age":
							Age = formValue;
							break;
						case "uaddress":
							uaddress = formValue;
						default:
							break;
						}

					}else {  
						/** 
						 * 以下三步，主要获取 上传文件的名字 
						 */  
						//获取路径名              
						String fileName = item.getName(); 
						if(fileName!=null){
							//截取扩展名
							String suffix = fileName.substring(fileName.lastIndexOf('.'));
							//生成新的文件名
							String date = ""+new Date().getTime();
							String newfileName = date + suffix; 
							//生成新文件
							File file = new File(dir + newfileName);
							touImg = touImg + newfileName; 
							//新文件的绝对路径						
							item.write(file);
							//
							String path = file.getAbsolutePath();
							System.out.println(path);
							//调用FileItem的delete()方法，删除临时文件  
							
							item.delete();
						}
					}  
				}
			}  
		} catch (FileUploadException e) {  
			e.printStackTrace();  
		}
		catch (Exception e) {  
		}
		
		Integer age = Integer.parseInt(Age);
		Userlist user = new Userlist(username,password, touImg, sex, age, qq, eMail,uaddress);
		System.out.println(user.getId());
		
		
		try {	
			
			userlistService.Register(user);
			
			mv.setViewName("login");
			
			mv.addObject("user", user);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return mv;
		
	}

	//查重
	@ResponseBody
	@RequestMapping(value="/checkUserName")
	protected String checkUserName(String username) throws Exception{
		 	Userlist users;
		
			users = userlistService.selectCheck(username);
			if(users != null){
				return "1";
			}
			return "0";	
	}

	
	//进入详情页
	@RequestMapping(value="/selfInfo")
	public String selfInfo(Model model,HttpServletRequest request, HttpServletResponse response,
			HttpSession session){
		try{
			String username = (String) request.getSession().getAttribute("username");
			Userlist users;
			System.out.println(username);
			users = userlistService.selectCheck(username);
			
			model.addAttribute("users", users);
		} catch(Exception e){
            e.printStackTrace();
		}
		return "user";
	}
	


	//修改个人信息
	@RequestMapping(value="/update")
	public ModelAndView update(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		String dir = "C:/Users/admin/Desktop/TouchFood/TouchFood/WebRoot/img/avert/";
		//如果没以下两行设置的话，上传大的 文件 会占用 很多内存，  
		//设置暂时存放的 存储室 , 这个存储室，可以和 最终存储文件 的目录不同  
		/** 
		 * 原理 它是先存到 暂时存储室，然后在真正写到 对应目录的硬盘上， 
		 * 按理来说 当上传一个文件时，其实是上传了两份，第一个是以 .tem 格式的 
		 * 然后再将其真正写到 对应目录的硬盘上 
		 */
		
		String username = request.getParameter("username");
		String password = null;
		String sex = null;
		String qq = null;
		String eMail = null;
		String Age = null;
		String uaddress = null;
		String touImg = "img/avert/";
		
		//设置文件位置
				factory.setRepository(new File(dir));  
				//设置 缓存的大小，当上传文件的容量超过该缓存时，直接放到 暂时存储室  
				factory.setSizeThreshold(1024*1024) ;  
				//高水平的API文件上传处理  
				ServletFileUpload upload = new ServletFileUpload(factory);
				//解决上传文件名的中文乱码  
		        upload.setHeaderEncoding("UTF-8");
		         //限制每个上传文件的大小
				upload.setFileSizeMax(1024*1024*2);
				//		 //限制上传文件的总大小
				upload.setSizeMax(1024*1024*4);
				try {  
					//可以上传多个文件  
					@SuppressWarnings("unchecked")
					List<FileItem> list = (List<FileItem>)upload.parseRequest(request);  
					for(FileItem item : list){  
						//获取表单的属性名字  
						String filename = item.getFieldName();  

						if(filename != null){
							if(item.isFormField()){
								String formName = item.getFieldName();
			                	String formValue = item.getString("utf-8");
			                	System.out.println("formName是"+formName);
			                	System.out.println("formValue是"+formValue);
			                	
			                	switch (formName) {
								case "username":
									username = formValue;
									System.out.println(username);
									break;
								case "password":
									password = formValue;
									
									break; 
								case "sex":
									sex = formValue;
									break;
								case "qq":
									qq = formValue;
									break;
								case "e_mail":
									eMail = formValue;
									break;
								case "age":
									Age = formValue;
									break;
								case "uaddress":
									uaddress = formValue;
								default:
									break;
								}

							}else {  
								/** 
								 * 以下三步，主要获取 上传文件的名字 
								 */  
								//获取路径名              
								String fileName = item.getName(); 
								if(fileName!=null){
									//截取扩展名
									String suffix = fileName.substring(fileName.lastIndexOf('.'));
									//生成新的文件名
									String date = ""+new Date().getTime();
									String newfileName = date + suffix; 
									//生成新文件
									File file = new File(dir + newfileName);
									touImg = touImg + newfileName; 
									//新文件的绝对路径						
									item.write(file);
									//
									String path = file.getAbsolutePath();
									System.out.println(path);
									//调用FileItem的delete()方法，删除临时文件  
									
									item.delete();
								}
							}  
						}
					}  
				} catch (FileUploadException e) {  
					e.printStackTrace();  
				}
				catch (Exception e) {  
				}
				
				Integer age = Integer.parseInt(Age);
				Userlist user = new Userlist(username,password, touImg, sex, age, qq, eMail,uaddress);
				System.out.println(user.getId());
				
				
				try {	
					
					userlistService.updateInfo(user);
					
					mv.setViewName("login");
					
					mv.addObject("user", user);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				return mv;
		
	}


	
	
	//查询全部用户信息
//	@RequestMapping(value="/Listuserlist")
//	public void Listuserlist(HttpServletRequest req, HttpServletResponse resp)
//	        throws ServletException, IOException {
//		JsonObject object = new JsonObject(); //json数据
//		
//		String page = req.getParameter("page");
//		String rows = req.getParameter("rows");
//		
//		int totalRecord = 0; //总记录数
//		int totalPage = 0; //总页数
//		
//		try {
//			totalRecord = userlistService.findAllCount();
//			totalPage = totalRecord % Integer.parseInt(rows) == 0 ? totalRecord   
//					/ Integer.parseInt(rows) : totalRecord / Integer.parseInt(rows)   
//					+ 1; // 计算总页数
//		} catch (Exception e1) {
//			// TODO: handle exception
//			e1.printStackTrace();
//		}
//		
//		object.addProperty("total", String.valueOf(totalPage));
//		object.addProperty("page",  page);
//		object.addProperty("records", String.valueOf(totalRecord));
//		
//		JsonArray array = new JsonArray();
//		
//		
//		List<Userlist> userlists = new ArrayList<Userlist>();
//		try {
//			userlists = userlistService.findAllusers();
//			int beginNo, endNo;
//			beginNo = Integer.parseInt(rows) * (Integer.parseInt(page) - 1) + 1;
//			endNo = beginNo + Integer.parseInt(rows) - 1;
//			if(endNo >= totalRecord){
//				endNo = totalRecord;
//			}
//			int i = 1;
//			
//			for(Userlist userlist : userlists){
//				if(i >= beginNo && i <= endNo){
//					JsonObject sObject = new JsonObject();
//					sObject.addProperty("id", beginNo);
//					sObject.addProperty("username", userlist.getUsername());
//					sObject.addProperty("password", userlist.getPassword());
//					sObject.addProperty("tou_img", userlist.getTouImg());
//					sObject.addProperty("sex",userlist.getSex());
//					sObject.addProperty("age",userlist.getAge());
//					sObject.addProperty("qq",userlist.getQq());
//					sObject.addProperty("e_mail",userlist.geteMail());
//					array.add(sObject);
//					i++;
//					beginNo++;
//				}
//				else{
//					i++;
//				}
//			}
//			object.add("rows", array);
//			resp.setCharacterEncoding("UTF-8");
//			resp.getWriter().print(object);
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//	}
//	
//	@RequestMapping(value="/deleteUserlist")
//	public String deleteUserlist(@RequestParam("username") String username) throws Exception{
//		
//			userlistService.deleteUserlist(username);
//			
//			if(userlistService.deleteUserlist(username)){
//				return "1";
//			}
//			return "0";
//			
//	}

}


	
