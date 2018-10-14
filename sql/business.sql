-- ----------------------------
-- 设备表
-- ----------------------------
DROP TABLE IF EXISTS `bu_device`;
CREATE TABLE `bu_device` (
  `id` varchar(64) NOT NULL COMMENT '系统记录id',
  `device_id` varchar(32) NOT NULL COMMENT '设备id',
  `device_name` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `device_status` char(1) DEFAULT '0' COMMENT '设备状态（0-停用，1-正常）',
  `device_type` varchar(1) DEFAULT NULL COMMENT '设备类型',
  `device_group_id` int(11) DEFAULT NULL COMMENT '设备组id',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB auto_increment=100 DEFAULT CHARSET=utf8 comment = '设备表';

-- ----------------------------
-- 设备分组表
-- ----------------------------
DROP TABLE IF EXISTS `bu_device_group`;
CREATE TABLE `bu_device_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `group_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（''0''-正常，''2''-删除）',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB auto_increment=100 DEFAULT CHARSET=utf8 COMMENT='设备组表';

-- ----------------------------
-- 设备日志表
-- ----------------------------
DROP TABLE IF EXISTS `bu_device_log`;
CREATE TABLE `bu_device_log` (
  `id` varchar(64) NOT NULL COMMENT '系统记录id',
  `device_id` varchar(32) NOT NULL COMMENT '设备id',
  `device_data` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB auto_increment=100 DEFAULT CHARSET=utf8  COMMENT='设备数据日志表';

-- ----------------------------
-- 场景表
-- ----------------------------
DROP TABLE IF EXISTS `bu_scene`;
CREATE TABLE `bu_scene` (
  `scene_id` int(11) NOT NULL,
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
) ENGINE=InnoDB auto_increment=100 DEFAULT CHARSET=utf8 COMMENT='场景表';