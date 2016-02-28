package com.tanlan.cdetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tanlan.cdetc.entity.Authority;

@Service
public class AuthorityService {
	@Resource
	private DAO dao;

	public List<Authority> getAuthorities(String account, String password) {
		return dao.getResult(
				"select * from v_auth where account=? and password=?",
				Authority.class, account, password);
	}

	/**
	 * 查询所有的权限菜单
	 * 
	 * @return
	 */
	public List<Authority> getAllAuthorities() {
		return dao.getResult("select * from etc_authority", Authority.class);
	}

	/**
	 * 查询状态为启用的权限菜单
	 * 
	 * @return
	 */
	public List<Authority> getAuthorities() {
		return dao.getResult("select * from etc_authority where status=0",
				Authority.class);
	}

	/**
	 * 批量更新权限菜单的状态
	 * 
	 * @param authIds
	 * @param status
	 */
	public void updateStatus(int[] authIds, String status) {
		String sql = "update etc_authority set status=? where id=?";
		Object[][] params = new Object[authIds.length][];
		for (int i = 0; i < params.length; i++) {
			params[i] = new Object[] { status, authIds[i] };
		}
		dao.execBatchSQL(sql, params);
	}
}
