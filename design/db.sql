-- Luming Vote System

CREATE DATABASE `vote`;
USE vote;

-- 用户信息表
CREATE TABLE `user`
(
  `id` INT UNSIGNED AUTO_INCREMENT,     -- 用户ID
  `email` VARCHAR(255) UNIQUE NOT NULL, -- 电子邮件(作账号)
  `password` CHAR(32) NOT NULL,         -- 用户密码
  `nickname` VARCHAR(15) NOT NULL,      -- 用户昵称
  `organization` varchar(45) NOT NULL,  -- 所属组织
  `is_staff` TINYINT(1)  DEFAULT 0,     -- 是否为管理人员
  `is_active` TINYINT(1) DEFAULT 1,     -- 账号是否可用
  `token` CHAR(32) DEFAULT NULL,        -- 登录令牌
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1000001 DEFAULT CHARSET=utf8mb4;

-- 活动信息表
CREATE TABLE `activity`
(
  `id` CHAR(32) NOT NULL,                       -- 活动ID
  `title` VARCHAR(40) NOT NULL,                 -- 活动标题
  `publisher` INT UNSIGNED NOT NULL,            -- 发布者ID
  `suffix` CHAR(3) NOT NULL,                    -- 条目称谓
  `quantifier` CHAR(1) NOT NULL,                -- 条目量词
  `description` VARCHAR(3000) NOT NULL,         -- 活动描述（富文本）
  `vote_time_start` DATETIME NOT NULL,          -- 投票开始时间
  `vote_time_end` DATETIME NOT NULL,            -- 投票截止时间
  `apply_time_start` DATETIME NOT NULL,         -- 报名开始时间
  `apply_time_end` DATETIME NOT NULL,           -- 报名截止时间
  `maxium` TINYINT UNSIGNED NOT NULL,           -- 单次最多选择
  `sum_entry` SMALLINT	UNSIGNED DEFAULT 0,     -- 条目总数
  `sum_voted` INT UNSIGNED DEFAULT 0,           -- 投票总数
  `sum_visited` INT UNSIGNED DEFAULT 0,         -- 访问总数
  `img_name` CHAR(36) DEFAULT NULL,             -- 宣传图片名
  `options` VARCHAR(300) NOT NULL,              -- 其它必填项
  `destroyed` TINYINT(1) DEFAULT 0,             -- 是否销毁
  PRIMARY KEY(`id`),
  CHECK(`maxium` < 101)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 条目信息表
CREATE TABLE `entry`
(
  `id` INT UNSIGNED AUTO_INCREMENT,     -- 条目ID
  `aid` CHAR(32) NOT NULL,              -- 活动ID
  `title` VARCHAR(25) NOT NULL,         -- 条目标题
  `description` VARCHAR(3000) NOT NULL, -- 条目描述
  `acquisition` INT UNSIGNED DEFAULT 0, -- 取得投票数
  `img_name` CHAR(36) DEFAULT NULL,     -- 宣传图片名
  PRIMARY KEY(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- 报名信息表
CREATE TABLE `apply` 
(
  `id` INT UNSIGNED AUTO_INCREMENT,      -- 报名ID
  `aid` CHAR(32) NOT NULL,               -- 活动ID
  `reviewed` TINYINT(1) NOT NULL,        -- 是否通过审核
  `title` VARCHAR(15) NOT NULL,          -- 条目标题
  `description` VARCHAR(3000) NOT NULL,  -- 报名描述（富文本）
  `img_name` CHAR(36) DEFAULT NULL,      -- 宣传图片名
  `name` VARCHAR(15) DEFAULT NULL,       -- 真实姓名
  `sex` TINYINT(1) DEFAULT NULL,         -- 人物性别
  `age` TINYINT(3) DEFAULT NULL,         -- 人物年龄
  `telephone` CHAR(11) DEFAULT NULL,     -- 手机号码
  `email` VARCHAR(255) DEFAULT NULL,     -- 电子邮件
  `school` VARCHAR(16) DEFAULT NULL,     -- 学校名称
  `company` VARCHAR(26) DEFAULT NULL,    -- 公司名称
  `address` VARCHAR(40) DEFAULT NULL,    -- 收货地址
  PRIMARY KEY(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- 投票信息表
CREATE TABLE `ticket`
(
  `id` INT UNSIGNED AUTO_INCREMENT,       -- 投票ID
  `openid` CHAR(28) NOT NULL,             -- 投票者OpenID
  `whom` INT UNSIGNED NOT NULL,           -- 投向条目的ID
  `nickname` VARCHAR(32) DEFAULT NULL,    -- 投票者昵称
  `sex` TINYINT(1) DEFAULT NULL,          -- 投票者性别
  `country` VARCHAR(12) DEFAULT NULL,     -- 投票者所属国家
  `province` VARCHAR(10) DEFAULT NULL,    -- 投票者所属省份
  `city` VARCHAR(8) DEFAULT NULL,         -- 投票者所属城市
  `headimgurl` VARCHAR(255) DEFAULT NULL, -- 投票者头像地址
  `timestamp` DATETIME NOT NULL,          -- 投票时间
  `ipaddr` CHAR(15) NOT NULL,             -- IP地址
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

-- 创建投票表
DELIMITER $$
CREATE PROCEDURE create_ticket_table(IN table_name VARCHAR(32))
BEGIN
SET @sql_create_table = concat(
"CREATE TABLE IF NOT EXISTS ", table_name,
"(
  `id` INT UNSIGNED AUTO_INCREMENT,
  `openid` CHAR(28) NOT NULL,
  `whom` INT UNSIGNED NOT NULL,
  `nickname` VARCHAR(32) DEFAULT NULL,
  `sex` TINYINT(1) DEFAULT NULL,
  `country` VARCHAR(12) DEFAULT NULL,
  `province` VARCHAR(10) DEFAULT NULL,
  `city` VARCHAR(8) DEFAULT NULL,
  `headimgurl` VARCHAR(255) DEFAULT NULL,
  `timestamp` DATETIME NOT NULL,
  `ipaddr` CHAR(15) NOT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;");
PREPARE sql_create_table FROM @sql_create_table;  
EXECUTE sql_create_table; 
END
$$
DELIMITER ;

-- 删除投票表
DELIMITER $$
CREATE PROCEDURE drop_ticket_table(IN table_name VARCHAR(32))
BEGIN
SET @sql_drop_table = concat("DROP TABLE IF EXISTS ", table_name);
PREPARE sql_drop_table FROM @sql_drop_table;
EXECUTE sql_drop_table; 
END
$$
DELIMITER ;

-- 开启实时日志
DELIMITER $$
CREATE PROCEDURE open_realtime_log()
BEGIN
	SET GLOBAL general_log = 'ON';
	SET GLOBAL general_log_file = '/var/lib/mysql/general.log';
END
$$
DELIMITER ;

-- 关闭实时日志
DELIMITER $$
CREATE PROCEDURE close_realtime_log()
BEGIN
	SET GLOBAL general_log = 'OFF';
END
$$
DELIMITER ;
