-- ----------------------------
-- Table structure for bu_device
-- ----------------------------
DROP TABLE IF EXISTS `bu_device`;
CREATE TABLE `bu_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统记录id',
  `device_id` varchar(32) NOT NULL COMMENT '设备id',
  `device_name` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `device_status` char(1) DEFAULT '0' COMMENT '设备状态（0-停用，1-正常）',
  `device_type` varchar(1) DEFAULT NULL COMMENT '设备类型',
  `device_tag` varchar(1) DEFAULT NULL COMMENT '设备端类型',
  `device_scene_id` int(11) DEFAULT NULL COMMENT '场景id',
  `device_group_id` int(11) DEFAULT NULL COMMENT '设备组id',
  `device_param` varchar(255) DEFAULT '' COMMENT '设备采集参数',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='设备表';

-- ----------------------------
-- Records of bu_device
-- ----------------------------
INSERT INTO `bu_device` VALUES ('13', '1', '1号设备', '0', null, '1', null, '2', 'T,S,H', 'admin', '2018-09-15 19:44:48', 'admin', '2018-10-11 19:03:03', '', '0');
INSERT INTO `bu_device` VALUES ('14', '2', '2号设备', '0', null, '2', null, '2', '', 'admin', '2018-09-15 19:45:02', 'admin', '2018-10-11 19:02:44', '', '0');
INSERT INTO `bu_device` VALUES ('15', '3', '3号设备', '0', null, '1', null, '4', 'T,C,H', 'admin', '2018-09-15 20:51:00', 'admin', '2018-10-11 20:05:20', '', '0');
INSERT INTO `bu_device` VALUES ('16', '4', '4号设备', '0', null, '2', null, '4', '', 'admin', '2018-10-11 20:03:46', 'admin', '2018-10-11 20:05:07', '', '0');

-- ----------------------------
-- Table structure for bu_device_group
-- ----------------------------
DROP TABLE IF EXISTS `bu_device_group`;
CREATE TABLE `bu_device_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父级组id',
  `group_name` varchar(30) DEFAULT '' COMMENT '组名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `status` char(1) DEFAULT '0' COMMENT '组状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（''0''-正常，''2''-删除）',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='设备组表';

-- ----------------------------
-- Records of bu_device_group
-- ----------------------------
INSERT INTO `bu_device_group` VALUES ('2', '0', '2号', '1', '', '0', 'admin', '2018-10-07 17:06:21', 'admin', '2018-10-08 06:58:31', '0');
INSERT INTO `bu_device_group` VALUES ('4', '0', '4号', '2', '', '0', 'admin', '2018-10-07 17:15:58', 'admin', '2018-10-08 06:58:40', '0');

