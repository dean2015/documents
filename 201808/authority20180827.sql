CREATE DATABASE  IF NOT EXISTS `smsf_authority` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `smsf_authority`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: smsf_authority
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aspnetusers`
--

DROP TABLE IF EXISTS `aspnetusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_authority_group` (
  `id` varchar(128) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
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
INSERT INTO `t_authority_group` VALUES ('af69a6ce-05dd-4294-9c3b-99f7ff76161b','MybackGroup2299',NULL,'b',NULL,NULL,'2018-08-27 13:26:49',1,'2018-08-27 15:35:17',2),('g1','g1',NULL,'b',NULL,NULL,'2018-07-12 16:38:07',0,'2018-07-24 10:16:12',2),('g2','g2',NULL,'b',NULL,NULL,'2018-07-12 16:38:07',0,'2018-07-24 10:16:12',1),('g3','g3',NULL,'b',NULL,NULL,'2018-07-12 16:38:07',0,'2018-07-24 10:16:12',1),('g4','g4',NULL,'b',NULL,NULL,'2018-07-12 16:38:07',0,'2018-07-24 10:16:12',1),('g6','g6',NULL,'b',NULL,NULL,'2018-07-12 18:17:22',0,'2018-07-24 10:16:12',1),('ggg','string','string','b','string','string','2018-07-12 21:12:37',0,'2018-07-24 10:16:12',5),('stringxxx4444444x','string','string','bb','string','string','2018-07-12 21:02:15',0,'2018-07-24 10:16:12',0);
/*!40000 ALTER TABLE `t_authority_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_group_role`
--

DROP TABLE IF EXISTS `t_authority_group_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_authority_group_role` (
  `id` varchar(128) NOT NULL,
  `group_id` varchar(128) DEFAULT NULL,
  `role_id` varchar(128) DEFAULT NULL,
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
INSERT INTO `t_authority_group_role` VALUES ('0dad8c38-9d2a-4fca-af5e-d3f0a98f1aa4','g1','2111111','b',NULL,NULL,NULL,'2018-07-17 10:52:29',0,'2018-07-24 10:15:54',1),('1c0d8558-d393-437d-8a29-bb5405f7a561','g4','r1','b',NULL,NULL,NULL,'2018-07-13 11:42:19',0,'2018-07-24 10:15:54',1),('37f94215-20ab-4dcb-82e6-fffb14f029cf','g6','r1','b',NULL,NULL,NULL,'2018-07-17 10:57:12',0,'2018-07-24 10:15:54',1),('3c7c4e4e-dc5b-4403-ac62-69bc0d93e4dc','g1','r4','b',NULL,NULL,NULL,'2018-07-13 00:04:14',0,'2018-07-24 10:15:54',1),('43087c11-2556-4e7f-ae99-4a576ba528f6','g2','r2','b',NULL,NULL,NULL,'2018-08-27 15:38:33',0,'2018-08-27 15:38:33',1),('6d5c0a95-3bff-417d-996e-09c82f7a7b39','g1','r3','b',NULL,NULL,NULL,'2018-07-13 00:04:14',0,'2018-07-24 10:15:54',1),('9dcebc67-807e-4ef6-a4d9-2f72f567ec3f','g4','r2','b',NULL,NULL,NULL,'2018-08-27 15:40:42',0,'2018-08-27 15:40:42',1),('a3919710-0ba4-420c-85bd-a8539602a629','g3','r4','b',NULL,NULL,NULL,'2018-07-13 09:27:56',0,'2018-07-24 10:15:54',1),('c36495b9-254b-47ff-8518-19990d517f80','g1','r2','b',NULL,NULL,NULL,'2018-07-17 10:53:27',0,'2018-07-24 10:15:54',1),('c4f02e4b-ec56-421d-ab00-8c23d9d509ae','g4','r5','b',NULL,NULL,NULL,'2018-07-13 00:04:14',0,'2018-07-24 10:15:54',1),('dfb5e3d2-d013-4193-8cc6-8a97d8448915','g2','r4','b',NULL,NULL,NULL,'2018-07-13 07:34:33',0,'2018-07-24 10:15:54',1);
/*!40000 ALTER TABLE `t_authority_group_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_group_user`
--

DROP TABLE IF EXISTS `t_authority_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_authority_group_user` (
  `id` varchar(128) NOT NULL,
  `user_id` varchar(128) DEFAULT NULL,
  `group_id` varchar(128) DEFAULT NULL,
  `tenant_id` varchar(128) DEFAULT NULL,
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
INSERT INTO `t_authority_group_user` VALUES ('99aed0b8-5a83-401e-b1a4-71a114311d1d','u1','g1','b',NULL,NULL,NULL,'2018-07-13 11:19:46',0,'2018-07-24 10:16:26',1),('d2775437-084e-4dfc-a8b4-717fca868664','u2','g2','b',NULL,NULL,NULL,'2018-07-13 11:23:32',0,'2018-07-24 10:16:26',1),('d311c8f2-13ad-4623-883b-289008f340d0','u3','g1','b',NULL,NULL,NULL,'2018-07-17 10:54:39',0,'2018-07-24 10:16:26',1),('e31060c5-3ec5-4a86-b936-ea5642324c71','u3','g2','b',NULL,NULL,NULL,'2018-07-13 11:23:32',0,'2018-07-24 10:16:26',1);
/*!40000 ALTER TABLE `t_authority_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_permission`
--

DROP TABLE IF EXISTS `t_authority_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_authority_permission` (
  `id` varchar(128) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `application_id` varchar(128) DEFAULT NULL,
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
INSERT INTO `t_authority_permission` VALUES ('39e2b895-477e-4699-9f06-6d107a070a6c','authority.group.user.manage',NULL,'authority',NULL,NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('70538c27-b153-49f0-84cc-8dcfcca73012','authority.permission.view',NULL,'authority',NULL,NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('76c2eac4-5d50-48dc-abde-a666f87383e0','authority.group.user.view',NULL,'authority',NULL,NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('792e293e-b1a6-4b63-9a0f-6cbb7c1bacb7','authority.group.role.manage',NULL,'authority',NULL,NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('a6e8aef2-15bd-48af-bb19-566ea078f194','authority.group.role.view',NULL,'authority',NULL,NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('aa89417d-b2ff-4698-a415-6e38f400926d','authority.role.view',NULL,'authority',NULL,NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('authority.group.view','authority.group.view',NULL,'authority',NULL,NULL,NULL,'2018-08-24 18:27:15',0,'2018-08-24 18:27:15',1),('c0f9a36e-6464-48d4-b1b2-2da503177acb','authority.group.manage',NULL,'authority',NULL,NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('ca631703-697b-43d5-8d74-f1f63be9a5e7','authority.role.manage',NULL,'authority',NULL,NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('d1f8ca7d-a5c1-44ea-9a47-c1dcf1446459','authority.permission.manage',NULL,'authority',NULL,NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1);
/*!40000 ALTER TABLE `t_authority_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_permission_resource`
--

DROP TABLE IF EXISTS `t_authority_permission_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_authority_permission_resource` (
  `id` varchar(128) NOT NULL,
  `resource_id` varchar(200) DEFAULT NULL,
  `permission_id` varchar(128) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `application_id` varchar(128) DEFAULT NULL,
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
INSERT INTO `t_authority_permission_resource` VALUES ('0676775b-ff45-4c4e-a248-77e3e5baee11','328806b1-db36-47f1-8733-289f9aadc87c','76c2eac4-5d50-48dc-abde-a666f87383e0',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('0e5ee865-fee5-48dc-b830-731a8d144716','b3221887-4efa-4941-8fc3-f0924ded38f2','39e2b895-477e-4699-9f06-6d107a070a6c',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('1715aed9-ac52-4419-80cc-3e2e7eb7d8c4','c4723bc0-8436-46d6-aa53-dad44a5bb4bb','792e293e-b1a6-4b63-9a0f-6cbb7c1bacb7',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('18203145-bfbf-4151-b325-66a382262eef','40150799-f24e-46ac-8265-4584a711e3e4','a6e8aef2-15bd-48af-bb19-566ea078f194',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('217cbe7d-7893-41a0-8022-ead620ede90e','37630da2-843a-4188-9281-719b74cae580','d1f8ca7d-a5c1-44ea-9a47-c1dcf1446459',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('4b34e496-c601-4f11-920b-c9b29f9c4919','fc31b182-8ec4-4873-89f8-83338ca7b258','a6e8aef2-15bd-48af-bb19-566ea078f194',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('4f4015f0-ba27-475a-9791-80a998dc42ac','44f55859-86b1-4c64-966f-93e7d3546f7a','39e2b895-477e-4699-9f06-6d107a070a6c',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('5fc197be-015a-4f1e-911e-e93e1c00682d','7b78ce3f-d5fe-417c-b907-426812621fa3','792e293e-b1a6-4b63-9a0f-6cbb7c1bacb7',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('6b11cad9-dfff-444d-a0fe-8abdcd33e5c1','93ddddbd-879e-4a67-9b1d-b8dc06c759e3','ca631703-697b-43d5-8d74-f1f63be9a5e7',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('6bf777f6-827c-4fb5-aebe-9c003ace782d','47688fc0-3a0b-4fee-b9fa-87c6c9d2395a','ca631703-697b-43d5-8d74-f1f63be9a5e7',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('6e72c4d5-c004-4164-9a82-d424e37b020c','8ffa8dbf-ba13-47a0-9342-25d58c14fa08','76c2eac4-5d50-48dc-abde-a666f87383e0',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('74ab1402-5aef-45eb-8685-03c7091c1965','4ab57789-9f80-477a-9360-033af69fdb4e','c0f9a36e-6464-48d4-b1b2-2da503177acb',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('7dc4b2ca-ad30-4d91-b331-535b97adde70','8c364427-4183-4a1c-935b-8a335ce3050c','c0f9a36e-6464-48d4-b1b2-2da503177acb',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('80dabaa8-a474-43ef-8904-58c770880ec9','c6e1fe58-59b2-4c5f-ac52-0c1f0f6b82c2','792e293e-b1a6-4b63-9a0f-6cbb7c1bacb7',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('813659a7-d68d-4d7a-b6fb-34acdb0210dd','23179aa4-7dd6-4d51-93c3-6a266846726e','aa89417d-b2ff-4698-a415-6e38f400926d',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('831e73d2-3ec7-4f97-997e-129730144b84','831bef4e-aeb9-47a2-89c4-ee2df49d650b','c0f9a36e-6464-48d4-b1b2-2da503177acb',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('83c901c7-1cff-45d0-96b4-b9344e314eb1','8b26155d-7f4f-4cf7-bcd4-018643c41a6e','d1f8ca7d-a5c1-44ea-9a47-c1dcf1446459',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('8fc72705-b326-4a54-89df-861a9fe5d82a','548ee221-ec67-4405-856b-f18b80ad31cf','76c2eac4-5d50-48dc-abde-a666f87383e0',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('950ce499-5f5b-4cbb-b302-e3baf6191220','a4c6334d-5405-45f1-91c2-93b1059069b2','a6e8aef2-15bd-48af-bb19-566ea078f194',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('a816dea5-55c0-4a1f-8eef-f26f4efe9c6c','ec84c2cb-54c1-468e-9bb7-b0453b337474','a6e8aef2-15bd-48af-bb19-566ea078f194',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('abd17d41-a736-4852-bc4e-fdd4c3224043','054d0f70-5b21-4e49-b67d-043d8e7df999','d1f8ca7d-a5c1-44ea-9a47-c1dcf1446459',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('b61b46d6-d30d-4933-ab62-ecd14798a640','940ea3dd-b9ed-46c0-92af-95a0e6d87e4f','a6e8aef2-15bd-48af-bb19-566ea078f194',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('b941ca13-4299-4d33-80bd-bf14d4fcc64a','ff81b515-36fc-4335-a845-065ee415ce60','authority.group.view',NULL,'authority',NULL,NULL,'2018-08-24 18:27:15',0,'2018-08-24 18:27:15',1),('bc597976-eabe-442c-9b75-50aedae7280d','ebca8c43-bbad-439a-baea-9f7715c5875c','a6e8aef2-15bd-48af-bb19-566ea078f194',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('bcc6f448-6e8b-4626-b87a-824538f73cc2','9a641b39-ed93-4f97-af8e-267ab2d36ff0','792e293e-b1a6-4b63-9a0f-6cbb7c1bacb7',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('e10f6c98-be6e-45c1-b63b-46e6fe8d4c36','92cb2caf-9d6c-4a08-9eb7-26464471cab5','aa89417d-b2ff-4698-a415-6e38f400926d',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('ed84e660-70a8-4e4e-8602-67031c09b3fd','5e483541-58b5-430d-b323-34d9f0086bc8','ca631703-697b-43d5-8d74-f1f63be9a5e7',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('fb7fc842-0796-40e3-a161-edd365868c06','745c9a0f-07aa-41f7-98db-c2a11cf290b7','authority.group.view',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('fd03eae4-afaf-4e51-b9c4-b83fa1949096','cc2969c6-4aa5-48b3-8b91-02eafe639b9f','70538c27-b153-49f0-84cc-8dcfcca73012',NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1);
/*!40000 ALTER TABLE `t_authority_permission_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_resource`
--

DROP TABLE IF EXISTS `t_authority_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_authority_resource` (
  `id` varchar(128) NOT NULL,
  `resource` varchar(200) DEFAULT NULL,
  `type` varchar(128) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `application_id` varchar(128) DEFAULT NULL,
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
INSERT INTO `t_authority_resource` VALUES ('054d0f70-5b21-4e49-b67d-043d8e7df999','smsf-authority-service:/authority/mgmt/role/permission/update/permission',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('23179aa4-7dd6-4d51-93c3-6a266846726e','smsf-authority-service:/authority/mgmt/role/get',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('328806b1-db36-47f1-8733-289f9aadc87c','smsf-authority-service:/authority/mgmt/group/user/list/ungrouped',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('37630da2-843a-4188-9281-719b74cae580','smsf-authority-service:/authority/mgmt/role/permission/bind/permission',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('40150799-f24e-46ac-8265-4584a711e3e4','smsf-authority-service:/authority/mgmt/group/role/list/grouped',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('44f55859-86b1-4c64-966f-93e7d3546f7a','smsf-authority-service:/authority/mgmt/group/user/unbind/user',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('47688fc0-3a0b-4fee-b9fa-87c6c9d2395a','smsf-authority-service:/authority/mgmt/role/delete',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('4ab57789-9f80-477a-9360-033af69fdb4e','smsf-authority-service:/authority/mgmt/group/update',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('548ee221-ec67-4405-856b-f18b80ad31cf','smsf-authority-service:/authority/mgmt/group/user/list',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('5e483541-58b5-430d-b323-34d9f0086bc8','smsf-authority-service:/authority/mgmt/role/create',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('745c9a0f-07aa-41f7-98db-c2a11cf290b7','smsf-authority-service:/authority/mgmt/group/get',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('7b78ce3f-d5fe-417c-b907-426812621fa3','smsf-authority-service:/authority/mgmt/group/role/bind/role',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('831bef4e-aeb9-47a2-89c4-ee2df49d650b','smsf-authority-service:/authority/mgmt/group/delete',NULL,NULL,'authority',NULL,NULL,'2018-08-24 18:27:15',0,'2018-08-24 18:27:15',1),('8b26155d-7f4f-4cf7-bcd4-018643c41a6e','smsf-authority-service:/authority/mgmt/role/permission/unbind/permission',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('8c364427-4183-4a1c-935b-8a335ce3050c','smsf-authority-service:/authority/mgmt/group/create',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('8ffa8dbf-ba13-47a0-9342-25d58c14fa08','smsf-authority-service:/authority/mgmt/group/user/list/grouped',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('92cb2caf-9d6c-4a08-9eb7-26464471cab5','smsf-authority-service:/authority/mgmt/role/list',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('93ddddbd-879e-4a67-9b1d-b8dc06c759e3','smsf-authority-service:/authority/mgmt/role/update',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('940ea3dd-b9ed-46c0-92af-95a0e6d87e4f','smsf-authority-service:/authority/mgmt/role/group/list/roled',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('9a641b39-ed93-4f97-af8e-267ab2d36ff0','smsf-authority-service:/authority/mgmt/group/role/unbind/role',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('a4c6334d-5405-45f1-91c2-93b1059069b2','smsf-authority-service:/authority/mgmt/role/group/list/unroled',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('b3221887-4efa-4941-8fc3-f0924ded38f2','smsf-authority-service:/authority/mgmt/group/user/bind/user',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('c4723bc0-8436-46d6-aa53-dad44a5bb4bb','smsf-authority-service:/authority/mgmt/role/group/bind/group',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('c6e1fe58-59b2-4c5f-ac52-0c1f0f6b82c2','smsf-authority-service:/authority/mgmt/role/group/unbind/group',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('c93f3c2b-f81b-4f4a-99fc-8b1a266b71c5','smsf-authority-service:/authority/permission/find',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('cc2969c6-4aa5-48b3-8b91-02eafe639b9f','smsf-authority-service:/authority/mgmt/role/permission/list',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('ebca8c43-bbad-439a-baea-9f7715c5875c','smsf-authority-service:/authority/mgmt/role/group/list',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('ec84c2cb-54c1-468e-9bb7-b0453b337474','smsf-authority-service:/authority/mgmt/group/role/list',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('fc31b182-8ec4-4873-89f8-83338ca7b258','smsf-authority-service:/authority/mgmt/group/role/list/ungrouped',NULL,NULL,'authority',NULL,NULL,'2018-08-27 13:01:02',0,'2018-08-27 13:01:02',1),('ff81b515-36fc-4335-a845-065ee415ce60','smsf-authority-service:/authority/mgmt/group/list',NULL,NULL,'authority',NULL,NULL,'2018-08-24 18:27:15',0,'2018-08-24 18:27:15',1);
/*!40000 ALTER TABLE `t_authority_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_role`
--

DROP TABLE IF EXISTS `t_authority_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_authority_role` (
  `id` varchar(128) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
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
INSERT INTO `t_authority_role` VALUES ('hp1','ttttt','string','b','string','string','2018-07-13 07:27:14',1,'2018-07-30 13:35:15',17),('r1','xxxyyyy',NULL,'b',NULL,NULL,'2018-07-12 16:40:03',0,'2018-07-30 13:35:15',2),('r2','r2',NULL,'b',NULL,NULL,'2018-07-12 16:40:03',0,'2018-07-30 13:35:15',1),('r3','r3',NULL,'b',NULL,NULL,'2018-07-12 16:40:03',0,'2018-07-30 13:35:15',1),('r4','r4',NULL,'b',NULL,NULL,'2018-07-12 23:36:03',0,'2018-07-30 13:35:15',1),('r5','r5','x','b',NULL,NULL,'2018-07-12 23:36:03',0,'2018-07-30 13:35:15',1),('string','string','string','111','111','string','2018-07-13 07:28:06',1,'2018-07-30 13:35:15',3),('xx','xxx','nnn','b',NULL,NULL,'2018-07-12 14:04:44',0,'2018-07-30 13:35:15',2);
/*!40000 ALTER TABLE `t_authority_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_authority_role_permission`
--

DROP TABLE IF EXISTS `t_authority_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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

-- Dump completed on 2018-08-27 15:43:43
