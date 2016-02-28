package com.tanlan.cdetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.tanlan.cdetc.entity.Authority;
import com.tanlan.cdetc.entity.PageBean;
import com.tanlan.cdetc.entity.User;
import com.tanlan.cdetc.utils.EtcUtils;

@Repository
public class UserService {
	@Resource
	private DAO dao;

	public void addUser(User user, String assignId) {
		String sql = "insert into etc_user values(?,?,?,?,?,?,?,?,?)";
		String id = EtcUtils.getId();
		Object[] params = { id, user.getAccount(), user.getPassword(),
				user.getLastLoginTime(), user.getLastLoginIP(), user.getType(),
				user.getImage(), user.getStatus(), user.getRole() };
		dao.execSQL(sql, params);
		if (user.getType().equals("s")) {
			sql = "update etc_student set userid=? where id=?";
			dao.execSQL(sql, id, assignId);
		} else if (user.getType().equals("t")) {
			sql = "update etc_teacher set userid=? where id=?";
			dao.execSQL(sql, id, assignId);
		}
	}

	public PageBean<User> getUsers(int page, User user) {
		PageBean<User> pageBean = new PageBean<>();
		List<User> data = dao.getResult("select * from v_user", User.class);
		pageBean.setData(data);
		return pageBean;
	}

	public User getUserByAccountAndPwd(String account, String password) {
		User user = dao.getSingleResult(
				"select u.*,r.name rolename from etc_user u,etc_role r where u.roleid=r.id and account=? and password=?",
				User.class, account, password);
		if (user != null) {
			user.setAuthorities(dao.getResult(
					"select * from v_auth where account=? and password=?",
					Authority.class, account, password));
		}
		return user;
	}

	/**
	 * 更新用户的最后登录时间与登录IP
	 * 
	 * @param id
	 * @param ip
	 */
	public void updateLastLoginTime(String id, String ip) {
		dao.execSQL(
				"update etc_user set lastLoginTime=now(),lastLoginIP=? where id=?",
				ip, id);
	}

	public User getUserById(String id) {
		return dao.getSingleResult("select * from v_user where id=?",
				User.class, id);
	}

}
