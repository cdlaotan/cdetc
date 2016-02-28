package com.tanlan.cdetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tanlan.cdetc.entity.Authority;
import com.tanlan.cdetc.entity.Role;
import com.tanlan.cdetc.utils.EtcUtils;

@Service
public class RoleService {
	@Resource
	private DAO dao;

	public void addRole(Role role, int[] authIds) {
		String roleId = EtcUtils.getId();
		dao.execSQL("insert into etc_role values(?,?,?)", roleId,
				role.getName(), role.getDescription());
		Object[][] params = new Object[authIds.length][];
		for (int i = 0; i < params.length; i++) {
			params[i] = new Object[] { roleId, authIds[i] };
		}
		dao.execBatchSQL("insert into etc_role_auth values(?,?)", params);
	}

	public void updateRole(Role role, int[] authIds) {
		Role oldRole = dao.getSingleResult("select * from etc_role where id=?",
				Role.class, role.getId());
		oldRole.setName(role.getName());
		oldRole.setDescription(role.getDescription());
		dao.execSQL("update etc_role set name=?,description=? where id=?",
				oldRole.getName(), oldRole.getDescription(), oldRole.getId());
		dao.execSQL("delete from etc_role_auth where roleid=?", role.getId());
		Object[][] params = new Object[authIds.length][];
		for (int i = 0; i < params.length; i++) {
			params[i] = new Object[] { role.getId(), authIds[i] };
		}
		dao.execBatchSQL("insert into etc_role_auth values(?,?)", params);
	}

	public List<Role> getRoles() {
		return dao.getResult("select * from etc_role", Role.class);
	}

	public Role getRoleById(String id) {
		Role role = dao.getSingleResult("select * from etc_role where id=?",
				Role.class, id);
		if (role != null) {
			String sql = "SELECT a.*,ar.roleid FROM etc_authority a,etc_role_auth ar WHERE a.id=ar.authid and ar.roleid=?";
			List<Authority> authorities = dao.getResult(sql, Authority.class,
					id);
			role.setAuthorities(authorities);
		}
		return role;
	}
}
