package com.greenart.sample.service.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greenart.sample.model.UserVO;
import com.greenart.sample.repository.users.UserDao;


@Service
public class UserServiceImpl implements UserService{

	
	 @Autowired//UserDao에 있는것 가지고 온것 
	 UserDao dao;
	 
	
	@Override
	public int idCheck(String userid) {
		
		return dao.idCheck(userid);
	}


	@Override
	public int setUser(UserVO vo) {
		
		return dao.setUser(vo);
	}

}
