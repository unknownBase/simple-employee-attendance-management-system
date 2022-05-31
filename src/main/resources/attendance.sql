/*
 Navicat Premium Data Transfer

 Source Server         : 数据库
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : attendancesystem

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 25/05/2022 17:24:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for t_appeal
-- ----------------------------
DROP TABLE IF EXISTS `t_appeal`;
CREATE TABLE `t_appeal`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appeal_reason` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `submit_time` datetime(6) NULL DEFAULT NULL,
  `audit_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `audit_time` datetime(6) NULL DEFAULT NULL,
  `audit_illustrate` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `attendance_id` bigint(20) NOT NULL,
  `audit_state_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_appeal_attendance_id_8e497531_fk_t_attendance_id`(`attendance_id`) USING BTREE,
  INDEX `t_appeal_audit_state_id_5786edab_fk_t_auditState_id`(`audit_state_id`) USING BTREE,
  INDEX `t_appeal_employee_id_cb5a0be2_fk_t_employee_id`(`employee_id`) USING BTREE,
  CONSTRAINT `t_appeal_attendance_id_8e497531_fk_t_attendance_id` FOREIGN KEY (`attendance_id`) REFERENCES `t_attendance` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_appeal_audit_state_id_5786edab_fk_t_auditState_id` FOREIGN KEY (`audit_state_id`) REFERENCES `t_auditstate` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_appeal_employee_id_cb5a0be2_fk_t_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `t_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_appeal
-- ----------------------------
INSERT INTO `t_appeal` VALUES (1, '忘记打卡，实际未缺勤', '2022-04-09 16:01:23.000000', '邓金旺', '2022-04-09 16:02:52.000000', '', 1, 2, 1);
INSERT INTO `t_appeal` VALUES (2, '忘记打卡', '2022-04-29 10:48:55.000000', '程军', NULL, '', 3, 1, 2);
INSERT INTO `t_appeal` VALUES (3, '实际未缺勤', '2022-04-22 18:52:00.000000', '丁刚', NULL, NULL, 10, 1, 10);
INSERT INTO `t_appeal` VALUES (4, '测试', '2022-05-02 11:33:42.000000', '邓金旺', NULL, '', 6, 1, 1);

-- ----------------------------
-- Table structure for t_attendance
-- ----------------------------
DROP TABLE IF EXISTS `t_attendance`;
CREATE TABLE `t_attendance`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `start_time` time(6) NULL DEFAULT NULL,
  `lunch_start` time(6) NULL DEFAULT NULL,
  `lunch_end` time(6) NULL DEFAULT NULL,
  `end_time` time(6) NULL DEFAULT NULL,
  `attendanceMechanism_id` bigint(20) NOT NULL,
  `attendanceState_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_attendance_attendanceMechanism__f5b581df_fk_t_attenda`(`attendanceMechanism_id`) USING BTREE,
  INDEX `t_attendance_attendanceState_id_169e1f4f_fk_t_attendanceState_id`(`attendanceState_id`) USING BTREE,
  INDEX `t_attendance_employee_id_15e997fa_fk_t_employee_id`(`employee_id`) USING BTREE,
  CONSTRAINT `t_attendance_attendanceMechanism__f5b581df_fk_t_attenda` FOREIGN KEY (`attendanceMechanism_id`) REFERENCES `t_attendancemechanism` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_attendance_attendanceState_id_169e1f4f_fk_t_attendanceState_id` FOREIGN KEY (`attendanceState_id`) REFERENCES `t_attendancestate` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_attendance_employee_id_15e997fa_fk_t_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `t_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_attendance
-- ----------------------------
INSERT INTO `t_attendance` VALUES (1, '2022-04-09', '08:34:38.000000', NULL, NULL, '18:34:54.000000', 1, 2, 1);
INSERT INTO `t_attendance` VALUES (2, '2022-04-09', '08:35:22.000000', NULL, NULL, '18:35:29.000000', 1, 9, 2);
INSERT INTO `t_attendance` VALUES (3, '2022-04-26', NULL, NULL, NULL, NULL, 1, 1, 2);
INSERT INTO `t_attendance` VALUES (4, '2022-04-26', '08:09:39.000000', NULL, NULL, NULL, 1, 2, 4);
INSERT INTO `t_attendance` VALUES (5, '2022-04-28', NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `t_attendance` VALUES (6, '2022-04-27', NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `t_attendance` VALUES (7, '2022-04-25', NULL, NULL, NULL, NULL, 1, 1, 3);
INSERT INTO `t_attendance` VALUES (8, '2022-04-24', NULL, NULL, NULL, NULL, 1, 1, 3);
INSERT INTO `t_attendance` VALUES (9, '2022-04-23', '08:10:12.000000', NULL, NULL, NULL, 1, 2, 5);
INSERT INTO `t_attendance` VALUES (10, '2022-04-22', NULL, NULL, NULL, NULL, 1, 1, 10);
INSERT INTO `t_attendance` VALUES (11, '2022-04-21', NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO `t_attendance` VALUES (12, '2022-04-20', '09:10:20.000000', NULL, NULL, NULL, 1, 3, 5);
INSERT INTO `t_attendance` VALUES (13, '2022-04-19', NULL, NULL, NULL, NULL, 1, 1, 7);
INSERT INTO `t_attendance` VALUES (14, '2022-04-18', NULL, NULL, NULL, NULL, 1, 1, 7);
INSERT INTO `t_attendance` VALUES (15, '2022-04-17', NULL, NULL, NULL, NULL, 1, 1, 9);
INSERT INTO `t_attendance` VALUES (16, '2022-04-16', NULL, NULL, NULL, NULL, 1, 1, 8);
INSERT INTO `t_attendance` VALUES (17, '2022-04-15', NULL, NULL, NULL, NULL, 1, 1, 8);
INSERT INTO `t_attendance` VALUES (18, '2022-05-01', '08:09:57.000000', NULL, NULL, NULL, 1, 2, 7);
INSERT INTO `t_attendance` VALUES (19, '2022-05-17', '08:01:40.000000', NULL, NULL, '23:13:49.000000', 1, 10, 11);

-- ----------------------------
-- Table structure for t_attendancemechanism
-- ----------------------------
DROP TABLE IF EXISTS `t_attendancemechanism`;
CREATE TABLE `t_attendancemechanism`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mechanism` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `enable_state` smallint(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_attendancemechanism
-- ----------------------------
INSERT INTO `t_attendancemechanism` VALUES (1, '一天两次', 1);
INSERT INTO `t_attendancemechanism` VALUES (2, '一天四次', 0);

-- ----------------------------
-- Table structure for t_attendancestate
-- ----------------------------
DROP TABLE IF EXISTS `t_attendancestate`;
CREATE TABLE `t_attendancestate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attendance_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_attendancestate
-- ----------------------------
INSERT INTO `t_attendancestate` VALUES (1, '未考勤');
INSERT INTO `t_attendancestate` VALUES (2, '正常上班');
INSERT INTO `t_attendancestate` VALUES (3, '上班迟到');
INSERT INTO `t_attendancestate` VALUES (4, '上班缺勤');
INSERT INTO `t_attendancestate` VALUES (5, '下班早退');
INSERT INTO `t_attendancestate` VALUES (6, '上班迟到且下班早退');
INSERT INTO `t_attendancestate` VALUES (7, '上班缺勤且下班早退');
INSERT INTO `t_attendancestate` VALUES (8, '全天缺勤');
INSERT INTO `t_attendancestate` VALUES (9, '全天已考勤');
INSERT INTO `t_attendancestate` VALUES (10, '存在加班现象');
INSERT INTO `t_attendancestate` VALUES (11, '午休早退');
INSERT INTO `t_attendancestate` VALUES (12, '正常午休');
INSERT INTO `t_attendancestate` VALUES (13, '上班迟到且午休早退');
INSERT INTO `t_attendancestate` VALUES (14, '午休结束');
INSERT INTO `t_attendancestate` VALUES (15, '午休结束迟到');
INSERT INTO `t_attendancestate` VALUES (16, '上班迟到且午休早退及迟到');
INSERT INTO `t_attendancestate` VALUES (17, '上班缺勤且午休结束迟到');
INSERT INTO `t_attendancestate` VALUES (18, '午休早退及迟到');
INSERT INTO `t_attendancestate` VALUES (19, '上班迟到且下午缺勤');

-- ----------------------------
-- Table structure for t_auditstate
-- ----------------------------
DROP TABLE IF EXISTS `t_auditstate`;
CREATE TABLE `t_auditstate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `audit_state` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_auditstate
-- ----------------------------
INSERT INTO `t_auditstate` VALUES (1, '未审核');
INSERT INTO `t_auditstate` VALUES (2, '审核通过');
INSERT INTO `t_auditstate` VALUES (3, '审核未通过');

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `department_name`(`department_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES (1, '产品部');
INSERT INTO `t_department` VALUES (7, '人力资源部');
INSERT INTO `t_department` VALUES (3, '技术部');
INSERT INTO `t_department` VALUES (6, '行政部');
INSERT INTO `t_department` VALUES (2, '设计部');
INSERT INTO `t_department` VALUES (5, '财务部');
INSERT INTO `t_department` VALUES (4, '运营部');

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `real_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` smallint(6) NOT NULL,
  `age` smallint(6) NOT NULL,
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_time` date NOT NULL,
  `department_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `work_state` smallint(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `tel`(`tel`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  INDEX `t_employee_role_id_f67d08f5_fk_t_role_id`(`role_id`) USING BTREE,
  INDEX `t_employee_department_id_831d6a78_fk_t_department_id`(`department_id`) USING BTREE,
  CONSTRAINT `t_employee_department_id_831d6a78_fk_t_department_id` FOREIGN KEY (`department_id`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_employee_role_id_f67d08f5_fk_t_role_id` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES (1, 'chengjun', '4f10604892e20d371ab3705f4b2fbb93', '程军', 1, 30, '18931982145', 'csip2@35.com', '2021-05-20', 1, 2, 1);
INSERT INTO `t_employee` VALUES (2, 'jiangming', 'a2898d83d9339708df6c072566ebecda', '江明', 1, 23, '13506896246', 'hkgt7@qq.com', '2022-02-16', 1, 3, 1);
INSERT INTO `t_employee` VALUES (3, 'yinping', 'db4a6983db657ece087e9bfe0e39023f', '尹平', 2, 21, '18903858099', 'n42@56.com', '2022-04-07', 7, 2, 1);
INSERT INTO `t_employee` VALUES (4, 'songna', 'db4a6983db657ece087e9bfe0e39023f', '宋娜', 2, 20, '13595424548', 'qis@21cn.com', '2022-04-08', 6, 2, 1);
INSERT INTO `t_employee` VALUES (5, 'wangli', '00375ea43886a333ca5ad10f35d8bd6d', '王丽', 2, 26, '13523163383', 'sycqoi@hotmail.com', '2022-04-07', 5, 2, 1);
INSERT INTO `t_employee` VALUES (6, 'shifang', '00375ea43886a333ca5ad10f35d8bd6d', '石芳', 2, 26, '13587787326', 'ga1hku@265.com', '2022-04-07', 4, 2, 1);
INSERT INTO `t_employee` VALUES (7, 'zouyang', '00375ea43886a333ca5ad10f35d8bd6d', '邹洋', 1, 28, '18900167688', 'lg3yok@sina.com', '2022-04-07', 2, 2, 1);
INSERT INTO `t_employee` VALUES (8, 'dinggang', '00375ea43886a333ca5ad10f35d8bd6d', '丁刚', 1, 30, '13535386557', 'ttdlpc@163.net', '2022-04-07', 3, 2, 1);
INSERT INTO `t_employee` VALUES (9, 'linzhi', '00375ea43886a333ca5ad10f35d8bd6d', '林志', 1, 22, '14523487823', 'qwa123@163.com', '2022-04-08', 3, 3, 1);
INSERT INTO `t_employee` VALUES (10, 'lishiming', '00375ea43886a333ca5ad10f35d8bd6d', '李世明', 1, 25, '18923789867', 'tt123@qq.com', '2022-04-09', 4, 3, 1);
INSERT INTO `t_employee` VALUES (11, 'deng', '4f10604892e20d371ab3705f4b2fbb93', '邓金旺', 1, 22, '13378989798', '761070384@qq.com', '2022-04-10', 6, 1, 1);
INSERT INTO `t_employee` VALUES (12, 'lingzhi', 'f6c0e864f89614f7896d17f394c27910', '灵志', 1, 22, '12212212211', '1632111@qq.com', '2022-04-27', 3, 3, 1);

-- ----------------------------
-- Table structure for t_face
-- ----------------------------
DROP TABLE IF EXISTS `t_face`;
CREATE TABLE `t_face`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `face_features` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `face_state` smallint(6) NOT NULL,
  `face_image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `employee_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `app_face_employee_id_8d952603_fk_t_employee_id`(`employee_id`) USING BTREE,
  CONSTRAINT `app_face_employee_id_8d952603_fk_t_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `t_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_face
-- ----------------------------
INSERT INTO `t_face` VALUES (1, '', 1, '', 1);
INSERT INTO `t_face` VALUES (2, '', 1, '', 2);
INSERT INTO `t_face` VALUES (3, '', 1, '', 10);
INSERT INTO `t_face` VALUES (4, '', 1, '', 3);
INSERT INTO `t_face` VALUES (5, '', 1, '', 8);
INSERT INTO `t_face` VALUES (6, '', 1, '', 10);
INSERT INTO `t_face` VALUES (7, '', 1, '', 9);
INSERT INTO `t_face` VALUES (8, '', 1, '', 7);
INSERT INTO `t_face` VALUES (9, '', 1, '', 4);
INSERT INTO `t_face` VALUES (10, '', 1, '', 6);
INSERT INTO `t_face` VALUES (11, '', 3, '', 6);
INSERT INTO `t_face` VALUES (12, '', 3, '', 4);
INSERT INTO `t_face` VALUES (13, '', 3, '', 5);
INSERT INTO `t_face` VALUES (14, '', 3, '', 8);
INSERT INTO `t_face` VALUES (15, '', 3, '', 3);
INSERT INTO `t_face` VALUES (16, '-0.08258466422557831,0.04298628494143486,0.017192577943205833,-0.011207452975213528,-0.08435672521591187,-0.09790144115686417,-0.094086192548275,-0.15908949077129364,0.07318916916847229,-0.12383941560983658,0.2620633542537689,-0.092063769698143,-0.12953896820545197,-0.13449887931346893,-0.0486392006278038,0.17380890250205994,-0.16342730820178986,-0.09449124336242676,-0.04072964936494827,0.0072975968942046165,0.12417043745517731,-0.03908230736851692,0.018477603793144226,0.017738450318574905,-0.09324318915605545,-0.290448933839798,-0.10399501025676727,-0.08981567621231079,0.05206706374883652,-0.022005245089530945,-0.0279194638133049,0.023984001949429512,-0.1746140867471695,-0.059747688472270966,0.0412602573633194,0.045520152896642685,-0.010485116392374039,-0.06800925731658936,0.16662822663784027,-0.02239389717578888,-0.18951298296451569,-0.012643564492464066,0.03305503726005554,0.1967262178659439,0.2070157676935196,0.046285245567560196,0.05631657689809799,-0.16596435010433197,0.1543828696012497,-0.13677716255187988,-0.002303285524249077,0.1282256841659546,0.1232113316655159,0.06796557456254959,0.019069854170084,-0.0845784991979599,0.1002362072467804,0.08601029962301254,-0.140787735581398,0.010050393640995026,0.130234494805336,-0.025467706844210625,0.009775299578905106,-0.05182993412017822,0.3009536564350128,0.03664359822869301,-0.14454714953899384,-0.1266903132200241,0.12638258934020996,-0.09230010956525803,-0.07683722674846649,0.018956134095788002,-0.16280367970466614,-0.178135484457016,-0.29575976729393005,-0.01804248057305813,0.4218829274177551,0.10676321387290955,-0.2041989266872406,0.07244647294282913,-0.10973285138607025,0.014852942898869514,0.15134935081005096,0.12786990404129028,-0.009694727137684822,0.0018525300547480583,-0.08372406661510468,-0.03367125242948532,0.21886083483695984,-0.10300928354263306,-0.0245286226272583,0.1975836157798767,-0.028712349012494087,0.064503975212574,0.01926351524889469,-0.01573583483695984,-0.08254265785217285,0.05041142553091049,-0.04412141442298889,-0.017000777646899223,0.034528907388448715,-0.04245757311582565,0.05106472596526146,0.09259889274835587,-0.10591666400432587,0.13419760763645172,-0.02106940560042858,0.11119750142097473,0.03380079194903374,-0.012790350243449211,-0.11887972056865692,-0.05478421598672867,0.06958714872598648,-0.20232835412025452,0.219323992729187,0.10146632045507431,0.07759352773427963,0.1093699112534523,0.15085233747959137,0.1325078010559082,-0.02296914905309677,0.01865679956972599,-0.15623293817043304,-0.017534853890538216,0.06930268555879593,-0.007790574338287115,0.11096172779798508,-0.0008668163791298866', 2, 'face/deng.jpg', 11);
INSERT INTO `t_face` VALUES (17, '-0.14238157868385315,0.07799287140369415,0.10005947202444077,-0.013364220038056374,-0.07455386966466904,-0.09508701413869858,-0.10980550944805145,-0.2002616822719574,0.047279421240091324,-0.03991598263382912,0.25111261010169983,-0.08702941983938217,-0.18245156109333038,-0.1427152305841446,-0.005907856859266758,0.16102418303489685,-0.15973126888275146,-0.1292017549276352,-0.03755024075508118,-0.015820175409317017,0.025327060371637344,-0.0723382756114006,0.06672541797161102,0.028037648648023605,-0.1460878551006317,-0.3787268102169037,-0.1315360963344574,-0.09581521153450012,-0.017691949382424355,-0.019097188487648964,-0.04965917766094208,0.08082503825426102,-0.12679696083068848,-0.044861115515232086,-0.018566446378827095,0.07087361812591553,0.018207266926765442,-0.10060816258192062,0.17669954895973206,-0.050311580300331116,-0.22019755840301514,-0.006277215667068958,0.07215133309364319,0.21619579195976257,0.2395903617143631,0.052308082580566406,0.08328408002853394,-0.07533036172389984,0.0669199526309967,-0.13296765089035034,0.01319141872227192,0.12125784158706665,0.08833462744951248,0.028040841221809387,-0.014764760620892048,-0.14805082976818085,0.07022228837013245,0.10966736823320389,-0.12365646660327911,0.005748840980231762,0.08759498596191406,-0.12812140583992004,-0.0004475526511669159,-0.018896114081144333,0.273016095161438,0.1292165070772171,-0.1129879504442215,-0.05516156554222107,0.15375374257564545,-0.07885969430208206,-0.07818074524402618,-0.035499587655067444,-0.21143700182437897,-0.1886199712753296,-0.37172919511795044,0.00854688324034214,0.38306939601898193,0.10796980559825897,-0.2328120768070221,0.012995710596442223,-0.0549895353615284,0.06607156991958618,0.12891684472560883,0.16263972222805023,-0.1038275808095932,-0.034486860036849976,-0.14768758416175842,-0.03125825524330139,0.1987266093492508,-0.01268107257783413,-0.021362410858273506,0.21093222498893738,0.01610613241791725,0.07862553745508194,0.03906705230474472,0.04900391027331352,-0.051832135766744614,0.03896372392773628,-0.08806568384170532,0.02336372435092926,0.0940895527601242,-0.04043659567832947,0.041840940713882446,0.15591412782669067,-0.15837274491786957,0.08908998966217041,0.024917976930737495,0.07720332592725754,0.04715294390916824,-0.0009389033075422049,-0.009000546298921108,-0.0850931704044342,0.10723965615034103,-0.17362268269062042,0.11439134180545807,0.22764554619789124,0.0625995472073555,0.15089665353298187,0.14382512867450714,0.1148023009300232,-0.041538577526807785,0.004867952316999435,-0.19392645359039307,0.026346640661358833,0.07692849636077881,-0.019463103264570236,0.08455754071474075,0.10522935539484024', 1, 'face/lingzhi.jpg', 12);

-- ----------------------------
-- Table structure for t_leave
-- ----------------------------
DROP TABLE IF EXISTS `t_leave`;
CREATE TABLE `t_leave`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `leave_reason` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `leave_start` datetime(6) NOT NULL,
  `leave_end` datetime(6) NOT NULL,
  `submit_time` datetime(6) NULL DEFAULT NULL,
  `audit_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `audit_time` datetime(6) NULL DEFAULT NULL,
  `audit_illustrate` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `audit_state_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NULL DEFAULT NULL,
  `leave_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `t_leave_leave_type_id_33d4c4eb_fk_t_leaveType_id`(`leave_type_id`) USING BTREE,
  INDEX `t_leave_audit_state_id_2232dd68_fk_t_auditState_id`(`audit_state_id`) USING BTREE,
  INDEX `t_leave_employee_id_7f5e8198_fk_t_employee_id`(`employee_id`) USING BTREE,
  CONSTRAINT `t_leave_audit_state_id_2232dd68_fk_t_auditState_id` FOREIGN KEY (`audit_state_id`) REFERENCES `t_auditstate` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_leave_employee_id_7f5e8198_fk_t_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `t_employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_leave_leave_type_id_33d4c4eb_fk_t_leaveType_id` FOREIGN KEY (`leave_type_id`) REFERENCES `t_leavetype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_leave
-- ----------------------------
INSERT INTO `t_leave` VALUES (1, '去医院做检查', '2022-04-09 19:54:18.000000', '2022-04-10 19:50:14.000000', '2022-04-09 19:54:40.000000', '邓金旺', '2022-04-09 19:55:20.000000', '审核通过', 2, 2, 2);
INSERT INTO `t_leave` VALUES (2, '回家参加表哥婚礼', '2022-04-30 18:20:41.000000', '2022-05-02 21:20:55.000000', '2022-04-30 21:21:05.000000', '邓金旺', NULL, NULL, 1, 9, 2);
INSERT INTO `t_leave` VALUES (3, '出差一天', '2022-05-04 08:00:16.000000', '2022-05-05 19:30:16.000000', '2022-05-01 22:36:02.000000', '邓金旺', NULL, '', 1, 1, 1);

-- ----------------------------
-- Table structure for t_leavetype
-- ----------------------------
DROP TABLE IF EXISTS `t_leavetype`;
CREATE TABLE `t_leavetype`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `leave_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_leavetype
-- ----------------------------
INSERT INTO `t_leavetype` VALUES (1, '事假');
INSERT INTO `t_leavetype` VALUES (2, '病假');
INSERT INTO `t_leavetype` VALUES (3, '婚假');
INSERT INTO `t_leavetype` VALUES (4, '产假');
INSERT INTO `t_leavetype` VALUES (5, '丧假');
INSERT INTO `t_leavetype` VALUES (6, '年休假');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '管理员');
INSERT INTO `t_role` VALUES (2, '负责人');
INSERT INTO `t_role` VALUES (3, '员工');

SET FOREIGN_KEY_CHECKS = 1;
