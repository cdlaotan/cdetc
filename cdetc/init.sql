DELETE FROM etc_authority;
INSERT INTO  etc_authority VALUES(1,'系统管理','',0,1,'','0');
INSERT INTO  etc_authority VALUES(2,'组织结构','',0,1,'','0');
INSERT INTO  etc_authority VALUES(3,'教学管理','',0,1,'','0');
INSERT INTO  etc_authority VALUES(4,'学习平台','',0,1,'','0');
INSERT INTO  etc_authority VALUES(5,'在线考试','',0,1,'','0');
INSERT INTO  etc_authority VALUES(6,'在线交流','',0,1,'','0');
INSERT INTO  etc_authority VALUES(7,'调查反馈','',0,1,'','0');
INSERT INTO  etc_authority VALUES(8,'个人中心','',0,1,'','0');

INSERT INTO  etc_authority VALUES(101,'角色管理','role/list',1,2,'','0');
INSERT INTO  etc_authority VALUES(1011,'查询','',101,3,'','0');
INSERT INTO  etc_authority VALUES(1012,'增加','',101,3,'','0');
INSERT INTO  etc_authority VALUES(1013,'更新','',101,3,'','0');
INSERT INTO  etc_authority VALUES(1014,'删除','',101,3,'','0');
INSERT INTO  etc_authority VALUES(102,'用户管理','user/list',1,2,'','0');
INSERT INTO  etc_authority VALUES(1021,'查询','',102,3,'','0');
INSERT INTO  etc_authority VALUES(1022,'增加','',102,3,'','0');
INSERT INTO  etc_authority VALUES(1023,'更新','',102,3,'','0');
INSERT INTO  etc_authority VALUES(1024,'删除','',102,3,'','0');
INSERT INTO  etc_authority VALUES(103,'权限管理','authority/list',1,2,'','0');
/*
INSERT INTO  etc_authority VALUES(105,'权限列表','',1,2,'','0');
INSERT INTO  etc_authority VALUES(106,'权限增加','',1,2,'','0');
INSERT INTO  etc_authority VALUES(107,'权限分配','',1,2,'','0');
*/

INSERT INTO  etc_authority VALUES(201,'院校管理','college/list',2,2,'','0');
INSERT INTO  etc_authority VALUES(2011,'查询','',201,3,'','0');
INSERT INTO  etc_authority VALUES(2012,'增加','',201,3,'','0');
INSERT INTO  etc_authority VALUES(2013,'更新','',201,3,'','0');
INSERT INTO  etc_authority VALUES(2014,'删除','',201,3,'','0');
INSERT INTO  etc_authority VALUES(202,'专业管理','major/list',2,2,'','0');
INSERT INTO  etc_authority VALUES(2021,'查询','',202,3,'','0');
INSERT INTO  etc_authority VALUES(2022,'增加','',202,3,'','0');
INSERT INTO  etc_authority VALUES(2023,'更新','',202,3,'','0');
INSERT INTO  etc_authority VALUES(2024,'删除','',202,3,'','0');
INSERT INTO  etc_authority VALUES(203,'老师管理','teacher/list',2,2,'','0');
INSERT INTO  etc_authority VALUES(2031,'查询','',203,3,'','0');
INSERT INTO  etc_authority VALUES(2032,'增加','',203,3,'','0');
INSERT INTO  etc_authority VALUES(2033,'更新','',203,3,'','0');
INSERT INTO  etc_authority VALUES(2034,'删除','',203,3,'','0');
INSERT INTO  etc_authority VALUES(204,'班级列表','class/list',2,2,'','0');
INSERT INTO  etc_authority VALUES(2041,'查询','',204,3,'','0');
INSERT INTO  etc_authority VALUES(2042,'增加','',204,3,'','0');
INSERT INTO  etc_authority VALUES(2043,'更新','',204,3,'','0');
INSERT INTO  etc_authority VALUES(2044,'删除','',204,3,'','0');
INSERT INTO  etc_authority VALUES(205,'学员管理','student/list',2,2,'','0');
INSERT INTO  etc_authority VALUES(2051,'查询','',205,3,'','0');
INSERT INTO  etc_authority VALUES(2052,'增加','',205,3,'','0');
INSERT INTO  etc_authority VALUES(2053,'更新','',205,3,'','0');
INSERT INTO  etc_authority VALUES(2054,'删除','',205,3,'','0');

INSERT INTO  etc_authority VALUES(301,'教学安排','teachplan/list',3,2,'','0');
INSERT INTO  etc_authority VALUES(302,'教学日志','teachplan/list',3,2,'','0');
INSERT INTO  etc_authority VALUES(303,'月度绩效','teachplan/list',3,2,'','0');
INSERT INTO  etc_authority VALUES(304,'人员数据统计','',3,2,'','0');

