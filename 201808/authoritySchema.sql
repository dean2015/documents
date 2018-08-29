-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: smsf_authority
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Create schema
--

DROP SCHEMA IF EXISTS `smsf_authority`;
CREATE SCHEMA `smsf_authority` DEFAULT CHARACTER SET utf8 ;
USE `smsf_authority`;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aspnetusers` (
  `Id` varchar(127) NOT NULL,
  `AccessFailedCount` int(11) DEFAULT NULL,
  `ConcurrencyStamp` longtext,
  `Email` varchar(256) DEFAULT NULL,
  `EmailConfirmed` bit(1) DEFAULT NULL,
  `LockoutEnabled` bit(1) DEFAULT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `PasswordHash` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` bit(1) DEFAULT NULL,
  `SecurityStamp` longtext,
  `TwoFactorEnabled` bit(1) DEFAULT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
INSERT INTO `aspnetusers` VALUES ('u1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('u10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('u2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('u3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('u4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('u5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('u6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('u7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('u8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('u9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_application`
--

DROP TABLE IF EXISTS `t_authority_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_application` (
  `id` varchar(128) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `application_secret` varchar(128) DEFAULT '应用安全码，用于安全传输',
  `create_by` varchar(128) DEFAULT NULL,
  `modified_by` varchar(128) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存权限涉及到的应用描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_application`
--

LOCK TABLES `t_authority_application` WRITE;
/*!40000 ALTER TABLE `t_authority_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_application_tenant`
--

DROP TABLE IF EXISTS `t_authority_application_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_application_tenant` (
  `id` varchar(128) NOT NULL,
  `application_id` varchar(128) DEFAULT NULL,
  `tenant_id` varchar(128) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `create_by` varchar(128) DEFAULT NULL,
  `modified_by` varchar(128) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_application_id` (`application_id`),
  KEY `index_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存权限涉及到的应用描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_application_tenant`
--

LOCK TABLES `t_authority_application_tenant` WRITE;
/*!40000 ALTER TABLE `t_authority_application_tenant` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_application_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_group`
--

DROP TABLE IF EXISTS `t_authority_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_group` (
  `id` varchar(128) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `application_id` varchar(128) DEFAULT NULL,
  `tenant_id` varchar(128) DEFAULT NULL,
  `create_by` varchar(128) DEFAULT NULL,
  `modified_by` varchar(128) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存权限涉及到的应用描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_group`
--

LOCK TABLES `t_authority_group` WRITE;
/*!40000 ALTER TABLE `t_authority_group` DISABLE KEYS */;
INSERT INTO `t_authority_group` VALUES ('g1','g1',NULL,'authority','b',NULL,NULL,'2018-07-12 16:38:07',0,'2018-07-24 10:16:12',2),('g2','g2',NULL,'authority','b',NULL,NULL,'2018-07-12 16:38:07',0,'2018-07-24 10:16:12',1),('g3','g3',NULL,'authority','b',NULL,NULL,'2018-07-12 16:38:07',0,'2018-07-24 10:16:12',1),('g4','g4',NULL,'authority','b',NULL,NULL,'2018-07-12 16:38:07',0,'2018-07-24 10:16:12',1),('g6','g6',NULL,'authority','b',NULL,NULL,'2018-07-12 18:17:22',0,'2018-07-24 10:16:12',1),('ggg','string','string','authority','b','string','string','2018-07-12 21:12:37',0,'2018-07-24 10:16:12',5),('stringxxx4444444x','string','string','authority','bb','string','string','2018-07-12 21:02:15',0,'2018-07-24 10:16:12',0);
/*!40000 ALTER TABLE `t_authority_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_group_role`
--

DROP TABLE IF EXISTS `t_authority_group_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_group_role` (
  `id` varchar(128) NOT NULL,
  `group_id` varchar(128) DEFAULT NULL,
  `role_id` varchar(128) DEFAULT NULL,
  `application_id` varchar(128) DEFAULT NULL,
  `tenant_id` varchar(128) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `create_by` varchar(128) DEFAULT NULL,
  `modified_by` varchar(128) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_group_role` (`group_id`,`role_id`),
  KEY `idx_group_id` (`group_id`),
  KEY `idx_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存权限涉及到的应用描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_group_role`
--

LOCK TABLES `t_authority_group_role` WRITE;
/*!40000 ALTER TABLE `t_authority_group_role` DISABLE KEYS */;
INSERT INTO `t_authority_group_role` VALUES ('0dad8c38-9d2a-4fca-af5e-d3f0a98f1aa4','g1','2111111','authority','b',NULL,NULL,NULL,'2018-07-17 10:52:29',0,'2018-07-24 10:15:54',1),('1c0d8558-d393-437d-8a29-bb5405f7a561','g4','r1','authority','b',NULL,NULL,NULL,'2018-07-13 11:42:19',0,'2018-07-24 10:15:54',1),('37f94215-20ab-4dcb-82e6-fffb14f029cf','g6','r1','authority','b',NULL,NULL,NULL,'2018-07-17 10:57:12',0,'2018-07-24 10:15:54',1),('3c7c4e4e-dc5b-4403-ac62-69bc0d93e4dc','g1','r4','authority','b',NULL,NULL,NULL,'2018-07-13 00:04:14',0,'2018-07-24 10:15:54',1),('6d5c0a95-3bff-417d-996e-09c82f7a7b39','g1','r3','authority','b',NULL,NULL,NULL,'2018-07-13 00:04:14',0,'2018-07-24 10:15:54',1),('a3919710-0ba4-420c-85bd-a8539602a629','g3','r4','authority','b',NULL,NULL,NULL,'2018-07-13 09:27:56',0,'2018-07-24 10:15:54',1),('c36495b9-254b-47ff-8518-19990d517f80','g1','r2','authority','b',NULL,NULL,NULL,'2018-07-17 10:53:27',0,'2018-07-24 10:15:54',1),('c4f02e4b-ec56-421d-ab00-8c23d9d509ae','g4','r5','authority','b',NULL,NULL,NULL,'2018-07-13 00:04:14',0,'2018-07-24 10:15:54',1),('dfb5e3d2-d013-4193-8cc6-8a97d8448915','g2','r4','authority','b',NULL,NULL,NULL,'2018-07-13 07:34:33',0,'2018-07-24 10:15:54',1);
/*!40000 ALTER TABLE `t_authority_group_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_group_user`
--

DROP TABLE IF EXISTS `t_authority_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_group_user` (
  `id` varchar(128) NOT NULL,
  `user_id` varchar(128) DEFAULT NULL,
  `group_id` varchar(128) DEFAULT NULL,
  `tenant_id` varchar(128) DEFAULT NULL,
  `application_id` varchar(128) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `create_by` varchar(128) DEFAULT NULL,
  `modified_by` varchar(128) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_group_user` (`user_id`,`group_id`),
  KEY `idx_group_id` (`group_id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存权限涉及到的应用描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_group_user`
--

LOCK TABLES `t_authority_group_user` WRITE;
/*!40000 ALTER TABLE `t_authority_group_user` DISABLE KEYS */;
INSERT INTO `t_authority_group_user` VALUES ('99aed0b8-5a83-401e-b1a4-71a114311d1d','u1','g1','b','authority',NULL,NULL,NULL,'2018-07-13 11:19:46',0,'2018-07-24 10:16:26',1),('d2775437-084e-4dfc-a8b4-717fca868664','u2','g2','b','authority',NULL,NULL,NULL,'2018-07-13 11:23:32',0,'2018-07-24 10:16:26',1),('d311c8f2-13ad-4623-883b-289008f340d0','u3','g1','b','authority',NULL,NULL,NULL,'2018-07-17 10:54:39',0,'2018-07-24 10:16:26',1),('e31060c5-3ec5-4a86-b936-ea5642324c71','u3','g2','b','authority',NULL,NULL,NULL,'2018-07-13 11:23:32',0,'2018-07-24 10:16:26',1);
/*!40000 ALTER TABLE `t_authority_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_permission`
--

DROP TABLE IF EXISTS `t_authority_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_permission` (
  `id` varchar(128) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `application_id` varchar(128) DEFAULT NULL,
  `tenant_id` varchar(128) DEFAULT NULL,
  `operation_id` varchar(128) DEFAULT NULL,
  `create_by` varchar(128) DEFAULT NULL,
  `modified_by` varchar(128) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存权限涉及到的应用描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_permission`
--

LOCK TABLES `t_authority_permission` WRITE;
/*!40000 ALTER TABLE `t_authority_permission` DISABLE KEYS */;
INSERT INTO `t_authority_permission` VALUES ('22b287d3-f7f1-4cd5-a634-379097313f8c','authority.group',NULL,'authority',NULL,NULL,NULL,NULL,'2018-07-24 10:04:27',0,'2018-07-24 10:04:27',1),('35877edf-0252-4135-80ea-11959843a4a4','authority.group.view',NULL,'authority',NULL,NULL,NULL,NULL,'2018-07-24 10:04:27',0,'2018-07-24 10:04:27',1),('927e3909-483a-42f8-988d-650eb8e999be','authority.group.manage',NULL,'authority',NULL,NULL,NULL,NULL,'2018-07-24 10:04:27',0,'2018-07-24 10:04:27',1),('d8ff164c-706a-477c-8fdd-71cfc1a385d0','authority',NULL,'authority',NULL,NULL,NULL,NULL,'2018-07-24 10:04:27',0,'2018-07-24 10:04:27',1);
/*!40000 ALTER TABLE `t_authority_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_permission_i18n`
--

DROP TABLE IF EXISTS `t_authority_permission_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_permission_i18n` (
  `id` varchar(128) NOT NULL,
  `permission_id` varchar(128) DEFAULT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `message` varchar(256) DEFAULT NULL,
  `application_id` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_permission_id` (`permission_id`),
  KEY `idx_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_permission_i18n`
--

LOCK TABLES `t_authority_permission_i18n` WRITE;
/*!40000 ALTER TABLE `t_authority_permission_i18n` DISABLE KEYS */;
INSERT INTO `t_authority_permission_i18n` VALUES ('13ba10c5-ed74-438f-be59-b26d932bd68c','35877edf-0252-4135-80ea-11959843a4a4','en_US','view','authority','2018-07-24 10:04:27','2018-07-24 10:04:27',1),('4b4b5b77-f586-47e7-8772-0332b6f15010','927e3909-483a-42f8-988d-650eb8e999be','zh_CN','管理','authority','2018-07-24 10:04:27','2018-07-24 10:04:27',1),('7de8905e-2042-483e-8c0f-fd4e6a0ed968','d8ff164c-706a-477c-8fdd-71cfc1a385d0','en_US','authority','authority','2018-07-24 10:04:27','2018-07-24 10:04:27',1),('9e8f45aa-e9db-4b2e-8591-9827f5c77c36','927e3909-483a-42f8-988d-650eb8e999be','en_US','manage','authority','2018-07-24 10:04:27','2018-07-24 10:04:27',1),('bb609d08-9d0a-41a6-8bca-cf28013abe95','22b287d3-f7f1-4cd5-a634-379097313f8c','en_US','group','authority','2018-07-24 10:04:27','2018-07-24 10:04:27',1),('e427686d-85c1-4806-9236-955e2d46a8e8','35877edf-0252-4135-80ea-11959843a4a4','zh_CN','查看','authority','2018-07-24 10:04:27','2018-07-24 10:04:27',1),('fa063bc1-e06b-480b-b690-12bc26ac9fa4','d8ff164c-706a-477c-8fdd-71cfc1a385d0','zh_CN','权限管理','authority','2018-07-24 10:04:27','2018-07-24 10:04:27',1),('ff4efa0c-718f-4e37-97e7-3c68120c9e08','22b287d3-f7f1-4cd5-a634-379097313f8c','zh_CN','组','authority','2018-07-24 10:04:27','2018-07-24 10:04:27',1);
/*!40000 ALTER TABLE `t_authority_permission_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_permission_resource`
--

DROP TABLE IF EXISTS `t_authority_permission_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_permission_resource` (
  `id` varchar(128) NOT NULL,
  `resource_id` varchar(200) DEFAULT NULL,
  `permission_id` varchar(128) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `application_id` varchar(128) DEFAULT NULL,
  `tenant_id` varchar(128) DEFAULT NULL,
  `create_by` varchar(128) DEFAULT NULL,
  `modified_by` varchar(128) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_permission_id` (`permission_id`),
  KEY `index_resource_id` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存权限涉及到的应用描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_permission_resource`
--

LOCK TABLES `t_authority_permission_resource` WRITE;
/*!40000 ALTER TABLE `t_authority_permission_resource` DISABLE KEYS */;
INSERT INTO `t_authority_permission_resource` VALUES ('0f1835a3-ef9c-45a4-b5be-30742d174229','ea99acaa-bc95-48a7-8ce1-7f6e73c8d5fb','927e3909-483a-42f8-988d-650eb8e999be',NULL,'authority',NULL,NULL,NULL,'2018-07-24 10:04:27',0,'2018-07-24 10:04:27',1),('31d43b23-867f-4e35-9496-f5f91a04ca47','3c4960f4-3125-44f5-a145-e93314d5d49c','927e3909-483a-42f8-988d-650eb8e999be',NULL,'authority',NULL,NULL,NULL,'2018-07-24 10:04:27',0,'2018-07-24 10:04:27',1),('5afdee50-44c0-476e-af1d-978dc831ea05','60e4d03d-ee18-4a4c-a835-43cdd7ab2281','927e3909-483a-42f8-988d-650eb8e999be',NULL,'authority',NULL,NULL,NULL,'2018-07-24 10:04:27',0,'2018-07-24 10:04:27',1),('8c8488bf-0e85-4b06-88bf-b6cafc84aeb4','3c4960f4-3125-44f5-a145-e93314d5d49c','35877edf-0252-4135-80ea-11959843a4a4',NULL,'authority',NULL,NULL,NULL,'2018-07-24 10:04:27',0,'2018-07-24 10:04:27',1),('d54a3683-b748-4441-9cd5-942287ab7a2e','238689e8-14f8-4030-b8c3-0bfbe3461773','927e3909-483a-42f8-988d-650eb8e999be',NULL,'authority',NULL,NULL,NULL,'2018-07-24 10:04:27',0,'2018-07-24 10:04:27',1);
/*!40000 ALTER TABLE `t_authority_permission_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_resource`
--

DROP TABLE IF EXISTS `t_authority_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_resource` (
  `id` varchar(128) NOT NULL,
  `resource` varchar(200) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `application_id` varchar(128) DEFAULT NULL,
  `tenant_id` varchar(128) DEFAULT NULL,
  `create_by` varchar(128) DEFAULT NULL,
  `modified_by` varchar(128) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_resource`
--

LOCK TABLES `t_authority_resource` WRITE;
/*!40000 ALTER TABLE `t_authority_resource` DISABLE KEYS */;
INSERT INTO `t_authority_resource` VALUES ('238689e8-14f8-4030-b8c3-0bfbe3461773','smsf-authority-service:/authority/mgmt/group/update',NULL,NULL,'authority',NULL,NULL,NULL,'2018-07-24 10:04:27',0,'2018-07-24 10:04:27',1),('3c4960f4-3125-44f5-a145-e93314d5d49c','smsf-authority-service:/authority/mgmt/group/list',NULL,NULL,'authority',NULL,NULL,NULL,'2018-07-24 10:04:27',0,'2018-07-24 10:04:27',1),('3ebced51-5ea8-44d7-9e91-eb9ae3791f5a','smsf-authority-service:/authority/permission/find',NULL,NULL,'authority',NULL,NULL,NULL,'2018-07-24 10:04:27',0,'2018-07-24 10:04:27',1),('60e4d03d-ee18-4a4c-a835-43cdd7ab2281','smsf-authority-service:/authority/mgmt/group/create',NULL,NULL,'authority',NULL,NULL,NULL,'2018-07-24 10:04:27',0,'2018-07-24 10:04:27',1),('ea99acaa-bc95-48a7-8ce1-7f6e73c8d5fb','smsf-authority-service:/authority/mgmt/group/delete',NULL,NULL,'authority',NULL,NULL,NULL,'2018-07-24 10:04:27',0,'2018-07-24 10:04:27',1);
/*!40000 ALTER TABLE `t_authority_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_role`
--

DROP TABLE IF EXISTS `t_authority_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_role` (
  `id` varchar(128) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `application_id` varchar(128) DEFAULT NULL,
  `tenant_id` varchar(128) DEFAULT NULL,
  `create_by` varchar(128) DEFAULT NULL,
  `modified_by` varchar(128) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存权限涉及到的应用描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_role`
--

LOCK TABLES `t_authority_role` WRITE;
/*!40000 ALTER TABLE `t_authority_role` DISABLE KEYS */;
INSERT INTO `t_authority_role` VALUES ('hp1','ttttt','string','authority','b','string','string','2018-07-13 07:27:14',1,'2018-07-30 13:35:15',17),('r1','xxxyyyy',NULL,'authority','b',NULL,NULL,'2018-07-12 16:40:03',0,'2018-07-30 13:35:15',2),('r2','r2',NULL,'authority','b',NULL,NULL,'2018-07-12 16:40:03',0,'2018-07-30 13:35:15',1),('r3','r3',NULL,'authority','b',NULL,NULL,'2018-07-12 16:40:03',0,'2018-07-30 13:35:15',1),('r4','r4',NULL,'authority','b',NULL,NULL,'2018-07-12 23:36:03',0,'2018-07-30 13:35:15',1),('r5','r5','x','authority','b',NULL,NULL,'2018-07-12 23:36:03',0,'2018-07-30 13:35:15',1),('string','string','string','authority','111','111','string','2018-07-13 07:28:06',1,'2018-07-30 13:35:15',3),('xx','xxx','nnn','authority','b',NULL,NULL,'2018-07-12 14:04:44',0,'2018-07-30 13:35:15',2);
/*!40000 ALTER TABLE `t_authority_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_role_permission`
--

DROP TABLE IF EXISTS `t_authority_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_role_permission` (
  `id` varchar(128) NOT NULL,
  `role_id` varchar(128) DEFAULT NULL,
  `permission_id` varchar(128) DEFAULT NULL,
  `application_id` varchar(128) DEFAULT NULL,
  `tenant_id` varchar(128) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `create_by` varchar(128) DEFAULT NULL,
  `modified_by` varchar(128) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存权限涉及到的应用描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_role_permission`
--

LOCK TABLES `t_authority_role_permission` WRITE;
/*!40000 ALTER TABLE `t_authority_role_permission` DISABLE KEYS */;
INSERT INTO `t_authority_role_permission` VALUES ('1','r2','35877edf-0252-4135-80ea-11959843a4a4','authority','b',NULL,NULL,NULL,'2018-07-24 10:11:41',0,'2018-07-24 10:15:24',1);
/*!40000 ALTER TABLE `t_authority_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_tenant`
--

DROP TABLE IF EXISTS `t_authority_tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_tenant` (
  `id` varchar(128) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `tenant_secret` varchar(45) DEFAULT '租户安全码，用于安全传输',
  `is_active` tinyint(4) DEFAULT NULL,
  `create_by` varchar(128) DEFAULT NULL,
  `modified_by` varchar(128) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存权限涉及到的应用描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_tenant`
--

LOCK TABLES `t_authority_tenant` WRITE;
/*!40000 ALTER TABLE `t_authority_tenant` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_tenant_user`
--

DROP TABLE IF EXISTS `t_authority_tenant_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_tenant_user` (
  `id` varchar(128) NOT NULL,
  `user_id` varchar(128) DEFAULT NULL,
  `tenant_id` varchar(128) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `create_by` varchar(128) DEFAULT NULL,
  `modified_by` varchar(128) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_tetant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存权限涉及到的应用描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_tenant_user`
--

LOCK TABLES `t_authority_tenant_user` WRITE;
/*!40000 ALTER TABLE `t_authority_tenant_user` DISABLE KEYS */;
INSERT INTO `t_authority_tenant_user` VALUES ('1','u1','b',NULL,NULL,NULL,'2018-07-13 09:33:27',0,'2018-07-13 09:51:34',1),('2','u2','b',NULL,NULL,NULL,'2018-07-13 09:33:27',0,'2018-07-13 09:51:34',1),('3','u3','b',NULL,NULL,NULL,'2018-07-13 09:33:27',0,'2018-07-13 09:51:34',1),('4','u4','b',NULL,NULL,NULL,'2018-07-13 09:33:27',0,'2018-07-13 09:51:34',1),('5','u5','b',NULL,NULL,NULL,'2018-07-13 09:33:27',0,'2018-07-13 09:51:34',1);
/*!40000 ALTER TABLE `t_authority_tenant_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_user`
--

DROP TABLE IF EXISTS `t_authority_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_user` (
  `id` varchar(128) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `create_by` varchar(128) DEFAULT NULL,
  `modified_by` varchar(128) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存权限涉及到的应用描述';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_user`
--

LOCK TABLES `t_authority_user` WRITE;
/*!40000 ALTER TABLE `t_authority_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_user_permission`
--

DROP TABLE IF EXISTS `t_authority_user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_authority_user_permission` (
  `id` varchar(128) NOT NULL,
  `user_id` varchar(128) DEFAULT NULL,
  `permission_id` varchar(128) DEFAULT NULL,
  `application_id` varchar(128) DEFAULT NULL,
  `tenant_id` varchar(128) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `create_by` varchar(128) DEFAULT NULL,
  `modified_by` varchar(128) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_authority_user_permission`
--

LOCK TABLES `t_authority_user_permission` WRITE;
/*!40000 ALTER TABLE `t_authority_user_permission` DISABLE KEYS */;
INSERT INTO `t_authority_user_permission` VALUES ('1','u1','35877edf-0252-4135-80ea-11959843a4a4','authority','b',NULL,NULL,NULL,'2018-07-23 13:47:34',0,'2018-07-24 10:11:01',1);
/*!40000 ALTER TABLE `t_authority_user_permission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-07 13:20:49
