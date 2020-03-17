package com.bbs.service.impl;

import java.text.ParseException;
import java.util.List;

import com.bbs.dao.user.Userdao;
import com.bbs.dao.user.impl.UserdaoImpl;
import com.bbs.entity.User;
import com.bbs.service.UserService;

public class UserServiceImpl implements UserService {

	//创建数据访问层的对象
	private Userdao dao=new UserdaoImpl();
	@Override
	public boolean Verification(String userId, String userPsw) {
		int result=dao.Verification(userId, userPsw);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public boolean save(User user) {
		int result=dao.save(user);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public List<User> getUserList() throws ParseException {
		// TODO Auto-generated method stub
		return dao.getUserList();
	}
	@Override
	public User findEdit(String userId) {
		// TODO Auto-generated method stub
		return dao.findEdit(userId);
	}
	@Override
	public boolean delAll(String userIds) {
		// 将字符串中的所有引号去掉，并截取[]中的数据
		// test001,test002
		userIds = userIds.substring(1, userIds.lastIndexOf("]")).replaceAll("\"", "");
		// 将字符窜进行拆分为数组
		String[] uids = userIds.split(",");
		int result=dao.delAll(uids);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public boolean delById(String userId) {
		int result=dao.delById(userId);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public List<User> findById(String userId) {
		// TODO Auto-generated method stub
		return dao.findById(userId);
	}
	@Override
	public boolean update(User user) {
		int result=dao.update(user);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public boolean verification(String userId, String userPsw) {
		int result =  dao.verification(userId,userPsw);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

}