INSERT INTO  etc_authority VALUES(401,'科目管理','subject/list',4,2,'','0');
INSERT INTO  etc_authority VALUES(4011,'查询','',401,3,'','0');
INSERT INTO  etc_authority VALUES(4012,'增加','',401,3,'','0');
INSERT INTO  etc_authority VALUES(4013,'更新','',401,3,'','0');
INSERT INTO  etc_authority VALUES(4014,'删除','',401,3,'','0');
INSERT INTO  etc_authority VALUES(402,'课程管理','course/list',4,2,'','0');
INSERT INTO  etc_authority VALUES(4021,'查询','',402,3,'','0');
INSERT INTO  etc_authority VALUES(4022,'增加','',402,3,'','0');
INSERT INTO  etc_authority VALUES(4023,'更新','',402,3,'','0');
INSERT INTO  etc_authority VALUES(4024,'删除','',402,3,'','0');
INSERT INTO  etc_authority VALUES(403,'知识点管理','knowledge/list',4,2,'','0');
INSERT INTO  etc_authority VALUES(4031,'查询','',403,3,'','0');
INSERT INTO  etc_authority VALUES(4032,'增加','',403,3,'','0');
INSERT INTO  etc_authority VALUES(4033,'更新','',403,3,'','0');
INSERT INTO  etc_authority VALUES(4034,'删除','',403,3,'','0');

INSERT INTO  etc_authority VALUES(501,'题型管理','questype/list',5,2,'','0');
INSERT INTO  etc_authority VALUES(502,'题目管理','question/list',5,2,'','0');
INSERT INTO  etc_authority VALUES(5021,'查询','',502,3,'','0');
INSERT INTO  etc_authority VALUES(5022,'增加','',502,3,'','0');
INSERT INTO  etc_authority VALUES(5023,'更新','',502,3,'','0');
INSERT INTO  etc_authority VALUES(5024,'删除','',502,3,'','0');
INSERT INTO  etc_authority VALUES(503,'试卷管理','paper/list',5,2,'','0');
INSERT INTO  etc_authority VALUES(5031,'查询','',503,3,'','0');
INSERT INTO  etc_authority VALUES(5032,'增加','',503,3,'','0');
INSERT INTO  etc_authority VALUES(5033,'更新','',503,3,'','0');
INSERT INTO  etc_authority VALUES(5034,'删除','',503,3,'','0');
INSERT INTO  etc_authority VALUES(504,'组织考试','',5,2,'','0');
INSERT INTO  etc_authority VALUES(5041,'查询','',504,3,'','0');
INSERT INTO  etc_authority VALUES(5042,'增加','',504,3,'','0');
INSERT INTO  etc_authority VALUES(5043,'更新','',504,3,'','0');
INSERT INTO  etc_authority VALUES(5044,'删除','',504,3,'','0');
INSERT INTO  etc_authority VALUES(505,'成绩统计','',5,2,'','0');

INSERT INTO  etc_authority VALUES(601,'进入论坛','',6,2,'','0');
INSERT INTO  etc_authority VALUES(602,'进入博客','',6,2,'','0');

INSERT INTO  etc_authority VALUES(701,'调查列表','',7,2,'','0');
INSERT INTO  etc_authority VALUES(702,'调查增加','',7,2,'','0');
INSERT INTO  etc_authority VALUES(703,'调查结果','',7,2,'','0');

INSERT INTO  etc_authority VALUES(801,'更新个人信息','',8,2,'','0');
INSERT INTO  etc_authority VALUES(802,'我的主贴','',8,2,'','0');
INSERT INTO  etc_authority VALUES(803,'我的回帖','',8,2,'','0');
INSERT INTO  etc_authority VALUES(804,'我的文章','',8,2,'','0');
INSERT INTO  etc_authority VALUES(805,'我的评论','',8,2,'','0');
INSERT INTO  etc_authority VALUES(806,'我组织的考试','',8,2,'','0');
INSERT INTO  etc_authority VALUES(807,'我参与的考试','',8,2,'','0');

/*增加超级管理员角色*/
INSERT INTO etc_role VALUES('1','超级管理员','拥有最多权限的角色');
INSERT INTO etc_role_auth VALUES('1',1);
INSERT INTO etc_role_auth VALUES('1',2);
INSERT INTO etc_role_auth VALUES('1',3);
INSERT INTO etc_role_auth VALUES('1',4);
INSERT INTO etc_role_auth VALUES('1',5);
INSERT INTO etc_role_auth VALUES('1',6);
INSERT INTO etc_role_auth VALUES('1',7);

