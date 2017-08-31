package com.zhiyou100.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhiyou100.exam.mapper.UserMapper;
import com.zhiyou100.exam.model.User;
import com.zhiyou100.exam.model.UserExample;
import com.zhiyou100.exam.service.LoginService;
@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	UserMapper um;
	@Override
	public List<User> findLoginUser(User u) {
		UserExample ex = new UserExample();
		ex.createCriteria().andNameEqualTo(u.getName()).andPwdEqualTo(u.getPwd());
		List<User> list = um.selectByExample(ex);
		
		return list;
	}
	@Override
	public void insertUser(User u) {
		um.insert(u);
		
	}
	@Override
	public List<User> findRegistName(User u) {
		UserExample ex = new UserExample();
		ex.createCriteria().andNameEqualTo(u.getName());
		return um.selectByExample(ex);
	}
	
}
