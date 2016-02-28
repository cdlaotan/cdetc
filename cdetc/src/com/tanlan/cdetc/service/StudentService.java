package com.tanlan.cdetc.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.tanlan.cdetc.entity.PageBean;
import com.tanlan.cdetc.entity.Student;
import com.tanlan.cdetc.utils.EtcConstant;
import com.tanlan.cdetc.utils.EtcUtils;

/**
 * 学生操作类
 * 
 * @author tanlan
 * 
 */
@Service
public class StudentService {
	private static final Logger logger = Logger.getLogger(StudentService.class);
	@Resource
	private DAO dao;

	public void addStudent(Student student) {
		student.setStatus("1");
		String sql = "insert into etc_student values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = { EtcUtils.getId(), student.getName(),
				student.getGender(), student.getIdCard(),
				student.getBirthDate(), student.getPhoto(),
				student.getEducation(), student.getCollegeId(),
				student.getMajorId(), student.getGraduTime(),
				student.getAddress(), student.getPhoneNum(), student.getQq(),
				student.getClassId(), student.getSource(), student.getSale(),
				student.getDescription(), student.getUserId(),
				student.getStatus() };
		dao.execSQL(sql, params);
	}

	public PageBean<Student> getStudents(int page, Student student) {
		PageBean<Student> pageBean = new PageBean<Student>();
		String sql = "select * from v_student where 1=1 "
				+ createCondition(student) + " limit ?,?";
		logger.debug(sql);
		List<Student> data = dao.getResult(sql, Student.class, (page - 1)
				* EtcConstant.sizeOfPage, EtcConstant.sizeOfPage);
		sql = "select count(*) from v_student where 1=1 "
				+ createCondition(student);
		int totalNums = dao.getScalarResult(sql, Long.class).intValue();
		int totalPage = totalNums % EtcConstant.sizeOfPage == 0 ? totalNums
				/ EtcConstant.sizeOfPage : totalNums / EtcConstant.sizeOfPage
				+ 1;
		pageBean.setData(data);
		pageBean.setPage(page);
		pageBean.setActualPageSize(data.size());
		pageBean.setPageSize(EtcConstant.sizeOfPage);
		pageBean.setTotalNums(totalNums);
		pageBean.setTotalPage(totalPage);

		return pageBean;
	}

	private String createCondition(Student student) {
		if (student == null) {
			return "";
		}
		String condition = "";
		if (EtcUtils.isNotEmpty(student.getName())) {
			condition += " and name like '%" + student.getName() + "%'";
		}
		return condition;
	}
}