-- ----------------------------
-- Table structure for bu_device_log
-- ----------------------------
DROP TABLE IF EXISTS `bu_device_log`;
CREATE TABLE `bu_device_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统记录id',
  `device_id` varchar(32) NOT NULL COMMENT '设备id',
  `device_data` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备数据日志表';

-- ----------------------------
-- Records of bu_device_log
-- ----------------------------

-- ----------------------------
-- Table structure for bu_scene
-- ----------------------------
DROP TABLE IF EXISTS `bu_scene`;
CREATE TABLE `bu_scene` (
  `scene_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '场景id',
  `scene_name` varchar(255) DEFAULT NULL COMMENT '场景名称',
  `scene_status` char(1) DEFAULT '0' COMMENT '场景状态（0启用，1停用）',
  `scene_params` varchar(255) DEFAULT NULL COMMENT '场景参数',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '0' COMMENT '删除标志（0-正常，2删除）',
  `remark` varchar(255) DEFAULT '' COMMENT '备注信息',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`scene_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='场景表';

-- ----------------------------
-- Records of bu_scene
-- ----------------------------
INSERT INTO `bu_scene` VALUES ('3', '月季花', '0', '{“T”:25,\"S\":\"45\",\"H\":35}', '0', '', 'admin', '2018-10-07 17:06:03', 'admin', '2018-10-07 17:23:36');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-default', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认 skin-default、蓝色 skin-blue、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT '' COMMENT '负责人',
  `phone` varchar(11) DEFAULT '' COMMENT '联系电话',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(500) DEFAULT '' COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(500) DEFAULT '' COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('18', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('19', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('21', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('22', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('23', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('24', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('25', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('31', '1', '采集端', '1', 'sys_device_tag', '', 'primary', 'Y', '0', 'admin', '2018-09-08 03:49:57', 'admin', '2018-09-08 05:13:03', '采集端');
INSERT INTO `sys_dict_data` VALUES ('32', '2', '控制端', '2', 'sys_device_tag', '', 'warning', 'Y', '0', 'admin', '2018-09-08 03:50:20', 'admin', '2018-09-08 06:34:36', '控制端');
INSERT INTO `sys_dict_data` VALUES ('35', '1', '温度', 'T', 'device_collect_param', '', 'warning', 'Y', '0', 'admin', '2018-09-15 20:40:24', '', null, '温度参数');
INSERT INTO `sys_dict_data` VALUES ('36', '2', '湿度', 'S', 'device_collect_param', '', 'primary', 'Y', '0', 'admin', '2018-09-15 20:40:54', '', null, '湿度参数');
INSERT INTO `sys_dict_data` VALUES ('37', '3', '土壤湿度', 'C', 'device_collect_param', '', 'default', 'Y', '0', 'admin', '2018-09-15 20:41:22', '', null, '土壤湿度');
INSERT INTO `sys_dict_data` VALUES ('38', '4', '光照', 'L', 'device_collect_param', '', 'danger', 'Y', '0', 'admin', '2018-09-15 20:41:58', '', null, '光照参数');
INSERT INTO `sys_dict_data` VALUES ('39', '5', '酸碱度', 'H', 'device_collect_param', '', 'success', 'Y', '0', 'admin', '2018-09-15 20:42:27', '', null, '酸碱度');
INSERT INTO `sys_dict_data` VALUES ('40', '6', '二氧化碳', 'O', 'device_collect_param', '', 'primary', 'Y', '0', 'admin', '2018-09-15 20:43:08', '', null, '二氧化碳');
INSERT INTO `sys_dict_data` VALUES ('41', '1', '离线', '0', 'device_is_online', '', 'default', 'Y', '0', 'admin', '2018-09-15 20:47:59', '', null, '离线状态');
INSERT INTO `sys_dict_data` VALUES ('42', '2', '在线', '1', 'device_is_online', '', 'success', 'Y', '0', 'admin', '2018-09-15 20:48:17', '', null, '在线');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('6', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('8', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('9', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES ('101', '设备终端类型', 'sys_device_tag', '0', 'admin', '2018-09-08 03:49:31', '', null, '设备终端类型（控制端/采集端）');
INSERT INTO `sys_dict_type` VALUES ('103', '采集参数', 'device_collect_param', '0', 'admin', '2018-09-15 20:39:00', '', null, '采集端采集参数');
INSERT INTO `sys_dict_type` VALUES ('104', '设备是否在线', 'device_is_online', '0', 'admin', '2018-09-15 20:45:16', '', null, '设备是否在线');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '0' COMMENT '计划执行错误策略（0默认 1继续 2等待 3放弃）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '0', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '0', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` text COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-05 14:48:09');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2018-09-05 15:05:07');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-05 15:05:12');
INSERT INTO `sys_logininfor` VALUES ('103', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-06 08:54:09');
INSERT INTO `sys_logininfor` VALUES ('104', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-07 21:41:00');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-07 22:00:48');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-07 22:03:20');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-07 22:11:20');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-07 22:14:52');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-07 22:16:43');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-08 03:29:28');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-08 03:32:09');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-08 04:02:33');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-08 04:12:12');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-08 04:37:56');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-08 07:55:42');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-08 13:27:30');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-08 15:35:26');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-09-09 09:57:23');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-09 09:57:34');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-12 08:23:21');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-15 17:38:31');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-15 18:10:27');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-15 19:21:23');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-15 20:32:15');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-27 22:06:59');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-27 22:35:31');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-27 22:37:45');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-27 22:43:38');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-27 22:53:38');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-09-27 22:57:59');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-10-07 15:03:10');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-10-07 15:36:37');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-10-07 15:39:39');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-10-07 15:42:45');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '退出成功', '2018-10-07 15:47:11');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-10-07 15:47:14');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-10-07 15:51:37');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-10-07 16:15:52');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-10-07 17:05:44');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-10-07 17:05:49');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-10-07 17:12:20');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-10-08 06:57:26');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-10-11 19:02:19');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-10-11 19:21:42');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-10-11 21:01:24');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', '0', '登录成功', '2018-10-11 21:02:23');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2023 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '3', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'admin', '2018-10-07 17:30:08', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '4', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'admin', '2018-10-07 17:30:14', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '5', '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'admin', '2018-10-07 17:30:21', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '表单构建', '3', '1', '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('113', '代码生成', '3', '2', '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('114', '系统接口', '3', '3', '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '重置密码', '100', '5', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色导出', '101', '4', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '部门查询', '103', '1', '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门新增', '103', '2', '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门修改', '103', '3', '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门删除', '103', '4', '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '岗位查询', '104', '1', '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位新增', '104', '2', '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位修改', '104', '3', '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位删除', '104', '4', '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位导出', '104', '4', '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典导出', '105', '4', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数删除', '106', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数导出', '106', '4', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '公告查询', '107', '1', '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告新增', '107', '2', '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告修改', '107', '3', '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告删除', '107', '4', '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '操作查询', '500', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作删除', '500', '2', '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '详细信息', '500', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '日志导出', '500', '3', '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '登录查询', '501', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录删除', '501', '2', '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '日志导出', '501', '2', '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '在线查询', '109', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '批量强退', '109', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '单条强退', '109', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '任务查询', '110', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务新增', '110', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务修改', '110', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务删除', '110', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '状态修改', '110', '5', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '任务导出', '110', '5', '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '生成查询', '113', '1', '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '生成代码', '113', '2', '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('2000', '终端设备管理', '0', '1', '#', 'M', '0', '', 'fa fa-cloud', 'admin', '2018-09-03 06:38:07', 'admin', '2018-09-07 21:50:27', '');
INSERT INTO `sys_menu` VALUES ('2001', '设备管理', '2000', '1', '/module/device', 'C', '0', 'module:device:view', '#', 'admin', '2018-09-03 06:39:20', 'admin', '2018-09-03 06:42:07', '');
INSERT INTO `sys_menu` VALUES ('2002', '设备组管理', '2000', '2', '/module/deviceGroup', 'C', '0', 'module:deviceGroup:view', '#', 'admin', '2018-09-03 06:39:36', 'admin', '2018-09-08 06:20:02', '');
INSERT INTO `sys_menu` VALUES ('2003', '场景管理', '2000', '3', '/module/scene', 'C', '0', 'module:scene:view', '#', 'admin', '2018-09-03 06:39:55', 'admin', '2018-09-08 06:20:18', '');
INSERT INTO `sys_menu` VALUES ('2004', '设备列表', '2001', '1', '#', 'F', '0', 'module:device:list', '#', 'admin', '2018-09-03 06:47:33', 'admin', '2018-09-03 20:46:04', '');
INSERT INTO `sys_menu` VALUES ('2005', '设备添加', '2001', '2', '#', 'F', '0', 'module:device:add', '#', 'admin', '2018-09-03 06:48:38', '', null, '');
INSERT INTO `sys_menu` VALUES ('2006', '场景列表', '2003', '1', '#', 'F', '0', 'module:scene:list', '#', 'admin', '2018-09-03 08:23:07', 'admin', '2018-09-03 21:30:57', '');
INSERT INTO `sys_menu` VALUES ('2007', '新增场景', '2003', '2', '#', 'F', '0', 'module:scene:add', '#', 'admin', '2018-09-03 08:43:39', 'admin', '2018-09-03 21:31:15', '');
INSERT INTO `sys_menu` VALUES ('2008', '场景编辑', '2003', '3', '#', 'F', '0', 'module:scene:edit', '#', 'admin', '2018-09-03 08:44:05', 'admin', '2018-09-03 21:32:15', '');
INSERT INTO `sys_menu` VALUES ('2009', '删除组', '2002', '4', '#', 'F', '0', 'module:deviceGroup:delete', '#', 'admin', '2018-09-03 08:44:34', 'admin', '2018-09-03 20:36:52', '');
INSERT INTO `sys_menu` VALUES ('2010', '查看场景', '2003', '4', '#', 'F', '0', 'module:scene:view', '#', 'admin', '2018-09-03 08:45:35', 'admin', '2018-09-03 21:31:54', '');
INSERT INTO `sys_menu` VALUES ('2011', '删除场景', '2003', '5', '#', 'F', '0', 'module:scene:delete', '#', 'admin', '2018-09-03 20:37:36', '', null, '');
INSERT INTO `sys_menu` VALUES ('2012', '添加组', '2002', '1', '#', 'F', '0', 'module:deviceGroup:add', '#', 'admin', '2018-09-03 20:38:14', '', null, '');
INSERT INTO `sys_menu` VALUES ('2013', '查看组', '2002', '2', '#', 'F', '0', 'module:deviceGroup:view', '#', 'admin', '2018-09-03 20:38:48', '', null, '');
INSERT INTO `sys_menu` VALUES ('2014', '编辑组', '2002', '3', '#', 'F', '0', 'module:deviceGroup:edit', '#', 'admin', '2018-09-03 20:39:23', '', null, '');
INSERT INTO `sys_menu` VALUES ('2015', '查看设备', '2001', '3', '#', 'F', '0', 'module:device:view', '#', 'admin', '2018-09-03 20:45:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2016', '删除设备', '2001', '4', '#', 'F', '0', 'module:device:delete', '#', 'admin', '2018-09-03 20:46:41', '', null, '');
INSERT INTO `sys_menu` VALUES ('2017', '编辑设备', '2001', '5', '#', 'F', '0', 'module:device:edit', '#', 'admin', '2018-09-03 20:47:12', '', null, '');
INSERT INTO `sys_menu` VALUES ('2018', '组列表', '2002', '5', '#', 'F', '0', 'module:deviceGroup:list', '#', 'admin', '2018-09-03 21:27:54', '', null, '');
INSERT INTO `sys_menu` VALUES ('2019', '组态管理', '0', '2', '#', 'M', '0', '', 'fa fa-bar-chart', 'admin', '2018-10-07 17:29:57', '', null, '');
INSERT INTO `sys_menu` VALUES ('2020', '设备组态', '2019', '1', '/module/device/configList', 'C', '0', 'module:device:configuration', '#', 'admin', '2018-10-07 17:32:19', '', null, '');
INSERT INTO `sys_menu` VALUES ('2022', '场景组态', '2019', '2', '/module/scene/configList', 'C', '0', 'module:scene:configuration', '#', 'admin', '2018-10-07 17:35:05', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(2) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(500) NOT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(30) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(255) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"综合管理\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-cloud\"],\"visible\":[\"0\"]}', '0', null, '2018-09-05 15:05:30');
INSERT INTO `sys_oper_log` VALUES ('101', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"1\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统管理\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-gear\"],\"visible\":[\"0\"]}', '0', null, '2018-09-05 15:05:36');
INSERT INTO `sys_oper_log` VALUES ('102', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"0\"]}', '0', null, '2018-09-05 15:05:41');
INSERT INTO `sys_oper_log` VALUES ('103', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"]}', '0', null, '2018-09-05 15:05:46');
INSERT INTO `sys_oper_log` VALUES ('104', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2000\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"终端设备管理\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-cloud\"],\"visible\":[\"0\"]}', '0', null, '2018-09-07 21:50:27');
INSERT INTO `sys_oper_log` VALUES ('105', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2000\"],\"menuType\":[\"M\"],\"menuName\":[\"设备组态\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-folder-open\"],\"visible\":[\"0\"]}', '0', null, '2018-09-07 21:55:10');
INSERT INTO `sys_oper_log` VALUES ('106', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2002\"],\"parentId\":[\"2019\"],\"menuType\":[\"C\"],\"menuName\":[\"组管理\"],\"url\":[\"/module/deviceGroup\"],\"perms\":[\"module:deviceGroup:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-09-07 21:55:40');
INSERT INTO `sys_oper_log` VALUES ('107', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2003\"],\"parentId\":[\"2019\"],\"menuType\":[\"C\"],\"menuName\":[\"场景管理\"],\"url\":[\"/module/scene\"],\"perms\":[\"module:scene:view\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-09-07 21:56:02');
INSERT INTO `sys_oper_log` VALUES ('108', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2019\"],\"parentId\":[\"2000\"],\"menuType\":[\"M\"],\"menuName\":[\"设备组态\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-09-07 21:57:11');
INSERT INTO `sys_oper_log` VALUES ('109', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2019\"],\"parentId\":[\"2000\"],\"menuType\":[\"M\"],\"menuName\":[\"设备组态\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-09-07 21:57:29');
INSERT INTO `sys_oper_log` VALUES ('110', '字典类型', '2', 'com.ruoyi.project.system.dict.controller.DictTypeController.editSave()', '1', 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', 'XX XX', '{\"dictId\":[\"100\"],\"dictName\":[\"设备类型\"],\"dictType\":[\"device_type\"],\"status\":[\"0\"],\"remark\":[\"设备类型列表\"]}', '0', null, '2018-09-07 22:05:02');
INSERT INTO `sys_oper_log` VALUES ('111', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"温感设备\"],\"dictValue\":[\"T\"],\"dictType\":[\"device_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"温控设备\"]}', '0', null, '2018-09-07 22:06:09');
INSERT INTO `sys_oper_log` VALUES ('112', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"光感设备\"],\"dictValue\":[\"S\"],\"dictType\":[\"device_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"光控设备\"]}', '0', null, '2018-09-07 22:06:46');
INSERT INTO `sys_oper_log` VALUES ('113', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"27\"],\"dictLabel\":[\"光感设备\"],\"dictValue\":[\"L\"],\"dictType\":[\"device_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"光控设备\"]}', '0', null, '2018-09-07 22:07:14');
INSERT INTO `sys_oper_log` VALUES ('114', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"湿度感设备\"],\"dictValue\":[\"S\"],\"dictType\":[\"device_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"湿度感应设备\"]}', '0', null, '2018-09-07 22:07:48');
INSERT INTO `sys_oper_log` VALUES ('115', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"二氧化碳感应设备\"],\"dictValue\":[\"O\"],\"dictType\":[\"device_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"\"]}', '0', null, '2018-09-07 22:08:39');
INSERT INTO `sys_oper_log` VALUES ('116', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"29\"],\"dictLabel\":[\"二氧化碳感应设备\"],\"dictValue\":[\"O\"],\"dictType\":[\"device_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"测量二氧化碳浓度设备\"]}', '0', null, '2018-09-07 22:08:55');
INSERT INTO `sys_oper_log` VALUES ('117', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"酸碱度测控设备\"],\"dictValue\":[\"H\"],\"dictType\":[\"device_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"测量酸碱度设备\"]}', '0', null, '2018-09-07 22:09:42');
INSERT INTO `sys_oper_log` VALUES ('118', '字典类型', '2', 'com.ruoyi.project.system.dict.controller.DictTypeController.editSave()', '1', 'admin', '研发部门', '/system/dict/edit', '127.0.0.1', 'XX XX', '{\"dictId\":[\"100\"],\"dictName\":[\"设备类型\"],\"dictType\":[\"sys_device_type\"],\"status\":[\"0\"],\"remark\":[\"设备类型列表\"]}', '0', null, '2018-09-07 22:10:08');
INSERT INTO `sys_oper_log` VALUES ('119', '字典类型', '1', 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', 'XX XX', '{\"dictName\":[\"设备终端类型\"],\"dictType\":[\"sys_device_tag\"],\"status\":[\"0\"],\"remark\":[\"设备终端类型（控制端/采集端）\"]}', '0', null, '2018-09-08 03:49:31');
INSERT INTO `sys_oper_log` VALUES ('120', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"采集端\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_device_tag\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"采集端\"]}', '0', null, '2018-09-08 03:49:57');
INSERT INTO `sys_oper_log` VALUES ('121', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"控制端\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_device_tag\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"控制端\"]}', '0', null, '2018-09-08 03:50:20');
INSERT INTO `sys_oper_log` VALUES ('122', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', '研发部门', '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceId\":[\"1\"],\"deviceName\":[\"1\"],\"deviceStatus\":[\"on\"],\"deviceGroupId\":[\"\"]}', '1', '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may involve com.ruoyi.project.module.device.mapper.DeviceMapper.insertDevice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bu_device    ( device_id,    device_name,    device_status )           values ( ?,    ?,    ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; ]; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2018-09-08 04:13:36');
INSERT INTO `sys_oper_log` VALUES ('123', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', '研发部门', '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceId\":[\"1\"],\"deviceName\":[\"test1\"],\"deviceStatus\":[\"on\"],\"deviceGroupId\":[\"\"]}', '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'device_status\' at row 1\r\n### The error may involve com.ruoyi.project.module.device.mapper.DeviceMapper.insertDevice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bu_device    ( device_id,    device_name,    device_status )           values ( ?,    ?,    ? )\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'device_status\' at row 1\n; ]; Data truncation: Data too long for column \'device_status\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'device_status\' at row 1', '2018-09-08 04:38:15');
INSERT INTO `sys_oper_log` VALUES ('124', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', '研发部门', '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceId\":[\"1\"],\"deviceName\":[\"1\"],\"deviceStatus\":[\"on\"],\"deviceGroupId\":[\"\"]}', '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'device_status\' at row 1\r\n### The error may involve com.ruoyi.project.module.device.mapper.DeviceMapper.insertDevice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into bu_device    ( device_id,    device_name,    device_status )           values ( ?,    ?,    ? )\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'device_status\' at row 1\n; ]; Data truncation: Data too long for column \'device_status\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'device_status\' at row 1', '2018-09-08 04:40:56');
INSERT INTO `sys_oper_log` VALUES ('125', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', '研发部门', '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceId\":[\"1\"],\"deviceName\":[\"1\"],\"deviceGroupId\":[\"\"]}', '0', null, '2018-09-08 04:43:51');
INSERT INTO `sys_oper_log` VALUES ('126', '字典类型', '1', 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', 'XX XX', '{\"dictName\":[\"设备状态\"],\"dictType\":[\"sys_device_status\"],\"status\":[\"0\"],\"remark\":[\"设备状态\"]}', '0', null, '2018-09-08 05:07:07');
INSERT INTO `sys_oper_log` VALUES ('127', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"开启\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_device_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"设备状态\"]}', '0', null, '2018-09-08 05:07:51');
INSERT INTO `sys_oper_log` VALUES ('128', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"关闭\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_device_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"设备状态关闭\"]}', '0', null, '2018-09-08 05:08:17');
INSERT INTO `sys_oper_log` VALUES ('129', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"33\"],\"dictLabel\":[\"开启\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_device_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"设备状态开启\"]}', '0', null, '2018-09-08 05:08:27');
INSERT INTO `sys_oper_log` VALUES ('130', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"33\"],\"dictLabel\":[\"开启\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_device_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"设备状态开启\"]}', '0', null, '2018-09-08 05:12:32');
INSERT INTO `sys_oper_log` VALUES ('131', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"34\"],\"dictLabel\":[\"关闭\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_device_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"设备状态关闭\"]}', '0', null, '2018-09-08 05:12:43');
INSERT INTO `sys_oper_log` VALUES ('132', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"32\"],\"dictLabel\":[\"控制端\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_device_tag\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"控制端\"]}', '0', null, '2018-09-08 05:12:57');
INSERT INTO `sys_oper_log` VALUES ('133', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"31\"],\"dictLabel\":[\"采集端\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_device_tag\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"采集端\"]}', '0', null, '2018-09-08 05:13:03');
INSERT INTO `sys_oper_log` VALUES ('134', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"30\"],\"dictLabel\":[\"酸碱度测控设备\"],\"dictValue\":[\"H\"],\"dictType\":[\"sys_device_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"测量酸碱度设备\"]}', '0', null, '2018-09-08 05:13:19');
INSERT INTO `sys_oper_log` VALUES ('135', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"29\"],\"dictLabel\":[\"二氧化碳感应设备\"],\"dictValue\":[\"O\"],\"dictType\":[\"sys_device_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"测量二氧化碳浓度设备\"]}', '0', null, '2018-09-08 05:13:25');
INSERT INTO `sys_oper_log` VALUES ('136', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"28\"],\"dictLabel\":[\"湿度感设备\"],\"dictValue\":[\"S\"],\"dictType\":[\"sys_device_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"湿度感应设备\"]}', '0', null, '2018-09-08 05:13:34');
INSERT INTO `sys_oper_log` VALUES ('137', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"27\"],\"dictLabel\":[\"光感设备\"],\"dictValue\":[\"L\"],\"dictType\":[\"sys_device_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"光控设备\"]}', '0', null, '2018-09-08 05:13:40');
INSERT INTO `sys_oper_log` VALUES ('138', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', '研发部门', '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"26\"],\"dictLabel\":[\"温感设备\"],\"dictValue\":[\"T\"],\"dictType\":[\"sys_device_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"温控设备\"]}', '0', null, '2018-09-08 05:13:46');
INSERT INTO `sys_oper_log` VALUES ('139', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', '研发部门', '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceId\":[\"2\"],\"deviceName\":[\"2\"],\"deviceGroupId\":[\"\"]}', '0', null, '2018-09-08 05:14:50');
INSERT INTO `sys_oper_log` VALUES ('140', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', '研发部门', '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceTag\":[\"1\"],\"deviceId\":[\"3\"],\"deviceName\":[\"3\"],\"deviceType\":[\"S\"]}', '0', null, '2018-09-08 05:21:20');
INSERT INTO `sys_oper_log` VALUES ('141', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', '研发部门', '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceId\":[\"3\"],\"deviceName\":[\"3\"],\"deviceGroupId\":[\"\"]}', '0', null, '2018-09-08 05:21:21');
INSERT INTO `sys_oper_log` VALUES ('142', '设备', '3', 'com.ruoyi.project.module.device.controller.DeviceController.remove()', '1', 'admin', '研发部门', '/module/device/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"4\"]}', '0', null, '2018-09-08 05:21:49');
INSERT INTO `sys_oper_log` VALUES ('143', '设备', '3', 'com.ruoyi.project.module.device.controller.DeviceController.remove()', '1', 'admin', '研发部门', '/module/device/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"2\"]}', '0', null, '2018-09-08 05:23:16');
INSERT INTO `sys_oper_log` VALUES ('144', '设备', '3', 'com.ruoyi.project.module.device.controller.DeviceController.remove()', '1', 'admin', '研发部门', '/module/device/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"1\"]}', '0', null, '2018-09-08 05:23:23');
INSERT INTO `sys_oper_log` VALUES ('145', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', null, '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceTag\":[\"1\"],\"deviceId\":[\"4\"],\"deviceName\":[\"4\"],\"deviceType\":[\"O\"]}', '0', null, '2018-09-08 05:45:31');
INSERT INTO `sys_oper_log` VALUES ('146', '场景', '1', 'com.ruoyi.project.module.scene.controller.SceneController.addSave()', '1', 'admin', null, '/module/scene/add', '127.0.0.1', 'XX XX', '{\"sceneName\":[\"月季花\"],\"sceneParams\":[\"\"],\"remarks\":[\"\"]}', '0', null, '2018-09-08 06:02:35');
INSERT INTO `sys_oper_log` VALUES ('147', '字典类型', '2', 'com.ruoyi.project.system.dict.controller.DictTypeController.editSave()', '1', 'admin', null, '/system/dict/edit', '127.0.0.1', 'XX XX', '{\"dictId\":[\"102\"],\"dictName\":[\"业务状态\"],\"dictType\":[\"sys_business_status\"],\"status\":[\"0\"],\"remark\":[\"业务状态\"]}', '0', null, '2018-09-08 06:04:55');
INSERT INTO `sys_oper_log` VALUES ('148', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"34\"],\"dictLabel\":[\"关闭\"],\"dictValue\":[\"1\"],\"dictType\":[\"sys_business_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"业务状态关闭\"]}', '0', null, '2018-09-08 06:05:08');
INSERT INTO `sys_oper_log` VALUES ('149', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"33\"],\"dictLabel\":[\"开启\"],\"dictValue\":[\"0\"],\"dictType\":[\"sys_business_status\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"业务状态开启\"]}', '0', null, '2018-09-08 06:05:16');
INSERT INTO `sys_oper_log` VALUES ('150', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2002\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"设备组管理\"],\"url\":[\"/module/deviceGroup\"],\"perms\":[\"module:deviceGroup:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-09-08 06:20:02');
INSERT INTO `sys_oper_log` VALUES ('151', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2003\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"场景管理\"],\"url\":[\"/module/scene\"],\"perms\":[\"module:scene:view\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-09-08 06:20:18');
INSERT INTO `sys_oper_log` VALUES ('152', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', null, '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2019\"],\"menuType\":[\"C\"],\"menuName\":[\"设备组态\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-09-08 06:23:17');
INSERT INTO `sys_oper_log` VALUES ('153', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', null, '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2019\"],\"menuType\":[\"C\"],\"menuName\":[\"场景组态\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-09-08 06:23:36');
INSERT INTO `sys_oper_log` VALUES ('154', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', null, '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceTag\":[\"2\"],\"deviceId\":[\"5\"],\"deviceName\":[\"5\"],\"deviceType\":[\"O\"]}', '0', null, '2018-09-08 06:33:24');
INSERT INTO `sys_oper_log` VALUES ('155', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', null, '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceTag\":[\"2\"],\"deviceId\":[\"6\"],\"deviceName\":[\"6\"],\"deviceType\":[\"O\"]}', '0', null, '2018-09-08 06:33:37');
INSERT INTO `sys_oper_log` VALUES ('156', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"32\"],\"dictLabel\":[\"控制端\"],\"dictValue\":[\"2\"],\"dictType\":[\"sys_device_tag\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"控制端\"]}', '0', null, '2018-09-08 06:34:36');
INSERT INTO `sys_oper_log` VALUES ('157', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"27\"],\"dictLabel\":[\"光感设备\"],\"dictValue\":[\"L\"],\"dictType\":[\"sys_device_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"光控设备\"]}', '0', null, '2018-09-08 06:35:19');
INSERT INTO `sys_oper_log` VALUES ('158', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"28\"],\"dictLabel\":[\"湿度感设备\"],\"dictValue\":[\"S\"],\"dictType\":[\"sys_device_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"info\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"湿度感应设备\"]}', '0', null, '2018-09-08 06:35:25');
INSERT INTO `sys_oper_log` VALUES ('159', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"29\"],\"dictLabel\":[\"二氧化碳感应设备\"],\"dictValue\":[\"O\"],\"dictType\":[\"sys_device_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"测量二氧化碳浓度设备\"]}', '0', null, '2018-09-08 06:35:31');
INSERT INTO `sys_oper_log` VALUES ('160', '字典数据', '2', 'com.ruoyi.project.system.dict.controller.DictDataController.editSave()', '1', 'admin', null, '/system/dict/data/edit', '127.0.0.1', 'XX XX', '{\"dictCode\":[\"30\"],\"dictLabel\":[\"酸碱度测控设备\"],\"dictValue\":[\"H\"],\"dictType\":[\"sys_device_type\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"测量酸碱度设备\"]}', '0', null, '2018-09-08 06:35:41');
INSERT INTO `sys_oper_log` VALUES ('161', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', null, '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2019\"],\"parentId\":[\"2000\"],\"menuType\":[\"M\"],\"menuName\":[\"设备组态\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-folder-open\"],\"visible\":[\"0\"]}', '0', null, '2018-09-08 06:38:19');
INSERT INTO `sys_oper_log` VALUES ('162', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2020\"],\"parentId\":[\"2019\"],\"menuType\":[\"C\"],\"menuName\":[\"设备组态\"],\"url\":[\"/module/deviceGroup\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-09-08 13:50:02');
INSERT INTO `sys_oper_log` VALUES ('163', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2021\"],\"parentId\":[\"2019\"],\"menuType\":[\"C\"],\"menuName\":[\"场景组态\"],\"url\":[\"/module/scene\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-09-08 13:50:26');
INSERT INTO `sys_oper_log` VALUES ('164', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2020\"],\"parentId\":[\"2019\"],\"menuType\":[\"C\"],\"menuName\":[\"设备组态\"],\"url\":[\"/module/deviceGroup\"],\"perms\":[\"module:deviceGroup:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-09-08 13:50:49');
INSERT INTO `sys_oper_log` VALUES ('165', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2021\"],\"parentId\":[\"2019\"],\"menuType\":[\"C\"],\"menuName\":[\"场景组态\"],\"url\":[\"/module/scene\"],\"perms\":[\"module:scene:view\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '0', null, '2018-09-08 13:51:12');
INSERT INTO `sys_oper_log` VALUES ('166', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', null, '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceTag\":[\"1\"],\"deviceId\":[\"7\"],\"deviceName\":[\"7\"]}', '0', null, '2018-09-15 17:59:32');
INSERT INTO `sys_oper_log` VALUES ('167', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', null, '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceTag\":[\"1\"],\"deviceId\":[\"8\"],\"deviceName\":[\"8\"],\"deviceParam\":[\"T,S,H\"]}', '0', null, '2018-09-15 18:06:51');
INSERT INTO `sys_oper_log` VALUES ('168', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', null, '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceTag\":[\"1\"],\"deviceId\":[\"9\"],\"deviceName\":[\"9\"],\"deviceParam\":[\"L,S\"]}', '0', null, '2018-09-15 18:16:31');
INSERT INTO `sys_oper_log` VALUES ('169', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', '研发部门', '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceTag\":[\"2\"],\"deviceId\":[\"10\"],\"deviceName\":[\"10\"],\"deviceParam\":[\"\"]}', '0', null, '2018-09-15 19:21:44');
INSERT INTO `sys_oper_log` VALUES ('170', '用户管理', '1', 'com.ruoyi.project.system.user.controller.UserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', 'XX XX', '{\"deptId\":[\"103\"],\"loginName\":[\"test\"],\"userName\":[\"test\"],\"password\":[\"123456\"],\"email\":[\"test@qq.com\"],\"phonenumber\":[\"15754715473\"],\"sex\":[\"0\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"4\"]}', '0', null, '2018-09-15 19:36:06');
INSERT INTO `sys_oper_log` VALUES ('171', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', null, '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceTag\":[\"2\"],\"deviceId\":[\"11\"],\"deviceName\":[\"11\"],\"deviceParam\":[\"\"]}', '0', null, '2018-09-15 19:42:54');
INSERT INTO `sys_oper_log` VALUES ('172', '设备', '3', 'com.ruoyi.project.module.device.controller.DeviceController.remove()', '1', 'admin', null, '/module/device/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"3,4,5,6,7\"]}', '0', null, '2018-09-15 19:43:06');
INSERT INTO `sys_oper_log` VALUES ('173', '设备', '3', 'com.ruoyi.project.module.device.controller.DeviceController.remove()', '1', 'admin', null, '/module/device/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"7\"]}', '0', null, '2018-09-15 19:43:11');
INSERT INTO `sys_oper_log` VALUES ('174', '设备', '3', 'com.ruoyi.project.module.device.controller.DeviceController.remove()', '1', 'admin', null, '/module/device/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"7,10\"]}', '0', null, '2018-09-15 19:43:22');
INSERT INTO `sys_oper_log` VALUES ('175', '设备', '3', 'com.ruoyi.project.module.device.controller.DeviceController.remove()', '1', 'admin', null, '/module/device/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"7\"]}', '0', null, '2018-09-15 19:43:28');
INSERT INTO `sys_oper_log` VALUES ('176', '设备', '3', 'com.ruoyi.project.module.device.controller.DeviceController.remove()', '1', 'admin', null, '/module/device/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"10\"]}', '0', null, '2018-09-15 19:43:35');
INSERT INTO `sys_oper_log` VALUES ('177', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', null, '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceTag\":[\"1\"],\"deviceId\":[\"1\"],\"deviceName\":[\"1\"],\"deviceParam\":[\"T,S,H\"]}', '0', null, '2018-09-15 19:44:48');
INSERT INTO `sys_oper_log` VALUES ('178', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', null, '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceTag\":[\"2\"],\"deviceId\":[\"2\"],\"deviceName\":[\"2\"],\"deviceParam\":[\"\"]}', '0', null, '2018-09-15 19:45:02');
INSERT INTO `sys_oper_log` VALUES ('179', '字典类型', '3', 'com.ruoyi.project.system.dict.controller.DictTypeController.remove()', '1', 'admin', '研发部门', '/system/dict/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"100\"]}', '0', null, '2018-09-15 20:35:29');
INSERT INTO `sys_oper_log` VALUES ('180', '字典数据', '3', 'com.ruoyi.project.system.dict.controller.DictDataController.remove()', '1', 'admin', '研发部门', '/system/dict/data/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"30\"]}', '0', null, '2018-09-15 20:35:38');
INSERT INTO `sys_oper_log` VALUES ('181', '字典数据', '3', 'com.ruoyi.project.system.dict.controller.DictDataController.remove()', '1', 'admin', '研发部门', '/system/dict/data/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"29\"]}', '0', null, '2018-09-15 20:35:40');
INSERT INTO `sys_oper_log` VALUES ('182', '字典数据', '3', 'com.ruoyi.project.system.dict.controller.DictDataController.remove()', '1', 'admin', '研发部门', '/system/dict/data/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"28\"]}', '0', null, '2018-09-15 20:35:42');
INSERT INTO `sys_oper_log` VALUES ('183', '字典数据', '3', 'com.ruoyi.project.system.dict.controller.DictDataController.remove()', '1', 'admin', '研发部门', '/system/dict/data/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"27\"]}', '0', null, '2018-09-15 20:35:44');
INSERT INTO `sys_oper_log` VALUES ('184', '字典数据', '3', 'com.ruoyi.project.system.dict.controller.DictDataController.remove()', '1', 'admin', '研发部门', '/system/dict/data/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"26\"]}', '0', null, '2018-09-15 20:35:45');
INSERT INTO `sys_oper_log` VALUES ('185', '字典类型', '3', 'com.ruoyi.project.system.dict.controller.DictTypeController.remove()', '1', 'admin', '研发部门', '/system/dict/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"100\"]}', '0', null, '2018-09-15 20:35:52');
INSERT INTO `sys_oper_log` VALUES ('186', '字典类型', '1', 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', 'XX XX', '{\"dictName\":[\"采集参数\"],\"dictType\":[\"device_collect_param\"],\"status\":[\"0\"],\"remark\":[\"采集端采集参数\"]}', '0', null, '2018-09-15 20:39:00');
INSERT INTO `sys_oper_log` VALUES ('187', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"温度\"],\"dictValue\":[\"T\"],\"dictType\":[\"device_collect_param\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"warning\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"温度参数\"]}', '0', null, '2018-09-15 20:40:24');
INSERT INTO `sys_oper_log` VALUES ('188', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"湿度\"],\"dictValue\":[\"S\"],\"dictType\":[\"device_collect_param\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"湿度参数\"]}', '0', null, '2018-09-15 20:40:54');
INSERT INTO `sys_oper_log` VALUES ('189', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"土壤湿度\"],\"dictValue\":[\"C\"],\"dictType\":[\"device_collect_param\"],\"cssClass\":[\"\"],\"dictSort\":[\"3\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"土壤湿度\"]}', '0', null, '2018-09-15 20:41:22');
INSERT INTO `sys_oper_log` VALUES ('190', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"光照\"],\"dictValue\":[\"L\"],\"dictType\":[\"device_collect_param\"],\"cssClass\":[\"\"],\"dictSort\":[\"4\"],\"listClass\":[\"danger\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"光照参数\"]}', '0', null, '2018-09-15 20:41:58');
INSERT INTO `sys_oper_log` VALUES ('191', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"酸碱度\"],\"dictValue\":[\"H\"],\"dictType\":[\"device_collect_param\"],\"cssClass\":[\"\"],\"dictSort\":[\"5\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"酸碱度\"]}', '0', null, '2018-09-15 20:42:27');
INSERT INTO `sys_oper_log` VALUES ('192', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"二氧化碳\"],\"dictValue\":[\"O\"],\"dictType\":[\"device_collect_param\"],\"cssClass\":[\"\"],\"dictSort\":[\"6\"],\"listClass\":[\"primary\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"二氧化碳\"]}', '0', null, '2018-09-15 20:43:08');
INSERT INTO `sys_oper_log` VALUES ('193', '字典类型', '1', 'com.ruoyi.project.system.dict.controller.DictTypeController.addSave()', '1', 'admin', '研发部门', '/system/dict/add', '127.0.0.1', 'XX XX', '{\"dictName\":[\"设备是否在线\"],\"dictType\":[\"device_is_online\"],\"status\":[\"0\"],\"remark\":[\"设备是否在线\"]}', '0', null, '2018-09-15 20:45:16');
INSERT INTO `sys_oper_log` VALUES ('194', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"离线\"],\"dictValue\":[\"0\"],\"dictType\":[\"device_is_online\"],\"cssClass\":[\"\"],\"dictSort\":[\"1\"],\"listClass\":[\"default\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"离线状态\"]}', '0', null, '2018-09-15 20:47:59');
INSERT INTO `sys_oper_log` VALUES ('195', '字典数据', '1', 'com.ruoyi.project.system.dict.controller.DictDataController.addSave()', '1', 'admin', '研发部门', '/system/dict/data/add', '127.0.0.1', 'XX XX', '{\"dictLabel\":[\"在线\"],\"dictValue\":[\"1\"],\"dictType\":[\"device_is_online\"],\"cssClass\":[\"\"],\"dictSort\":[\"2\"],\"listClass\":[\"success\"],\"isDefault\":[\"Y\"],\"status\":[\"0\"],\"remark\":[\"在线\"]}', '0', null, '2018-09-15 20:48:17');
INSERT INTO `sys_oper_log` VALUES ('196', '字典数据', '3', 'com.ruoyi.project.system.dict.controller.DictDataController.remove()', '1', 'admin', '研发部门', '/system/dict/data/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"34,33\"]}', '0', null, '2018-09-15 20:49:06');
INSERT INTO `sys_oper_log` VALUES ('197', '字典类型', '3', 'com.ruoyi.project.system.dict.controller.DictTypeController.remove()', '1', 'admin', '研发部门', '/system/dict/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"102\"]}', '0', null, '2018-09-15 20:49:17');
INSERT INTO `sys_oper_log` VALUES ('198', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', '研发部门', '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceTag\":[\"1\"],\"deviceId\":[\"3\"],\"deviceName\":[\"3\"],\"deviceParam\":[\"T,C,H\"]}', '0', null, '2018-09-15 20:51:00');
INSERT INTO `sys_oper_log` VALUES ('199', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/2019', '127.0.0.1', 'XX XX', '{}', '0', null, '2018-09-27 22:47:33');
INSERT INTO `sys_oper_log` VALUES ('200', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/2019', '127.0.0.1', 'XX XX', '{}', '0', null, '2018-09-27 22:47:46');
INSERT INTO `sys_oper_log` VALUES ('201', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/2020', '127.0.0.1', 'XX XX', '{}', '0', null, '2018-09-27 22:47:52');
INSERT INTO `sys_oper_log` VALUES ('202', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/2021', '127.0.0.1', 'XX XX', '{}', '0', null, '2018-09-27 22:47:59');
INSERT INTO `sys_oper_log` VALUES ('203', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/2019', '127.0.0.1', 'XX XX', '{}', '0', null, '2018-09-27 22:48:04');
INSERT INTO `sys_oper_log` VALUES ('204', '场景', '1', 'com.ruoyi.project.module.scene.controller.SceneController.addSave()', '1', 'admin', '研发部门', '/module/scene/add', '127.0.0.1', 'XX XX', '{\"sceneName\":[\"黄瓜\"],\"sceneParams\":[\"\"],\"remark\":[\"\"]}', '0', null, '2018-10-07 16:38:36');
INSERT INTO `sys_oper_log` VALUES ('205', '设备组', '1', 'com.ruoyi.project.module.deviceGroup.controller.DeviceGroupController.addSave()', '1', 'admin', '研发部门', '/module/deviceGroup/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"1\"],\"groupName\":[\"1\"],\"orderNum\":[\"1\"],\"remark\":[\"\"]}', '0', null, '2018-10-07 16:55:19');
INSERT INTO `sys_oper_log` VALUES ('206', '设备组', '3', 'com.ruoyi.project.module.deviceGroup.controller.DeviceGroupController.remove()', '1', 'admin', null, '/module/deviceGroup/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"1\"]}', '0', null, '2018-10-07 17:00:01');
INSERT INTO `sys_oper_log` VALUES ('207', '场景', '3', 'com.ruoyi.project.module.scene.controller.SceneController.remove()', '1', 'admin', null, '/module/scene/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"2\"]}', '0', null, '2018-10-07 17:00:04');
INSERT INTO `sys_oper_log` VALUES ('208', '场景', '3', 'com.ruoyi.project.module.scene.controller.SceneController.remove()', '1', 'admin', null, '/module/scene/remove', '127.0.0.1', 'XX XX', '{\"ids\":[\"1\"]}', '0', null, '2018-10-07 17:00:06');
INSERT INTO `sys_oper_log` VALUES ('209', '场景', '1', 'com.ruoyi.project.module.scene.controller.SceneController.addSave()', '1', 'admin', '研发部门', '/module/scene/add', '127.0.0.1', 'XX XX', '{\"sceneName\":[\"月季花\"],\"sceneParams\":[\"\"],\"remark\":[\"\"]}', '0', null, '2018-10-07 17:06:03');
INSERT INTO `sys_oper_log` VALUES ('210', '设备组', '1', 'com.ruoyi.project.module.deviceGroup.controller.DeviceGroupController.addSave()', '1', 'admin', '研发部门', '/module/deviceGroup/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"\"],\"groupName\":[\"1111\"],\"orderNum\":[\"1\"],\"remark\":[\"\"]}', '0', null, '2018-10-07 17:06:21');
INSERT INTO `sys_oper_log` VALUES ('211', '设备组', '1', 'com.ruoyi.project.module.deviceGroup.controller.DeviceGroupController.addSave()', '1', 'admin', '研发部门', '/module/deviceGroup/add', '127.0.0.1', 'XX XX', '{\"groupId\":[\"4\"],\"groupName\":[\"2222\"],\"orderNum\":[\"2\"],\"remark\":[\"\"]}', '0', null, '2018-10-07 17:15:58');
INSERT INTO `sys_oper_log` VALUES ('212', '场景', '2', 'com.ruoyi.project.module.scene.controller.SceneController.editSave()', '1', 'admin', '研发部门', '/module/scene/edit', '127.0.0.1', 'XX XX', '{\"sceneId\":[\"3\"],\"sceneName\":[\"月季花\"],\"sceneParams\":[\"{“T”:25,\\\"S\\\":\\\"45\\\",\\\"H\\\":35}\"],\"remark\":[\"\"]}', '0', null, '2018-10-07 17:23:36');
INSERT INTO `sys_oper_log` VALUES ('213', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"组态管理\"],\"url\":[\"\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-bar-chart\"],\"visible\":[\"0\"]}', '0', null, '2018-10-07 17:29:57');
INSERT INTO `sys_oper_log` VALUES ('214', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"1\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统管理\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-gear\"],\"visible\":[\"0\"]}', '0', null, '2018-10-07 17:30:08');
INSERT INTO `sys_oper_log` VALUES ('215', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"0\"]}', '0', null, '2018-10-07 17:30:14');
INSERT INTO `sys_oper_log` VALUES ('216', '菜单管理', '2', 'com.ruoyi.project.system.menu.controller.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"perms\":[\"\"],\"orderNum\":[\"5\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"]}', '0', null, '2018-10-07 17:30:21');
INSERT INTO `sys_oper_log` VALUES ('217', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2019\"],\"menuType\":[\"C\"],\"menuName\":[\"设备组态\"],\"url\":[\"/module/device/configList\"],\"perms\":[\"module:device:configuration\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-10-07 17:32:19');
INSERT INTO `sys_oper_log` VALUES ('218', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"场景组态\"],\"url\":[\"/module/scene/configList\"],\"perms\":[\"module:scene:configuration\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-10-07 17:33:35');
INSERT INTO `sys_oper_log` VALUES ('219', '菜单管理', '3', 'com.ruoyi.project.system.menu.controller.MenuController.remove()', '1', 'admin', '研发部门', '/system/menu/remove/2021', '127.0.0.1', 'XX XX', '{}', '0', null, '2018-10-07 17:34:06');
INSERT INTO `sys_oper_log` VALUES ('220', '菜单管理', '1', 'com.ruoyi.project.system.menu.controller.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\"parentId\":[\"2019\"],\"menuType\":[\"C\"],\"menuName\":[\"场景组态\"],\"url\":[\"/module/scene/configList\"],\"perms\":[\"module:scene:configuration\"],\"orderNum\":[\"2\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '0', null, '2018-10-07 17:35:05');
INSERT INTO `sys_oper_log` VALUES ('221', '个人信息', '2', 'com.ruoyi.project.system.user.controller.ProfileController.update()', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', 'XX XX', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"],\"dept.deptName\":[\"研发部门\"],\"userName\":[\"若依\"],\"email\":[\"ry@163.com\"],\"phonenumber\":[\"15888888888\"],\"sex\":[\"0\"]}', '0', null, '2018-10-08 06:57:44');
INSERT INTO `sys_oper_log` VALUES ('222', '设备组', '2', 'com.ruoyi.project.module.deviceGroup.controller.DeviceGroupController.editSave()', '1', 'admin', '研发部门', '/module/deviceGroup/edit', '127.0.0.1', 'XX XX', '{\"groupId\":[\"2\",\"2\"],\"groupName\":[\"2号\"],\"orderNum\":[\"1\"],\"remark\":[\"\"]}', '0', null, '2018-10-08 06:58:31');
INSERT INTO `sys_oper_log` VALUES ('223', '设备组', '2', 'com.ruoyi.project.module.deviceGroup.controller.DeviceGroupController.editSave()', '1', 'admin', '研发部门', '/module/deviceGroup/edit', '127.0.0.1', 'XX XX', '{\"groupId\":[\"4\",\"4\"],\"groupName\":[\"4号\"],\"orderNum\":[\"2\"],\"remark\":[\"\"]}', '0', null, '2018-10-08 06:58:40');
INSERT INTO `sys_oper_log` VALUES ('224', '设备', '2', 'com.ruoyi.project.module.device.controller.DeviceController.editSave()', '1', 'admin', '研发部门', '/module/device/edit', '127.0.0.1', 'XX XX', '{\"id\":[\"13\"],\"deviceId\":[\"1\"],\"deviceName\":[\"1号设备\"],\"deviceGroupId\":[\"\"]}', '0', null, '2018-10-08 07:08:05');
INSERT INTO `sys_oper_log` VALUES ('225', '设备', '2', 'com.ruoyi.project.module.device.controller.DeviceController.editSave()', '1', 'admin', '研发部门', '/module/device/edit', '127.0.0.1', 'XX XX', '{\"id\":[\"14\"],\"deviceId\":[\"2\"],\"deviceName\":[\"2号设备\"],\"deviceGroupId\":[\"2\"]}', '0', null, '2018-10-11 19:02:44');
INSERT INTO `sys_oper_log` VALUES ('226', '设备', '2', 'com.ruoyi.project.module.device.controller.DeviceController.editSave()', '1', 'admin', '研发部门', '/module/device/edit', '127.0.0.1', 'XX XX', '{\"id\":[\"15\"],\"deviceId\":[\"3\"],\"deviceName\":[\"3号设备\"],\"deviceGroupId\":[\"2\"]}', '0', null, '2018-10-11 19:02:54');
INSERT INTO `sys_oper_log` VALUES ('227', '设备', '2', 'com.ruoyi.project.module.device.controller.DeviceController.editSave()', '1', 'admin', '研发部门', '/module/device/edit', '127.0.0.1', 'XX XX', '{\"id\":[\"13\"],\"deviceId\":[\"1\"],\"deviceName\":[\"1号设备\"],\"deviceGroupId\":[\"2\"]}', '0', null, '2018-10-11 19:03:03');
INSERT INTO `sys_oper_log` VALUES ('228', '设备', '1', 'com.ruoyi.project.module.device.controller.DeviceController.addSave()', '1', 'admin', '研发部门', '/module/device/add', '127.0.0.1', 'XX XX', '{\"deviceTag\":[\"2\"],\"deviceId\":[\"4\"],\"deviceName\":[\"4号设备\"],\"deviceParam\":[\"\"]}', '0', null, '2018-10-11 20:03:47');
INSERT INTO `sys_oper_log` VALUES ('229', '设备', '2', 'com.ruoyi.project.module.device.controller.DeviceController.editSave()', '1', 'admin', '研发部门', '/module/device/edit', '127.0.0.1', 'XX XX', '{\"id\":[\"16\"],\"deviceId\":[\"4\"],\"deviceName\":[\"4号设备\"],\"deviceGroupId\":[\"4\"]}', '0', null, '2018-10-11 20:05:07');
INSERT INTO `sys_oper_log` VALUES ('230', '设备', '2', 'com.ruoyi.project.module.device.controller.DeviceController.editSave()', '1', 'admin', '研发部门', '/module/device/edit', '127.0.0.1', 'XX XX', '{\"id\":[\"15\"],\"deviceId\":[\"3\"],\"deviceName\":[\"3号设备\"],\"deviceGroupId\":[\"4\"]}', '0', null, '2018-10-11 20:05:20');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '100');
INSERT INTO `sys_role_menu` VALUES ('1', '101');
INSERT INTO `sys_role_menu` VALUES ('1', '102');
INSERT INTO `sys_role_menu` VALUES ('1', '103');
INSERT INTO `sys_role_menu` VALUES ('1', '104');
INSERT INTO `sys_role_menu` VALUES ('1', '105');
INSERT INTO `sys_role_menu` VALUES ('1', '106');
INSERT INTO `sys_role_menu` VALUES ('1', '107');
INSERT INTO `sys_role_menu` VALUES ('1', '108');
INSERT INTO `sys_role_menu` VALUES ('1', '109');
INSERT INTO `sys_role_menu` VALUES ('1', '110');
INSERT INTO `sys_role_menu` VALUES ('1', '111');
INSERT INTO `sys_role_menu` VALUES ('1', '112');
INSERT INTO `sys_role_menu` VALUES ('1', '113');
INSERT INTO `sys_role_menu` VALUES ('1', '114');
INSERT INTO `sys_role_menu` VALUES ('1', '500');
INSERT INTO `sys_role_menu` VALUES ('1', '501');
INSERT INTO `sys_role_menu` VALUES ('1', '1000');
INSERT INTO `sys_role_menu` VALUES ('1', '1001');
INSERT INTO `sys_role_menu` VALUES ('1', '1002');
INSERT INTO `sys_role_menu` VALUES ('1', '1003');
INSERT INTO `sys_role_menu` VALUES ('1', '1004');
INSERT INTO `sys_role_menu` VALUES ('1', '1005');
INSERT INTO `sys_role_menu` VALUES ('1', '1006');
INSERT INTO `sys_role_menu` VALUES ('1', '1007');
INSERT INTO `sys_role_menu` VALUES ('1', '1008');
INSERT INTO `sys_role_menu` VALUES ('1', '1009');
INSERT INTO `sys_role_menu` VALUES ('1', '1010');
INSERT INTO `sys_role_menu` VALUES ('1', '1011');
INSERT INTO `sys_role_menu` VALUES ('1', '1012');
INSERT INTO `sys_role_menu` VALUES ('1', '1013');
INSERT INTO `sys_role_menu` VALUES ('1', '1014');
INSERT INTO `sys_role_menu` VALUES ('1', '1015');
INSERT INTO `sys_role_menu` VALUES ('1', '1016');
INSERT INTO `sys_role_menu` VALUES ('1', '1017');
INSERT INTO `sys_role_menu` VALUES ('1', '1018');
INSERT INTO `sys_role_menu` VALUES ('1', '1019');
INSERT INTO `sys_role_menu` VALUES ('1', '1020');
INSERT INTO `sys_role_menu` VALUES ('1', '1021');
INSERT INTO `sys_role_menu` VALUES ('1', '1022');
INSERT INTO `sys_role_menu` VALUES ('1', '1023');
INSERT INTO `sys_role_menu` VALUES ('1', '1024');
INSERT INTO `sys_role_menu` VALUES ('1', '1025');
INSERT INTO `sys_role_menu` VALUES ('1', '1026');
INSERT INTO `sys_role_menu` VALUES ('1', '1027');
INSERT INTO `sys_role_menu` VALUES ('1', '1028');
INSERT INTO `sys_role_menu` VALUES ('1', '1029');
INSERT INTO `sys_role_menu` VALUES ('1', '1030');
INSERT INTO `sys_role_menu` VALUES ('1', '1031');
INSERT INTO `sys_role_menu` VALUES ('1', '1032');
INSERT INTO `sys_role_menu` VALUES ('1', '1033');
INSERT INTO `sys_role_menu` VALUES ('1', '1034');
INSERT INTO `sys_role_menu` VALUES ('1', '1035');
INSERT INTO `sys_role_menu` VALUES ('1', '1036');
INSERT INTO `sys_role_menu` VALUES ('1', '1037');
INSERT INTO `sys_role_menu` VALUES ('1', '1038');
INSERT INTO `sys_role_menu` VALUES ('1', '1039');
INSERT INTO `sys_role_menu` VALUES ('1', '1040');
INSERT INTO `sys_role_menu` VALUES ('1', '1041');
INSERT INTO `sys_role_menu` VALUES ('1', '1042');
INSERT INTO `sys_role_menu` VALUES ('1', '1043');
INSERT INTO `sys_role_menu` VALUES ('1', '1044');
INSERT INTO `sys_role_menu` VALUES ('1', '1045');
INSERT INTO `sys_role_menu` VALUES ('1', '1046');
INSERT INTO `sys_role_menu` VALUES ('1', '1047');
INSERT INTO `sys_role_menu` VALUES ('1', '1048');
INSERT INTO `sys_role_menu` VALUES ('1', '1049');
INSERT INTO `sys_role_menu` VALUES ('1', '1050');
INSERT INTO `sys_role_menu` VALUES ('1', '1051');
INSERT INTO `sys_role_menu` VALUES ('1', '1052');
INSERT INTO `sys_role_menu` VALUES ('1', '1053');
INSERT INTO `sys_role_menu` VALUES ('1', '1054');
INSERT INTO `sys_role_menu` VALUES ('1', '1055');
INSERT INTO `sys_role_menu` VALUES ('1', '2000');
INSERT INTO `sys_role_menu` VALUES ('1', '2001');
INSERT INTO `sys_role_menu` VALUES ('1', '2002');
INSERT INTO `sys_role_menu` VALUES ('1', '2003');
INSERT INTO `sys_role_menu` VALUES ('1', '2004');
INSERT INTO `sys_role_menu` VALUES ('1', '2005');
INSERT INTO `sys_role_menu` VALUES ('1', '2006');
INSERT INTO `sys_role_menu` VALUES ('1', '2007');
INSERT INTO `sys_role_menu` VALUES ('1', '2008');
INSERT INTO `sys_role_menu` VALUES ('1', '2009');
INSERT INTO `sys_role_menu` VALUES ('1', '2010');
INSERT INTO `sys_role_menu` VALUES ('1', '2011');
INSERT INTO `sys_role_menu` VALUES ('1', '2012');
INSERT INTO `sys_role_menu` VALUES ('1', '2013');
INSERT INTO `sys_role_menu` VALUES ('1', '2014');
INSERT INTO `sys_role_menu` VALUES ('1', '2015');
INSERT INTO `sys_role_menu` VALUES ('1', '2016');
INSERT INTO `sys_role_menu` VALUES ('1', '2017');
INSERT INTO `sys_role_menu` VALUES ('1', '2018');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(20) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '0', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2018-10-11 21:02:22', 'admin', '2018-03-16 11:33:00', 'ry', '2018-10-11 21:02:23', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');
INSERT INTO `sys_user` VALUES ('3', '103', 'test', 'test', '00', 'test@qq.com', '15754715473', '0', '', '4a83cc1ba0d8a87a6e47258649397908', '82b728', '0', '0', '', null, 'admin', '2018-09-15 19:36:06', '', null, '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('1533a5de-acb1-48e8-9f6b-1b3c43eae391', 'admin', '研发部门', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', 'on_line', '2018-10-11 21:01:15', '2018-10-11 21:01:24', '1800000');
INSERT INTO `sys_user_online` VALUES ('9e0ed4c1-a52b-4713-b445-b74ae2a195f8', 'admin', '研发部门', '127.0.0.1', 'XX XX', 'Chrome', 'Windows 10', 'on_line', '2018-10-11 21:02:12', '2018-10-11 21:02:23', '1800000');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `post_id` varchar(64) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('3', '4');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('3', '2');
