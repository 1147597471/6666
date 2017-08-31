package com.zhiyou100.exam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhiyou100.exam.model.User;
import com.zhiyou100.exam.service.LoginService;


@Controller
public class LoginController {
	@Autowired
	LoginService ls;
	@RequestMapping(value="/user/regist.action",method=RequestMethod.GET)
	public String Regist(){
		return "/regist.jsp"; 
	}
	
	@RequestMapping(value="/user/regist.action",method=RequestMethod.POST)
	public String Regist(User u){
		//System.out.println(u);
		List<User> list =ls.findLoginUser(u);
		if(list.size()==0){
			ls.insertUser(u);
			return "/login.jsp"; 
		}else{
			return "/regist.jsp";
		}
		
	}
	
	@RequestMapping(value="/user/login.action",method=RequestMethod.GET)
	public String Login(){
		return "/login.jsp"; 
	}
	
	@RequestMapping(value="/user/login.action",method=RequestMethod.POST)
	public String Login(User u,Model md){
		//System.out.println(u);
		List<User> list =ls.findLoginUser(u);
		if(list.size()==0){
			return "/login.jsp"; 
		}else{
			md.addAttribute("list", list);
			return "/admin.jsp";
		}
		
	}
	
	
	@RequestMapping("/user/queryname.action")
	@ResponseBody
	public String queryname(User u){
		System.out.println(u);
		List<User> list =ls.findRegistName(u);
		if(list.size()==0){
			return "false"; 
		}else{
			return "true";
		}
	}
	
}
