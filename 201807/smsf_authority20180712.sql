CREATE DATABASE  IF NOT EXISTS `smsf_authority` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `smsf_authority`;
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
-- Dumping data for table `aspnetusers`
--

LOCK TABLES `aspnetusers` WRITE;
/*!40000 ALTER TABLE `aspnetusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `aspnetusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_authority_application`
--

LOCK TABLES `t_authority_application` WRITE;
/*!40000 ALTER TABLE `t_authority_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_authority_application_tenant`
--

LOCK TABLES `t_authority_application_tenant` WRITE;
/*!40000 ALTER TABLE `t_authority_application_tenant` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_application_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_authority_group`
--

LOCK TABLES `t_authority_group` WRITE;
/*!40000 ALTER TABLE `t_authority_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_authority_group_role`
--

LOCK TABLES `t_authority_group_role` WRITE;
/*!40000 ALTER TABLE `t_authority_group_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_group_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_authority_group_user`
--

LOCK TABLES `t_authority_group_user` WRITE;
/*!40000 ALTER TABLE `t_authority_group_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_authority_permission`
--

LOCK TABLES `t_authority_permission` WRITE;
/*!40000 ALTER TABLE `t_authority_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_authority_permission_resource`
--

LOCK TABLES `t_authority_permission_resource` WRITE;
/*!40000 ALTER TABLE `t_authority_permission_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_permission_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_authority_resource`
--

LOCK TABLES `t_authority_resource` WRITE;
/*!40000 ALTER TABLE `t_authority_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_authority_role`
--

LOCK TABLES `t_authority_role` WRITE;
/*!40000 ALTER TABLE `t_authority_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_authority_role_permission`
--

LOCK TABLES `t_authority_role_permission` WRITE;
/*!40000 ALTER TABLE `t_authority_role_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_authority_tenant`
--

LOCK TABLES `t_authority_tenant` WRITE;
/*!40000 ALTER TABLE `t_authority_tenant` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_authority_tenant_user`
--

LOCK TABLES `t_authority_tenant_user` WRITE;
/*!40000 ALTER TABLE `t_authority_tenant_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_tenant_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_authority_user`
--

LOCK TABLES `t_authority_user` WRITE;
/*!40000 ALTER TABLE `t_authority_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_authority_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `t_authority_user_permission`
--

LOCK TABLES `t_authority_user_permission` WRITE;
/*!40000 ALTER TABLE `t_authority_user_permission` DISABLE KEYS */;
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

-- Dump completed on 2018-07-12 14:02:34
