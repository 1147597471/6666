package com.zhiyou100.exam.service;

import java.util.List;

import com.zhiyou100.exam.model.User;

public interface LoginService {

	List<User> findLoginUser(User u);

	void insertUser(User u);

	List<User> findRegistName(User u);

}
