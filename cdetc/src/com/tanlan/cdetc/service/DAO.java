package com.tanlan.cdetc.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

/**
 * 封装数据库操作的工具类
 * 
 * @author tanlan
 * 
 */
@Repository
public class DAO {
	private static Logger logger = Logger.getLogger(DAO.class);
	@Resource
	private DataSource dataSource;

	/**
	 * 执行增加，删除和修改的SQL
	 * 
	 * @param sql
	 * @param params
	 */
	public void execSQL(String sql, Object... params) {
		QueryRunner qr = new QueryRunner(dataSource);
		try {
			logger.debug(sql);
			for (Object object : params) {
				logger.debug(object);
			}
			qr.update(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 批量执行增加，删除和修改的SQL
	 * 
	 * @param sql
	 * @param params
	 */
	public void execBatchSQL(String sql, Object[]... params) {
		QueryRunner qr = new QueryRunner(dataSource);
		try {
			qr.batch(sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 执行查询多条结果的SQL语句
	 * 
	 * @param sql
	 * @param c
	 * @param params
	 * @return
	 */
	public <T> List<T> getResult(String sql, Class<T> c, Object... params) {
		QueryRunner qr = new QueryRunner(dataSource);
		try {
			return qr.query(sql, new BeanListHandler<T>(c), params);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServiceException("执行查询出错！");
		}
	}

	/**
	 * 查询单个结果
	 * 
	 * @param sql
	 * @param c
	 * @param params
	 * @return 单个实体，若查不到，则返回null
	 */
	public <T> T getSingleResult(String sql, Class<T> c, Object... params) {
		QueryRunner qr = new QueryRunner(dataSource);
		try {
			return qr.query(sql, new BeanHandler<T>(c), params);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServiceException("执行查询出错！");
		}
	}

	/**
	 * 执行查询标量的SQL语句
	 * 
	 * @param sql
	 * @param c
	 * @param params
	 * @return
	 */
	public <T> T getScalarResult(String sql, Class<T> c, Object... params) {
		QueryRunner qr = new QueryRunner(dataSource);
		try {
			return qr.query(sql, new ScalarHandler<T>(), params);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new ServiceException("执行查询出错！");
		}
	}
}
