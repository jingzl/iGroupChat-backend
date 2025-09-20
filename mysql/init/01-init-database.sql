-- 初始化数据库脚本
-- 这个脚本会在 MySQL 容器首次启动时自动执行

-- 设置客户端字符集
SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci;
SET character_set_client = utf8mb4;
SET character_set_connection = utf8mb4;
SET character_set_results = utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;

-- 创建数据库
CREATE DATABASE IF NOT EXISTS botgroup_chat DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 使用数据库
USE botgroup_chat;

-- 创建用户表
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    phone VARCHAR(11),
    openid VARCHAR(100) DEFAULT NULL UNIQUE,
    nickname VARCHAR(50),
    avatar_url TEXT,
    status INTEGER DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    last_login_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 添加 openid 字段
-- ALTER TABLE users 
-- ADD COLUMN openid VARCHAR(100) DEFAULT NULL COMMENT '微信OpenID' 
-- AFTER phone;

-- 为 openid 字段创建唯一索引（NULL 值不会冲突）
CREATE UNIQUE INDEX idx_users_openid ON users(openid);

-- 删除 phone 字段的唯一索引
-- ALTER TABLE users DROP INDEX phone;

-- 更新字段注释
ALTER TABLE users 
MODIFY COLUMN phone VARCHAR(11) DEFAULT '' COMMENT '手机号（非必填）',
MODIFY COLUMN openid VARCHAR(100) DEFAULT '' COMMENT '微信OpenID（唯一标识）';

-- 插入测试数据
INSERT INTO users (id, phone, openid, nickname, avatar_url, status, created_at, updated_at, last_login_at) VALUES
(1, '13866138666', NULL, '测试用户', NULL, 1, '2025-03-26 08:39:15', '2025-03-26 08:39:15', '2025-03-26 08:39:15');