INSERT INTO etc_role_auth VALUES('1',101);
INSERT INTO etc_role_auth VALUES('1',102);
INSERT INTO etc_role_auth VALUES('1',103);
INSERT INTO etc_role_auth VALUES('1',104);
INSERT INTO etc_role_auth VALUES('1',105);
INSERT INTO etc_role_auth VALUES('1',106);
INSERT INTO etc_role_auth VALUES('1',107);

INSERT INTO etc_role_auth VALUES('1',201);
INSERT INTO etc_role_auth VALUES('1',202);
INSERT INTO etc_role_auth VALUES('1',203);
INSERT INTO etc_role_auth VALUES('1',204);
INSERT INTO etc_role_auth VALUES('1',205);
INSERT INTO etc_role_auth VALUES('1',206);
INSERT INTO etc_role_auth VALUES('1',207);
INSERT INTO etc_role_auth VALUES('1',208);
INSERT INTO etc_role_auth VALUES('1',209);
INSERT INTO etc_role_auth VALUES('1',210);
INSERT INTO etc_role_auth VALUES('1',211);
INSERT INTO etc_role_auth VALUES('1',212);

INSERT INTO etc_role_auth VALUES('1',301);
INSERT INTO etc_role_auth VALUES('1',302);
INSERT INTO etc_role_auth VALUES('1',303);
INSERT INTO etc_role_auth VALUES('1',304);
INSERT INTO etc_role_auth VALUES('1',305);
INSERT INTO etc_role_auth VALUES('1',306);

INSERT INTO etc_role_auth VALUES('1',401);
INSERT INTO etc_role_auth VALUES('1',402);
INSERT INTO etc_role_auth VALUES('1',403);
INSERT INTO etc_role_auth VALUES('1',404);
INSERT INTO etc_role_auth VALUES('1',405);
INSERT INTO etc_role_auth VALUES('1',406);
INSERT INTO etc_role_auth VALUES('1',407);

INSERT INTO etc_role_auth VALUES('1',501);
INSERT INTO etc_role_auth VALUES('1',502);

INSERT INTO etc_role_auth VALUES('1',601);
INSERT INTO etc_role_auth VALUES('1',602);

INSERT INTO etc_role_auth VALUES('1',701);
INSERT INTO etc_role_auth VALUES('1',702);
INSERT INTO etc_role_auth VALUES('1',703);
INSERT INTO etc_role_auth VALUES('1',704);
INSERT INTO etc_role_auth VALUES('1',705);
INSERT INTO etc_role_auth VALUES('1',706);
INSERT INTO etc_role_auth VALUES('1',707);

/*增加超级管理员*/
INSERT INTO etc_user VALUES('1','admin','admin',NULL,NULL,NULL,1,'1');

/*增加题型*/
INSERT INTO etc_questype VALUES(1,'选择题',0);
INSERT INTO etc_questype VALUES(2,'判断题',0);
INSERT INTO etc_questype VALUES(3,'填空题',0);
INSERT INTO etc_questype VALUES(4,'简答题',0);
INSERT INTO etc_questype VALUES(5,'编程题',0);

/*用于简化学生查询的视图*/
CREATE OR REPLACE VIEW v_student
AS
SELECT s.*,
	   c.name collegename,
	   m.name majorname,
	   cl.name classname,
	   u. account
FROM etc_student s
	LEFT JOIN etc_college c ON s.collegeid=c.id
	LEFT JOIN etc_major m ON s.majorid=m.id
	LEFT JOIN etc_class cl ON  s.classid=cl.id
	LEFT JOIN etc_user u ON s.userid=u.id;
/*用于简化登录时根据用户的帐号与密码获取权限菜单*/
CREATE OR REPLACE VIEW v_auth
AS
	SELECT a.*,u.account,u.password 
	FROM etc_authority a,etc_user u,etc_role_auth ra
	WHERE u.roleid=ra.roleid 
	     AND ra.authid=a.id 
	     AND a.level<3 
	     AND a.status='0';

/*将学员和讲师的数据查询语句建成一个视图*/
 CREATE OR REPLACE VIEW v_studentandteacher
 AS
   SELECT s.userid,s.name 
 FROM etc_student s
 UNION ALL
 SELECT t.userid,t.name FROM etc_teacher t;

/*简化用户查询，带出角色名和分配到的学员或讲师姓名*/
CREATE OR REPLACE VIEW v_user
AS
SELECT
 u.*,r.name roleName,st.name assignName
 FROM etc_user u
 LEFT JOIN etc_role r ON u.roleid=r.id
 LEFT JOIN v_studentandteacher st
 ON u.id=st.userid;
 

	
	