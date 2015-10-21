-- MySQL dump 10.15  Distrib 10.0.21-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: grocery_bag_mage
-- ------------------------------------------------------
-- Server version	10.0.21-MariaDB

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
-- Table structure for table `grocery_bag_admin_passwords`
--

DROP TABLE IF EXISTS `grocery_bag_admin_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_admin_passwords` (
  `password_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Password Id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User Id',
  `password_hash` varchar(100) DEFAULT NULL COMMENT 'Password Hash',
  `expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Expires',
  `last_updated` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Last Updated',
  PRIMARY KEY (`password_id`),
  KEY `ADMIN_PASSWORDS_USER_ID` (`user_id`),
  CONSTRAINT `ADMIN_PASSWORDS_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `grocery_bag_admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin Passwords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_admin_passwords`
--

LOCK TABLES `grocery_bag_admin_passwords` WRITE;
/*!40000 ALTER TABLE `grocery_bag_admin_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_admin_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_admin_system_messages`
--

DROP TABLE IF EXISTS `grocery_bag_admin_system_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_admin_system_messages` (
  `identity` varchar(100) NOT NULL COMMENT 'Message id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  PRIMARY KEY (`identity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin System Messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_admin_system_messages`
--

LOCK TABLES `grocery_bag_admin_system_messages` WRITE;
/*!40000 ALTER TABLE `grocery_bag_admin_system_messages` DISABLE KEYS */;
INSERT INTO `grocery_bag_admin_system_messages` VALUES ('da332d712f3215b9b94bfa268c398323',2,'2015-10-15 07:26:11');
/*!40000 ALTER TABLE `grocery_bag_admin_system_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_admin_user`
--

DROP TABLE IF EXISTS `grocery_bag_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_admin_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(255) NOT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'User Created Time',
  `modified` timestamp NULL DEFAULT NULL COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'User Login Number',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Reload ACL',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'User Is Active',
  `extra` text COMMENT 'User Extra Data',
  `rp_token` text COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date',
  `interface_locale` varchar(16) NOT NULL DEFAULT 'en_US' COMMENT 'Backend interface locale',
  `failures_num` smallint(6) DEFAULT '0' COMMENT 'Failure Number',
  `first_failure` timestamp NULL DEFAULT NULL COMMENT 'First Failure',
  `lock_expires` timestamp NULL DEFAULT NULL COMMENT 'Expiration Lock Dates',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Admin User Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_admin_user`
--

LOCK TABLES `grocery_bag_admin_user` WRITE;
/*!40000 ALTER TABLE `grocery_bag_admin_user` DISABLE KEYS */;
INSERT INTO `grocery_bag_admin_user` VALUES (1,'oshanrube','oshanrube','drkmafia@gmail.com','oshanrube','52202f781d1d8458081ed868deb4fa76bd8766beafbdf81a81e288bcae25c686:QidAQrTWh6tBKQlQ71bCDhVldsZyQHJC:1','2015-10-15 07:04:17',NULL,'2015-10-16 10:45:25',26,0,1,'a:1:{s:11:\"configState\";a:21:{s:15:\"general_country\";s:1:\"0\";s:14:\"general_region\";s:1:\"0\";s:14:\"general_locale\";s:1:\"1\";s:25:\"general_store_information\";s:1:\"1\";s:25:\"general_single_store_mode\";s:1:\"1\";s:10:\"web_cookie\";s:1:\"1\";s:7:\"web_url\";s:1:\"0\";s:7:\"web_seo\";s:1:\"0\";s:12:\"web_unsecure\";s:1:\"0\";s:10:\"web_secure\";s:1:\"0\";s:11:\"web_default\";s:1:\"0\";s:11:\"web_session\";s:1:\"1\";s:24:\"web_browser_capabilities\";s:1:\"0\";s:13:\"oauth_cleanup\";s:1:\"0\";s:14:\"oauth_consumer\";s:1:\"1\";s:12:\"admin_emails\";s:1:\"0\";s:13:\"admin_startup\";s:1:\"0\";s:9:\"admin_url\";s:1:\"0\";s:14:\"admin_security\";s:1:\"0\";s:15:\"admin_dashboard\";s:1:\"1\";s:13:\"admin_captcha\";s:1:\"0\";}}',NULL,NULL,'en_US',0,NULL,NULL),(2,'api','user','oshanrube@gmail.com','apiuser','d4a7c194f0c883996138d2ad3da444694c612f096b3d1e200ab39619892ca8a8:Ew4DmWvIwG8ZElPQODqMUvdcJt2lXeeJ:1','2015-10-15 09:03:08','2015-10-15 09:03:08','2015-10-15 12:21:11',5,1,1,'N;',NULL,NULL,'en_US',0,NULL,NULL);
/*!40000 ALTER TABLE `grocery_bag_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_adminnotification_inbox`
--

DROP TABLE IF EXISTS `grocery_bag_adminnotification_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Notification id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification read',
  `is_remove` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification might be removed',
  PRIMARY KEY (`notification_id`),
  KEY `ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  KEY `ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  KEY `ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Adminnotification Inbox';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_adminnotification_inbox`
--

LOCK TABLES `grocery_bag_adminnotification_inbox` WRITE;
/*!40000 ALTER TABLE `grocery_bag_adminnotification_inbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_adminnotification_inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_authorization_role`
--

DROP TABLE IF EXISTS `grocery_bag_authorization_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_authorization_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Role ID',
  `tree_level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Tree Level',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `user_type` varchar(16) DEFAULT NULL COMMENT 'User Type',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name',
  PRIMARY KEY (`role_id`),
  KEY `AUTHORIZATION_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `AUTHORIZATION_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Admin Role Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_authorization_role`
--

LOCK TABLES `grocery_bag_authorization_role` WRITE;
/*!40000 ALTER TABLE `grocery_bag_authorization_role` DISABLE KEYS */;
INSERT INTO `grocery_bag_authorization_role` VALUES (1,0,1,1,'G',0,'2','Administrators'),(2,1,2,0,'U',1,'2','oshanrube'),(3,0,1,0,'G',0,'2','API USER'),(4,3,2,0,'U',2,'2','api');
/*!40000 ALTER TABLE `grocery_bag_authorization_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_authorization_rule`
--

DROP TABLE IF EXISTS `grocery_bag_authorization_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_authorization_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule ID',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `AUTHORIZATION_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `AUTHORIZATION_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`),
  CONSTRAINT `AUTHORIZATION_RULE_ROLE_ID_AUTHORIZATION_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `grocery_bag_authorization_role` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COMMENT='Admin Rule Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_authorization_rule`
--

LOCK TABLES `grocery_bag_authorization_rule` WRITE;
/*!40000 ALTER TABLE `grocery_bag_authorization_rule` DISABLE KEYS */;
INSERT INTO `grocery_bag_authorization_rule` VALUES (1,1,'Magento_Backend::all',NULL,'allow'),(3,3,'Magento_Backend::all',NULL,'deny'),(4,3,'Magento_Backend::admin',NULL,'deny'),(5,3,'Magento_Backend::dashboard',NULL,'deny'),(6,3,'Magento_Sales::sales',NULL,'deny'),(7,3,'Magento_Sales::sales_operation',NULL,'deny'),(8,3,'Magento_Sales::sales_order',NULL,'deny'),(9,3,'Magento_Sales::actions',NULL,'deny'),(10,3,'Magento_Sales::create',NULL,'deny'),(11,3,'Magento_Sales::actions_view',NULL,'deny'),(12,3,'Magento_Sales::email',NULL,'deny'),(13,3,'Magento_Sales::reorder',NULL,'deny'),(14,3,'Magento_Sales::actions_edit',NULL,'deny'),(15,3,'Magento_Sales::cancel',NULL,'deny'),(16,3,'Magento_Sales::review_payment',NULL,'deny'),(17,3,'Magento_Sales::capture',NULL,'deny'),(18,3,'Magento_Sales::invoice',NULL,'deny'),(19,3,'Magento_Sales::creditmemo',NULL,'deny'),(20,3,'Magento_Sales::hold',NULL,'deny'),(21,3,'Magento_Sales::unhold',NULL,'deny'),(22,3,'Magento_Sales::ship',NULL,'deny'),(23,3,'Magento_Sales::comment',NULL,'deny'),(24,3,'Magento_Sales::emails',NULL,'deny'),(25,3,'Magento_Sales::sales_invoice',NULL,'deny'),(26,3,'Magento_Sales::shipment',NULL,'deny'),(27,3,'Magento_Sales::sales_creditmemo',NULL,'deny'),(28,3,'Magento_Paypal::billing_agreement',NULL,'deny'),(29,3,'Magento_Paypal::billing_agreement_actions',NULL,'deny'),(30,3,'Magento_Paypal::billing_agreement_actions_view',NULL,'deny'),(31,3,'Magento_Paypal::actions_manage',NULL,'deny'),(32,3,'Magento_Paypal::use',NULL,'deny'),(33,3,'Magento_Sales::transactions',NULL,'deny'),(34,3,'Magento_Sales::transactions_fetch',NULL,'deny'),(35,3,'Magento_Catalog::catalog',NULL,'allow'),(36,3,'Magento_Catalog::catalog_inventory',NULL,'allow'),(37,3,'Magento_Catalog::products',NULL,'deny'),(38,3,'Magento_Catalog::categories',NULL,'allow'),(39,3,'Magento_Cart::cart',NULL,'deny'),(40,3,'Magento_Cart::manage',NULL,'deny'),(41,3,'Magento_Customer::customer',NULL,'deny'),(42,3,'Magento_Customer::manage',NULL,'deny'),(43,3,'Magento_Customer::online',NULL,'deny'),(44,3,'Magento_Backend::marketing',NULL,'deny'),(45,3,'Magento_CatalogRule::promo',NULL,'deny'),(46,3,'Magento_CatalogRule::promo_catalog',NULL,'deny'),(47,3,'Magento_SalesRule::quote',NULL,'deny'),(48,3,'Magento_Backend::marketing_communications',NULL,'deny'),(49,3,'Magento_Email::template',NULL,'deny'),(50,3,'Magento_Newsletter::template',NULL,'deny'),(51,3,'Magento_Newsletter::queue',NULL,'deny'),(52,3,'Magento_Newsletter::subscriber',NULL,'deny'),(53,3,'Magento_Backend::marketing_seo',NULL,'deny'),(54,3,'Magento_Search::search',NULL,'deny'),(55,3,'Magento_Sitemap::sitemap',NULL,'deny'),(56,3,'Magento_Backend::marketing_user_content',NULL,'deny'),(57,3,'Magento_Review::reviews_all',NULL,'deny'),(58,3,'Magento_Backend::myaccount',NULL,'deny'),(59,3,'Magento_Backend::content',NULL,'deny'),(60,3,'Magento_Backend::content_elements',NULL,'deny'),(61,3,'Magento_Cms::page',NULL,'deny'),(62,3,'Magento_Cms::save',NULL,'deny'),(63,3,'Magento_Cms::page_delete',NULL,'deny'),(64,3,'Magento_Cms::block',NULL,'deny'),(65,3,'Magento_Widget::widget_instance',NULL,'deny'),(66,3,'Magento_Cms::media_gallery',NULL,'deny'),(67,3,'Magento_Backend::design',NULL,'deny'),(68,3,'Magento_Theme::theme',NULL,'deny'),(69,3,'Magento_Backend::schedule',NULL,'deny'),(70,3,'Magento_Reports::report',NULL,'deny'),(71,3,'Magento_Reports::report_marketing',NULL,'deny'),(72,3,'Magento_Reports::shopcart',NULL,'deny'),(73,3,'Magento_Reports::product',NULL,'deny'),(74,3,'Magento_Reports::abandoned',NULL,'deny'),(75,3,'Magento_Reports::report_search',NULL,'deny'),(76,3,'Magento_Newsletter::problem',NULL,'deny'),(77,3,'Magento_Reports::review',NULL,'deny'),(78,3,'Magento_Reports::review_customer',NULL,'deny'),(79,3,'Magento_Reports::review_product',NULL,'deny'),(80,3,'Magento_Reports::salesroot',NULL,'deny'),(81,3,'Magento_Reports::salesroot_sales',NULL,'deny'),(82,3,'Magento_Reports::tax',NULL,'deny'),(83,3,'Magento_Reports::invoiced',NULL,'deny'),(84,3,'Magento_Reports::shipping',NULL,'deny'),(85,3,'Magento_Reports::coupons',NULL,'deny'),(86,3,'Magento_Reports::refunded',NULL,'deny'),(87,3,'Magento_Paypal::paypal_settlement_reports',NULL,'deny'),(88,3,'Magento_Paypal::paypal_settlement_reports_view',NULL,'deny'),(89,3,'Magento_Paypal::fetch',NULL,'deny'),(90,3,'Magento_Reports::customers',NULL,'deny'),(91,3,'Magento_Reports::totals',NULL,'deny'),(92,3,'Magento_Reports::customers_orders',NULL,'deny'),(93,3,'Magento_Reports::accounts',NULL,'deny'),(94,3,'Magento_Reports::report_products',NULL,'deny'),(95,3,'Magento_Reports::viewed',NULL,'deny'),(96,3,'Magento_Reports::bestsellers',NULL,'deny'),(97,3,'Magento_Reports::lowstock',NULL,'deny'),(98,3,'Magento_Reports::sold',NULL,'deny'),(99,3,'Magento_Reports::downloads',NULL,'deny'),(100,3,'Magento_Reports::statistics',NULL,'deny'),(101,3,'Magento_Reports::statistics_refresh',NULL,'deny'),(102,3,'Magento_Backend::stores',NULL,'allow'),(103,3,'Magento_Backend::stores_settings',NULL,'allow'),(104,3,'Magento_Backend::store',NULL,'allow'),(105,3,'Magento_Config::config',NULL,'allow'),(106,3,'Magento_Contact::contact',NULL,'allow'),(107,3,'Magento_Newsletter::newsletter',NULL,'allow'),(108,3,'Magento_Downloadable::downloadable',NULL,'allow'),(109,3,'Magento_Payment::payment',NULL,'allow'),(110,3,'Magento_Payment::payment_services',NULL,'allow'),(111,3,'Magento_GoogleAnalytics::google',NULL,'allow'),(112,3,'Magento_CatalogInventory::cataloginventory',NULL,'allow'),(113,3,'Magento_Cms::config_cms',NULL,'allow'),(114,3,'Magento_Catalog::config_catalog',NULL,'allow'),(115,3,'Magento_Shipping::shipping_policy',NULL,'allow'),(116,3,'Magento_Shipping::carriers',NULL,'allow'),(117,3,'Magento_Shipping::config_shipping',NULL,'allow'),(118,3,'Magento_Multishipping::config_multishipping',NULL,'allow'),(119,3,'Magento_Config::config_general',NULL,'allow'),(120,3,'Magento_Config::web',NULL,'allow'),(121,3,'Magento_Config::config_design',NULL,'allow'),(122,3,'Magento_Paypal::paypal',NULL,'allow'),(123,3,'Magento_Customer::config_customer',NULL,'allow'),(124,3,'Magento_Tax::config_tax',NULL,'allow'),(125,3,'Magento_Persistent::persistent',NULL,'allow'),(126,3,'Magento_Sales::config_sales',NULL,'allow'),(127,3,'Magento_Sales::sales_email',NULL,'allow'),(128,3,'Magento_Sales::sales_pdf',NULL,'allow'),(129,3,'Magento_Sitemap::config_sitemap',NULL,'allow'),(130,3,'Magento_Reports::reports',NULL,'allow'),(131,3,'Magento_Wishlist::config_wishlist',NULL,'allow'),(132,3,'Magento_Config::config_system',NULL,'allow'),(133,3,'Magento_SalesRule::config_promo',NULL,'allow'),(134,3,'Magento_Config::advanced',NULL,'allow'),(135,3,'Magento_Config::trans_email',NULL,'allow'),(136,3,'Magento_Config::config_admin',NULL,'allow'),(137,3,'Magento_Config::dev',NULL,'allow'),(138,3,'Magento_Config::currency',NULL,'allow'),(139,3,'Magento_Rss::rss',NULL,'allow'),(140,3,'Magento_Config::sendfriend',NULL,'allow'),(141,3,'Magento_NewRelicReporting::config_newrelicreporting',NULL,'allow'),(142,3,'Magento_CheckoutAgreements::checkoutagreement',NULL,'allow'),(143,3,'Magento_Sales::order_statuses',NULL,'allow'),(144,3,'Magento_Tax::manage_tax',NULL,'allow'),(145,3,'Magento_CurrencySymbol::system_currency',NULL,'allow'),(146,3,'Magento_CurrencySymbol::currency_rates',NULL,'allow'),(147,3,'Magento_CurrencySymbol::symbols',NULL,'allow'),(148,3,'Magento_Backend::stores_attributes',NULL,'allow'),(149,3,'Magento_Catalog::attributes_attributes',NULL,'allow'),(150,3,'Magento_Catalog::update_attributes',NULL,'allow'),(151,3,'Magento_Catalog::sets',NULL,'allow'),(152,3,'Magento_Review::ratings',NULL,'allow'),(153,3,'Magento_Backend::stores_other_settings',NULL,'allow'),(154,3,'Magento_Customer::group',NULL,'allow'),(155,3,'Magento_Backend::system',NULL,'deny'),(156,3,'Magento_Backend::convert',NULL,'deny'),(157,3,'Magento_ImportExport::import',NULL,'deny'),(158,3,'Magento_ImportExport::export',NULL,'deny'),(159,3,'Magento_TaxImportExport::import_export',NULL,'deny'),(160,3,'Magento_ImportExport::history',NULL,'deny'),(161,3,'Magento_Backend::extensions',NULL,'deny'),(162,3,'Magento_Backend::local',NULL,'deny'),(163,3,'Magento_Backend::custom',NULL,'deny'),(164,3,'Magento_Backend::tools',NULL,'deny'),(165,3,'Magento_Backend::cache',NULL,'deny'),(166,3,'Magento_Backend::setup_wizard',NULL,'deny'),(167,3,'Magento_Indexer::index',NULL,'deny'),(168,3,'Magento_Backup::backup',NULL,'deny'),(169,3,'Magento_Backup::rollback',NULL,'deny'),(170,3,'Magento_Indexer::changeMode',NULL,'deny'),(171,3,'Magento_User::acl',NULL,'deny'),(172,3,'Magento_User::acl_users',NULL,'deny'),(173,3,'Magento_User::locks',NULL,'deny'),(174,3,'Magento_User::acl_roles',NULL,'deny'),(175,3,'Magento_Backend::system_other_settings',NULL,'deny'),(176,3,'Magento_AdminNotification::adminnotification',NULL,'deny'),(177,3,'Magento_AdminNotification::show_toolbar',NULL,'deny'),(178,3,'Magento_AdminNotification::show_list',NULL,'deny'),(179,3,'Magento_AdminNotification::mark_as_read',NULL,'deny'),(180,3,'Magento_AdminNotification::adminnotification_remove',NULL,'deny'),(181,3,'Magento_Variable::variable',NULL,'deny'),(182,3,'Magento_EncryptionKey::crypt_key',NULL,'deny'),(183,3,'Magento_Backend::global_search',NULL,'deny');
/*!40000 ALTER TABLE `grocery_bag_authorization_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_cache`
--

DROP TABLE IF EXISTS `grocery_bag_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob COMMENT 'Cache Data',
  `create_time` int(11) DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int(11) DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int(11) DEFAULT NULL COMMENT 'Cache Expiration Time',
  PRIMARY KEY (`id`),
  KEY `CACHE_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_cache`
--

LOCK TABLES `grocery_bag_cache` WRITE;
/*!40000 ALTER TABLE `grocery_bag_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_cache_tag`
--

DROP TABLE IF EXISTS `grocery_bag_cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id',
  PRIMARY KEY (`tag`,`cache_id`),
  KEY `CACHE_TAG_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_cache_tag`
--

LOCK TABLES `grocery_bag_cache_tag` WRITE;
/*!40000 ALTER TABLE `grocery_bag_cache_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_cache_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_captcha_log`
--

DROP TABLE IF EXISTS `grocery_bag_captcha_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(32) NOT NULL COMMENT 'Value',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count Login Attempts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_captcha_log`
--

LOCK TABLES `grocery_bag_captcha_log` WRITE;
/*!40000 ALTER TABLE `grocery_bag_captcha_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_captcha_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_category_entity`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_category_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attriute Set ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Category ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int(11) NOT NULL COMMENT 'Position',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'Tree Level',
  `children_count` int(11) NOT NULL COMMENT 'Child Count',
  PRIMARY KEY (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_LEVEL` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=1341 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_category_entity`
--

LOCK TABLES `grocery_bag_catalog_category_entity` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_category_entity` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_category_entity` VALUES (1,0,0,'2015-10-15 07:03:54','2015-10-15 07:03:54','1',0,0,458),(2,3,1,'2015-10-15 07:03:55','2015-10-15 07:03:55','1/2',1,1,457),(884,0,0,'2015-10-15 14:58:27','2015-10-15 14:58:27','1/2/884',0,0,79),(885,0,884,'2015-10-15 14:58:33','2015-10-15 14:58:33','1/2/884/885',0,0,5),(886,0,885,'2015-10-15 14:58:34','2015-10-16 09:59:55','1/2/884/885/886',0,0,0),(887,3,885,'2015-10-15 14:58:37','2015-10-16 11:13:03','1/2/884/885/887',0,0,0),(888,0,885,'2015-10-15 14:58:37','2015-10-15 14:58:37','1/2/884/885/888',0,0,0),(889,0,885,'2015-10-15 14:58:38','2015-10-15 14:58:38','1/2/884/885/889',0,0,0),(890,0,885,'2015-10-15 14:58:39','2015-10-15 14:58:39','1/2/884/885/890',0,0,0),(891,0,884,'2015-10-15 14:58:55','2015-10-15 14:58:55','1/2/884/891',0,0,5),(892,0,891,'2015-10-15 14:58:56','2015-10-15 14:58:56','1/2/884/891/892',0,0,0),(893,0,891,'2015-10-15 14:58:56','2015-10-15 14:58:56','1/2/884/891/893',0,0,0),(894,0,891,'2015-10-15 14:58:57','2015-10-15 14:58:57','1/2/884/891/894',0,0,0),(895,0,891,'2015-10-15 14:58:57','2015-10-15 14:58:57','1/2/884/891/895',0,0,0),(896,0,891,'2015-10-15 14:58:58','2015-10-15 14:58:58','1/2/884/891/896',0,0,0),(897,0,884,'2015-10-15 14:58:58','2015-10-15 14:58:58','1/2/884/897',0,0,1),(898,0,897,'2015-10-15 14:58:59','2015-10-15 14:58:59','1/2/884/897/898',0,0,0),(899,0,884,'2015-10-15 14:58:59','2015-10-15 14:58:59','1/2/884/899',0,0,3),(900,0,899,'2015-10-15 14:59:00','2015-10-15 14:59:00','1/2/884/899/900',0,0,0),(901,0,899,'2015-10-15 14:59:01','2015-10-15 14:59:01','1/2/884/899/901',0,0,0),(902,0,899,'2015-10-15 14:59:01','2015-10-15 14:59:01','1/2/884/899/902',0,0,0),(903,0,884,'2015-10-15 14:59:01','2015-10-15 14:59:01','1/2/884/903',0,0,6),(904,0,903,'2015-10-15 14:59:02','2015-10-15 14:59:02','1/2/884/903/904',0,0,0),(905,0,903,'2015-10-15 14:59:03','2015-10-15 14:59:03','1/2/884/903/905',0,0,0),(906,0,903,'2015-10-15 14:59:03','2015-10-15 14:59:03','1/2/884/903/906',0,0,0),(907,0,903,'2015-10-15 14:59:04','2015-10-15 14:59:04','1/2/884/903/907',0,0,0),(908,0,903,'2015-10-15 14:59:04','2015-10-15 14:59:04','1/2/884/903/908',0,0,0),(909,0,903,'2015-10-15 14:59:05','2015-10-15 14:59:05','1/2/884/903/909',0,0,0),(910,0,884,'2015-10-15 14:59:05','2015-10-15 14:59:05','1/2/884/910',0,0,3),(911,0,910,'2015-10-15 14:59:06','2015-10-15 14:59:06','1/2/884/910/911',0,0,0),(912,0,910,'2015-10-15 14:59:07','2015-10-15 14:59:07','1/2/884/910/912',0,0,0),(913,0,910,'2015-10-15 14:59:07','2015-10-15 14:59:07','1/2/884/910/913',0,0,0),(914,0,884,'2015-10-15 14:59:08','2015-10-15 14:59:08','1/2/884/914',0,0,8),(915,0,914,'2015-10-15 14:59:08','2015-10-15 14:59:08','1/2/884/914/915',0,0,0),(916,0,914,'2015-10-15 14:59:09','2015-10-15 14:59:09','1/2/884/914/916',0,0,0),(917,0,914,'2015-10-15 14:59:09','2015-10-15 14:59:09','1/2/884/914/917',0,0,0),(918,0,914,'2015-10-15 14:59:10','2015-10-15 14:59:10','1/2/884/914/918',0,0,0),(919,0,914,'2015-10-15 14:59:10','2015-10-15 14:59:10','1/2/884/914/919',0,0,0),(920,0,914,'2015-10-15 14:59:11','2015-10-15 14:59:11','1/2/884/914/920',0,0,0),(921,0,914,'2015-10-15 14:59:11','2015-10-15 14:59:11','1/2/884/914/921',0,0,0),(922,0,914,'2015-10-15 14:59:12','2015-10-15 14:59:12','1/2/884/914/922',0,0,0),(923,0,884,'2015-10-15 14:59:12','2015-10-15 14:59:12','1/2/884/923',0,0,4),(924,0,923,'2015-10-15 14:59:13','2015-10-15 14:59:13','1/2/884/923/924',0,0,0),(925,0,923,'2015-10-15 14:59:13','2015-10-15 14:59:13','1/2/884/923/925',0,0,0),(926,0,923,'2015-10-15 14:59:14','2015-10-15 14:59:14','1/2/884/923/926',0,0,0),(927,0,923,'2015-10-15 14:59:14','2015-10-15 14:59:14','1/2/884/923/927',0,0,0),(928,0,884,'2015-10-15 14:59:15','2015-10-15 14:59:15','1/2/884/928',0,0,3),(929,0,928,'2015-10-15 14:59:16','2015-10-15 14:59:16','1/2/884/928/929',0,0,0),(930,0,928,'2015-10-15 14:59:16','2015-10-15 14:59:16','1/2/884/928/930',0,0,0),(931,0,928,'2015-10-15 14:59:17','2015-10-15 14:59:17','1/2/884/928/931',0,0,0),(932,0,884,'2015-10-15 14:59:17','2015-10-15 14:59:17','1/2/884/932',0,0,4),(933,0,932,'2015-10-15 14:59:18','2015-10-15 14:59:18','1/2/884/932/933',0,0,0),(934,0,932,'2015-10-15 14:59:18','2015-10-15 14:59:18','1/2/884/932/934',0,0,0),(935,0,932,'2015-10-15 14:59:19','2015-10-15 14:59:19','1/2/884/932/935',0,0,0),(936,0,932,'2015-10-15 14:59:19','2015-10-15 14:59:19','1/2/884/932/936',0,0,0),(937,0,884,'2015-10-15 14:59:20','2015-10-15 14:59:20','1/2/884/937',0,0,3),(938,0,937,'2015-10-15 14:59:21','2015-10-15 14:59:21','1/2/884/937/938',0,0,0),(939,0,937,'2015-10-15 14:59:21','2015-10-15 14:59:21','1/2/884/937/939',0,0,0),(940,0,937,'2015-10-15 14:59:21','2015-10-15 14:59:21','1/2/884/937/940',0,0,0),(941,0,884,'2015-10-15 14:59:22','2015-10-15 14:59:22','1/2/884/941',0,0,2),(942,0,941,'2015-10-15 14:59:23','2015-10-15 14:59:23','1/2/884/941/942',0,0,0),(943,0,941,'2015-10-15 14:59:23','2015-10-15 14:59:23','1/2/884/941/943',0,0,0),(944,0,884,'2015-10-15 14:59:24','2015-10-15 14:59:24','1/2/884/944',0,0,4),(945,0,944,'2015-10-15 14:59:24','2015-10-15 14:59:24','1/2/884/944/945',0,0,0),(946,0,944,'2015-10-15 14:59:25','2015-10-15 14:59:25','1/2/884/944/946',0,0,0),(947,0,944,'2015-10-15 14:59:25','2015-10-15 14:59:25','1/2/884/944/947',0,0,0),(948,0,944,'2015-10-15 14:59:26','2015-10-15 14:59:26','1/2/884/944/948',0,0,0),(949,0,884,'2015-10-15 14:59:26','2015-10-15 14:59:26','1/2/884/949',0,0,4),(950,0,949,'2015-10-15 14:59:27','2015-10-15 14:59:27','1/2/884/949/950',0,0,0),(951,0,949,'2015-10-15 14:59:28','2015-10-15 14:59:28','1/2/884/949/951',0,0,0),(952,0,949,'2015-10-15 14:59:28','2015-10-15 14:59:28','1/2/884/949/952',0,0,0),(953,0,949,'2015-10-15 14:59:28','2015-10-15 14:59:28','1/2/884/949/953',0,0,0),(954,0,884,'2015-10-15 14:59:29','2015-10-15 14:59:29','1/2/884/954',0,0,5),(955,0,954,'2015-10-15 14:59:30','2015-10-15 14:59:30','1/2/884/954/955',0,0,0),(956,0,954,'2015-10-15 14:59:30','2015-10-15 14:59:30','1/2/884/954/956',0,0,0),(957,0,954,'2015-10-15 14:59:31','2015-10-15 14:59:31','1/2/884/954/957',0,0,0),(958,0,954,'2015-10-15 14:59:31','2015-10-15 14:59:31','1/2/884/954/958',0,0,0),(959,0,954,'2015-10-15 14:59:32','2015-10-15 14:59:32','1/2/884/954/959',0,0,0),(960,0,884,'2015-10-15 14:59:32','2015-10-15 14:59:32','1/2/884/960',0,0,3),(961,0,960,'2015-10-15 14:59:33','2015-10-15 14:59:33','1/2/884/960/961',0,0,0),(962,0,960,'2015-10-15 14:59:33','2015-10-15 14:59:33','1/2/884/960/962',0,0,0),(963,0,960,'2015-10-15 14:59:34','2015-10-15 14:59:34','1/2/884/960/963',0,0,0),(964,0,0,'2015-10-15 14:59:55','2015-10-15 14:59:55','1/2/964',0,0,9),(965,0,964,'2015-10-15 14:59:55','2015-10-15 14:59:55','1/2/964/965',0,0,2),(966,0,965,'2015-10-15 14:59:56','2015-10-15 14:59:56','1/2/964/965/966',0,0,0),(967,0,965,'2015-10-15 14:59:57','2015-10-15 14:59:57','1/2/964/965/967',0,0,0),(968,0,964,'2015-10-15 14:59:57','2015-10-15 14:59:57','1/2/964/968',0,0,3),(969,0,968,'2015-10-15 14:59:58','2015-10-15 14:59:58','1/2/964/968/969',0,0,0),(970,0,968,'2015-10-15 14:59:58','2015-10-15 14:59:58','1/2/964/968/970',0,0,0),(971,0,968,'2015-10-15 14:59:59','2015-10-15 14:59:59','1/2/964/968/971',0,0,0),(972,0,964,'2015-10-15 14:59:59','2015-10-15 14:59:59','1/2/964/972',0,0,1),(973,0,972,'2015-10-15 15:00:00','2015-10-15 15:00:00','1/2/964/972/973',0,0,0),(974,0,0,'2015-10-15 15:00:01','2015-10-15 15:00:01','1/2/974',0,0,170),(975,0,974,'2015-10-15 15:00:01','2015-10-15 15:00:01','1/2/974/975',0,0,6),(976,0,975,'2015-10-15 15:00:02','2015-10-15 15:00:02','1/2/974/975/976',0,0,0),(977,0,975,'2015-10-15 15:00:03','2015-10-15 15:00:03','1/2/974/975/977',0,0,0),(978,0,975,'2015-10-15 15:00:03','2015-10-15 15:00:03','1/2/974/975/978',0,0,0),(979,0,975,'2015-10-15 15:00:04','2015-10-15 15:00:04','1/2/974/975/979',0,0,0),(980,0,975,'2015-10-15 15:00:04','2015-10-15 15:00:04','1/2/974/975/980',0,0,0),(981,0,975,'2015-10-15 15:00:05','2015-10-15 15:00:05','1/2/974/975/981',0,0,0),(982,0,974,'2015-10-15 15:00:05','2015-10-15 15:00:05','1/2/974/982',0,0,7),(983,0,982,'2015-10-15 15:00:06','2015-10-15 15:00:06','1/2/974/982/983',0,0,0),(984,0,982,'2015-10-15 15:00:06','2015-10-15 15:00:06','1/2/974/982/984',0,0,0),(985,0,982,'2015-10-15 15:00:07','2015-10-15 15:00:07','1/2/974/982/985',0,0,0),(986,0,982,'2015-10-15 15:00:07','2015-10-15 15:00:07','1/2/974/982/986',0,0,0),(987,0,982,'2015-10-15 15:00:08','2015-10-15 15:00:08','1/2/974/982/987',0,0,0),(988,0,982,'2015-10-15 15:00:08','2015-10-15 15:00:08','1/2/974/982/988',0,0,0),(989,0,982,'2015-10-15 15:00:09','2015-10-15 15:00:09','1/2/974/982/989',0,0,0),(990,0,974,'2015-10-15 15:00:09','2015-10-15 15:00:09','1/2/974/990',0,0,7),(991,0,990,'2015-10-15 15:00:10','2015-10-15 15:00:10','1/2/974/990/991',0,0,0),(992,0,990,'2015-10-15 15:00:11','2015-10-15 15:00:11','1/2/974/990/992',0,0,0),(993,0,990,'2015-10-15 15:00:11','2015-10-15 15:00:11','1/2/974/990/993',0,0,0),(994,0,990,'2015-10-15 15:00:12','2015-10-15 15:00:12','1/2/974/990/994',0,0,0),(995,0,990,'2015-10-15 15:00:12','2015-10-15 15:00:12','1/2/974/990/995',0,0,0),(996,0,990,'2015-10-15 15:00:13','2015-10-15 15:00:13','1/2/974/990/996',0,0,0),(997,0,990,'2015-10-15 15:00:13','2015-10-15 15:00:13','1/2/974/990/997',0,0,0),(998,0,974,'2015-10-15 15:00:13','2015-10-15 15:00:13','1/2/974/998',0,0,11),(999,0,998,'2015-10-15 15:00:14','2015-10-15 15:00:14','1/2/974/998/999',0,0,0),(1000,0,998,'2015-10-15 15:00:15','2015-10-15 15:00:15','1/2/974/998/1000',0,0,0),(1001,0,998,'2015-10-15 15:00:15','2015-10-15 15:00:15','1/2/974/998/1001',0,0,0),(1002,0,998,'2015-10-15 15:00:16','2015-10-15 15:00:16','1/2/974/998/1002',0,0,0),(1003,0,998,'2015-10-15 15:00:16','2015-10-15 15:00:16','1/2/974/998/1003',0,0,0),(1004,0,998,'2015-10-15 15:00:17','2015-10-15 15:00:17','1/2/974/998/1004',0,0,0),(1005,0,998,'2015-10-15 15:00:17','2015-10-15 15:00:17','1/2/974/998/1005',0,0,0),(1006,0,998,'2015-10-15 15:00:18','2015-10-15 15:00:18','1/2/974/998/1006',0,0,0),(1007,0,998,'2015-10-15 15:00:18','2015-10-15 15:00:18','1/2/974/998/1007',0,0,0),(1008,0,998,'2015-10-15 15:00:19','2015-10-15 15:00:19','1/2/974/998/1008',0,0,0),(1009,0,998,'2015-10-15 15:00:19','2015-10-15 15:00:19','1/2/974/998/1009',0,0,0),(1010,0,974,'2015-10-15 15:00:20','2015-10-15 15:00:20','1/2/974/1010',0,0,1),(1011,0,1010,'2015-10-15 15:00:20','2015-10-15 15:00:20','1/2/974/1010/1011',0,0,0),(1012,0,974,'2015-10-15 15:00:21','2015-10-15 15:00:21','1/2/974/1012',0,0,19),(1013,0,1012,'2015-10-15 15:00:22','2015-10-15 15:00:22','1/2/974/1012/1013',0,0,0),(1014,0,1012,'2015-10-15 15:00:22','2015-10-15 15:00:22','1/2/974/1012/1014',0,0,0),(1015,0,1012,'2015-10-15 15:00:23','2015-10-15 15:00:23','1/2/974/1012/1015',0,0,0),(1016,0,1012,'2015-10-15 15:00:23','2015-10-15 15:00:23','1/2/974/1012/1016',0,0,0),(1017,0,1012,'2015-10-15 15:00:24','2015-10-15 15:00:24','1/2/974/1012/1017',0,0,0),(1018,0,1012,'2015-10-15 15:00:24','2015-10-15 15:00:24','1/2/974/1012/1018',0,0,0),(1019,0,1012,'2015-10-15 15:00:25','2015-10-15 15:00:25','1/2/974/1012/1019',0,0,0),(1020,0,1012,'2015-10-15 15:00:25','2015-10-15 15:00:25','1/2/974/1012/1020',0,0,0),(1021,0,1012,'2015-10-15 15:00:26','2015-10-15 15:00:26','1/2/974/1012/1021',0,0,0),(1022,0,1012,'2015-10-15 15:00:26','2015-10-15 15:00:26','1/2/974/1012/1022',0,0,0),(1023,0,1012,'2015-10-15 15:00:27','2015-10-15 15:00:27','1/2/974/1012/1023',0,0,0),(1024,0,1012,'2015-10-15 15:00:27','2015-10-15 15:00:27','1/2/974/1012/1024',0,0,0),(1025,0,1012,'2015-10-15 15:00:27','2015-10-15 15:00:27','1/2/974/1012/1025',0,0,0),(1026,0,1012,'2015-10-15 15:00:28','2015-10-15 15:00:28','1/2/974/1012/1026',0,0,0),(1027,0,1012,'2015-10-15 15:00:28','2015-10-15 15:00:28','1/2/974/1012/1027',0,0,0),(1028,0,1012,'2015-10-15 15:00:29','2015-10-15 15:00:29','1/2/974/1012/1028',0,0,0),(1029,0,1012,'2015-10-15 15:00:29','2015-10-15 15:00:29','1/2/974/1012/1029',0,0,0),(1030,0,1012,'2015-10-15 15:00:30','2015-10-15 15:00:30','1/2/974/1012/1030',0,0,0),(1031,0,1012,'2015-10-15 15:00:30','2015-10-15 15:00:30','1/2/974/1012/1031',0,0,0),(1032,0,974,'2015-10-15 15:00:31','2015-10-15 15:00:31','1/2/974/1032',0,0,3),(1033,0,1032,'2015-10-15 15:00:32','2015-10-15 15:00:32','1/2/974/1032/1033',0,0,0),(1034,0,1032,'2015-10-15 15:00:32','2015-10-15 15:00:32','1/2/974/1032/1034',0,0,0),(1035,0,1032,'2015-10-15 15:00:33','2015-10-15 15:00:33','1/2/974/1032/1035',0,0,0),(1036,0,974,'2015-10-15 15:00:33','2015-10-15 15:00:33','1/2/974/1036',0,0,2),(1037,0,1036,'2015-10-15 15:00:34','2015-10-15 15:00:34','1/2/974/1036/1037',0,0,0),(1038,0,1036,'2015-10-15 15:00:34','2015-10-15 15:00:34','1/2/974/1036/1038',0,0,0),(1039,0,974,'2015-10-15 15:00:35','2015-10-15 15:00:35','1/2/974/1039',0,0,7),(1040,0,1039,'2015-10-15 15:00:36','2015-10-15 15:00:36','1/2/974/1039/1040',0,0,0),(1041,0,1039,'2015-10-15 15:00:36','2015-10-15 15:00:36','1/2/974/1039/1041',0,0,0),(1042,0,1039,'2015-10-15 15:00:36','2015-10-15 15:00:36','1/2/974/1039/1042',0,0,0),(1043,0,1039,'2015-10-15 15:00:37','2015-10-15 15:00:37','1/2/974/1039/1043',0,0,0),(1044,0,1039,'2015-10-15 15:00:37','2015-10-15 15:00:37','1/2/974/1039/1044',0,0,0),(1045,0,1039,'2015-10-15 15:00:38','2015-10-15 15:00:38','1/2/974/1039/1045',0,0,0),(1046,0,1039,'2015-10-15 15:00:38','2015-10-15 15:00:38','1/2/974/1039/1046',0,0,0),(1047,0,974,'2015-10-15 15:00:39','2015-10-15 15:00:39','1/2/974/1047',0,0,5),(1048,0,1047,'2015-10-15 15:00:40','2015-10-15 15:00:40','1/2/974/1047/1048',0,0,0),(1049,0,1047,'2015-10-15 15:00:40','2015-10-15 15:00:40','1/2/974/1047/1049',0,0,0),(1050,0,1047,'2015-10-15 15:00:41','2015-10-15 15:00:41','1/2/974/1047/1050',0,0,0),(1051,0,1047,'2015-10-15 15:00:41','2015-10-15 15:00:41','1/2/974/1047/1051',0,0,0),(1052,0,1047,'2015-10-15 15:00:41','2015-10-15 15:00:41','1/2/974/1047/1052',0,0,0),(1053,0,974,'2015-10-15 15:00:42','2015-10-15 15:00:42','1/2/974/1053',0,0,8),(1054,0,1053,'2015-10-15 15:00:43','2015-10-15 15:00:43','1/2/974/1053/1054',0,0,0),(1055,0,1053,'2015-10-15 15:00:43','2015-10-15 15:00:43','1/2/974/1053/1055',0,0,0),(1056,0,1053,'2015-10-15 15:00:44','2015-10-15 15:00:44','1/2/974/1053/1056',0,0,0),(1057,0,1053,'2015-10-15 15:00:44','2015-10-15 15:00:44','1/2/974/1053/1057',0,0,0),(1058,0,1053,'2015-10-15 15:00:45','2015-10-15 15:00:45','1/2/974/1053/1058',0,0,0),(1059,0,1053,'2015-10-15 15:00:45','2015-10-15 15:00:45','1/2/974/1053/1059',0,0,0),(1060,0,1053,'2015-10-15 15:00:46','2015-10-15 15:00:46','1/2/974/1053/1060',0,0,0),(1061,0,1053,'2015-10-15 15:00:46','2015-10-15 15:00:46','1/2/974/1053/1061',0,0,0),(1062,0,974,'2015-10-15 15:00:46','2015-10-15 15:00:46','1/2/974/1062',0,0,8),(1063,0,1062,'2015-10-15 15:00:47','2015-10-15 15:00:47','1/2/974/1062/1063',0,0,0),(1064,0,1062,'2015-10-15 15:00:48','2015-10-15 15:00:48','1/2/974/1062/1064',0,0,0),(1065,0,1062,'2015-10-15 15:00:48','2015-10-15 15:00:48','1/2/974/1062/1065',0,0,0),(1066,0,1062,'2015-10-15 15:00:49','2015-10-15 15:00:49','1/2/974/1062/1066',0,0,0),(1067,0,1062,'2015-10-15 15:00:49','2015-10-15 15:00:49','1/2/974/1062/1067',0,0,0),(1068,0,1062,'2015-10-15 15:00:50','2015-10-15 15:00:50','1/2/974/1062/1068',0,0,0),(1069,0,1062,'2015-10-15 15:00:50','2015-10-15 15:00:50','1/2/974/1062/1069',0,0,0),(1070,0,1062,'2015-10-15 15:00:51','2015-10-15 15:00:51','1/2/974/1062/1070',0,0,0),(1071,0,974,'2015-10-15 15:00:51','2015-10-15 15:00:51','1/2/974/1071',0,0,2),(1072,0,1071,'2015-10-15 15:00:52','2015-10-15 15:00:52','1/2/974/1071/1072',0,0,0),(1073,0,1071,'2015-10-15 15:00:52','2015-10-15 15:00:52','1/2/974/1071/1073',0,0,0),(1074,0,974,'2015-10-15 15:00:53','2015-10-15 15:00:53','1/2/974/1074',0,0,4),(1075,0,1074,'2015-10-15 15:00:53','2015-10-15 15:00:53','1/2/974/1074/1075',0,0,0),(1076,0,1074,'2015-10-15 15:00:54','2015-10-15 15:00:54','1/2/974/1074/1076',0,0,0),(1077,0,1074,'2015-10-15 15:00:54','2015-10-15 15:00:54','1/2/974/1074/1077',0,0,0),(1078,0,1074,'2015-10-15 15:00:55','2015-10-15 15:00:55','1/2/974/1074/1078',0,0,0),(1079,0,974,'2015-10-15 15:00:55','2015-10-15 15:00:55','1/2/974/1079',0,0,8),(1080,0,1079,'2015-10-15 15:00:56','2015-10-15 15:00:56','1/2/974/1079/1080',0,0,0),(1081,0,1079,'2015-10-15 15:00:57','2015-10-15 15:00:57','1/2/974/1079/1081',0,0,0),(1082,0,1079,'2015-10-15 15:00:57','2015-10-15 15:00:57','1/2/974/1079/1082',0,0,0),(1083,0,1079,'2015-10-15 15:00:58','2015-10-15 15:00:58','1/2/974/1079/1083',0,0,0),(1084,0,1079,'2015-10-15 15:00:58','2015-10-15 15:00:58','1/2/974/1079/1084',0,0,0),(1085,0,1079,'2015-10-15 15:00:58','2015-10-15 15:00:58','1/2/974/1079/1085',0,0,0),(1086,0,1079,'2015-10-15 15:00:59','2015-10-15 15:00:59','1/2/974/1079/1086',0,0,0),(1087,0,1079,'2015-10-15 15:00:59','2015-10-15 15:00:59','1/2/974/1079/1087',0,0,0),(1088,0,974,'2015-10-15 15:01:00','2015-10-15 15:01:00','1/2/974/1088',0,0,3),(1089,0,1088,'2015-10-15 15:01:01','2015-10-15 15:01:01','1/2/974/1088/1089',0,0,0),(1090,0,1088,'2015-10-15 15:01:01','2015-10-15 15:01:01','1/2/974/1088/1090',0,0,0),(1091,0,1088,'2015-10-15 15:01:01','2015-10-15 15:01:01','1/2/974/1088/1091',0,0,0),(1092,0,974,'2015-10-15 15:01:02','2015-10-15 15:01:02','1/2/974/1092',0,0,8),(1093,0,1092,'2015-10-15 15:01:03','2015-10-15 15:01:03','1/2/974/1092/1093',0,0,0),(1094,0,1092,'2015-10-15 15:01:03','2015-10-15 15:01:03','1/2/974/1092/1094',0,0,0),(1095,0,1092,'2015-10-15 15:01:04','2015-10-15 15:01:04','1/2/974/1092/1095',0,0,0),(1096,0,1092,'2015-10-15 15:01:04','2015-10-15 15:01:04','1/2/974/1092/1096',0,0,0),(1097,0,1092,'2015-10-15 15:01:05','2015-10-15 15:01:05','1/2/974/1092/1097',0,0,0),(1098,0,1092,'2015-10-15 15:01:05','2015-10-15 15:01:05','1/2/974/1092/1098',0,0,0),(1099,0,1092,'2015-10-15 15:01:06','2015-10-15 15:01:06','1/2/974/1092/1099',0,0,0),(1100,0,1092,'2015-10-15 15:01:06','2015-10-15 15:01:06','1/2/974/1092/1100',0,0,0),(1101,0,974,'2015-10-15 15:01:07','2015-10-15 15:01:07','1/2/974/1101',0,0,12),(1102,0,1101,'2015-10-15 15:01:07','2015-10-15 15:01:07','1/2/974/1101/1102',0,0,0),(1103,0,1101,'2015-10-15 15:01:08','2015-10-15 15:01:08','1/2/974/1101/1103',0,0,0),(1104,0,1101,'2015-10-15 15:01:08','2015-10-15 15:01:08','1/2/974/1101/1104',0,0,0),(1105,0,1101,'2015-10-15 15:01:09','2015-10-15 15:01:09','1/2/974/1101/1105',0,0,0),(1106,0,1101,'2015-10-15 15:01:09','2015-10-15 15:01:09','1/2/974/1101/1106',0,0,0),(1107,0,1101,'2015-10-15 15:01:10','2015-10-15 15:01:10','1/2/974/1101/1107',0,0,0),(1108,0,1101,'2015-10-15 15:01:10','2015-10-15 15:01:10','1/2/974/1101/1108',0,0,0),(1109,0,1101,'2015-10-15 15:01:11','2015-10-15 15:01:11','1/2/974/1101/1109',0,0,0),(1110,0,1101,'2015-10-15 15:01:11','2015-10-15 15:01:11','1/2/974/1101/1110',0,0,0),(1111,0,1101,'2015-10-15 15:01:12','2015-10-15 15:01:12','1/2/974/1101/1111',0,0,0),(1112,0,1101,'2015-10-15 15:01:12','2015-10-15 15:01:12','1/2/974/1101/1112',0,0,0),(1113,0,1101,'2015-10-15 15:01:13','2015-10-15 15:01:13','1/2/974/1101/1113',0,0,0),(1114,0,974,'2015-10-15 15:01:13','2015-10-15 15:01:13','1/2/974/1114',0,0,7),(1115,0,1114,'2015-10-15 15:01:14','2015-10-15 15:01:14','1/2/974/1114/1115',0,0,0),(1116,0,1114,'2015-10-15 15:01:15','2015-10-15 15:01:15','1/2/974/1114/1116',0,0,0),(1117,0,1114,'2015-10-15 15:01:15','2015-10-15 15:01:15','1/2/974/1114/1117',0,0,0),(1118,0,1114,'2015-10-15 15:01:16','2015-10-15 15:01:16','1/2/974/1114/1118',0,0,0),(1119,0,1114,'2015-10-15 15:01:16','2015-10-15 15:01:16','1/2/974/1114/1119',0,0,0),(1120,0,1114,'2015-10-15 15:01:17','2015-10-15 15:01:17','1/2/974/1114/1120',0,0,0),(1121,0,1114,'2015-10-15 15:01:17','2015-10-15 15:01:17','1/2/974/1114/1121',0,0,0),(1122,0,974,'2015-10-15 15:01:18','2015-10-15 15:01:18','1/2/974/1122',0,0,6),(1123,0,1122,'2015-10-15 15:01:18','2015-10-15 15:01:18','1/2/974/1122/1123',0,0,0),(1124,0,1122,'2015-10-15 15:01:19','2015-10-15 15:01:19','1/2/974/1122/1124',0,0,0),(1125,0,1122,'2015-10-15 15:01:19','2015-10-15 15:01:19','1/2/974/1122/1125',0,0,0),(1126,0,1122,'2015-10-15 15:01:20','2015-10-15 15:01:20','1/2/974/1122/1126',0,0,0),(1127,0,1122,'2015-10-15 15:01:20','2015-10-15 15:01:20','1/2/974/1122/1127',0,0,0),(1128,0,1122,'2015-10-15 15:01:21','2015-10-15 15:01:21','1/2/974/1122/1128',0,0,0),(1129,0,974,'2015-10-15 15:01:21','2015-10-15 15:01:21','1/2/974/1129',0,0,4),(1130,0,1129,'2015-10-15 15:01:22','2015-10-15 15:01:22','1/2/974/1129/1130',0,0,0),(1131,0,1129,'2015-10-15 15:01:23','2015-10-15 15:01:23','1/2/974/1129/1131',0,0,0),(1132,0,1129,'2015-10-15 15:01:23','2015-10-15 15:01:23','1/2/974/1129/1132',0,0,0),(1133,0,1129,'2015-10-15 15:01:24','2015-10-15 15:01:24','1/2/974/1129/1133',0,0,0),(1134,0,974,'2015-10-15 15:01:24','2015-10-15 15:01:24','1/2/974/1134',0,0,1),(1135,0,1134,'2015-10-15 15:01:25','2015-10-15 15:01:25','1/2/974/1134/1135',0,0,0),(1136,0,974,'2015-10-15 15:01:26','2015-10-15 15:01:26','1/2/974/1136',0,0,5),(1137,0,1136,'2015-10-15 15:01:26','2015-10-15 15:01:26','1/2/974/1136/1137',0,0,0),(1138,0,1136,'2015-10-15 15:01:27','2015-10-15 15:01:27','1/2/974/1136/1138',0,0,0),(1139,0,1136,'2015-10-15 15:01:28','2015-10-15 15:01:28','1/2/974/1136/1139',0,0,0),(1140,0,1136,'2015-10-15 15:01:28','2015-10-15 15:01:28','1/2/974/1136/1140',0,0,0),(1141,0,1136,'2015-10-15 15:01:29','2015-10-15 15:01:29','1/2/974/1136/1141',0,0,0),(1142,0,974,'2015-10-15 15:01:29','2015-10-15 15:01:29','1/2/974/1142',0,0,2),(1143,0,1142,'2015-10-15 15:01:30','2015-10-15 15:01:30','1/2/974/1142/1143',0,0,0),(1144,0,1142,'2015-10-15 15:01:30','2015-10-15 15:01:30','1/2/974/1142/1144',0,0,0),(1145,0,0,'2015-10-15 15:01:31','2015-10-15 15:01:31','1/2/1145',0,0,14),(1146,0,1145,'2015-10-15 15:01:31','2015-10-15 15:01:31','1/2/1145/1146',0,0,1),(1147,0,1145,'2015-10-15 15:01:46','2015-10-15 15:01:46','1/2/1145/1147',0,0,2),(1148,0,1147,'2015-10-15 15:01:47','2015-10-15 15:01:47','1/2/1145/1147/1148',0,0,0),(1149,0,1147,'2015-10-15 15:01:48','2015-10-15 15:01:48','1/2/1145/1147/1149',0,0,0),(1150,0,1145,'2015-10-15 15:01:48','2015-10-15 15:01:48','1/2/1145/1150',0,0,1),(1151,0,1150,'2015-10-15 15:01:49','2015-10-15 15:01:49','1/2/1145/1150/1151',0,0,0),(1152,0,1145,'2015-10-15 15:01:50','2015-10-15 15:01:50','1/2/1145/1152',0,0,1),(1153,0,1152,'2015-10-15 15:01:50','2015-10-15 15:01:50','1/2/1145/1152/1153',0,0,0),(1154,0,1145,'2015-10-15 15:01:51','2015-10-15 15:01:51','1/2/1145/1154',0,0,2),(1155,0,1154,'2015-10-15 15:01:52','2015-10-15 15:01:52','1/2/1145/1154/1155',0,0,0),(1156,0,1154,'2015-10-15 15:01:52','2015-10-15 15:01:52','1/2/1145/1154/1156',0,0,0),(1157,0,1145,'2015-10-15 15:01:53','2015-10-15 15:01:53','1/2/1145/1157',0,0,1),(1158,0,0,'2015-10-15 15:01:55','2015-10-15 15:01:55','1/2/1158',0,0,39),(1159,0,1158,'2015-10-15 15:01:55','2015-10-15 15:01:55','1/2/1158/1159',0,0,2),(1160,0,1159,'2015-10-15 15:01:56','2015-10-15 15:01:56','1/2/1158/1159/1160',0,0,0),(1161,0,1159,'2015-10-15 15:01:57','2015-10-15 15:01:57','1/2/1158/1159/1161',0,0,0),(1162,0,1158,'2015-10-15 15:01:57','2015-10-15 15:01:57','1/2/1158/1162',0,0,1),(1163,0,1162,'2015-10-15 15:01:58','2015-10-15 15:01:58','1/2/1158/1162/1163',0,0,0),(1164,0,1158,'2015-10-15 15:01:58','2015-10-15 15:01:58','1/2/1158/1164',0,0,4),(1165,0,1164,'2015-10-15 15:01:59','2015-10-15 15:01:59','1/2/1158/1164/1165',0,0,0),(1166,0,1164,'2015-10-15 15:01:59','2015-10-15 15:01:59','1/2/1158/1164/1166',0,0,0),(1167,0,1164,'2015-10-15 15:02:00','2015-10-15 15:02:00','1/2/1158/1164/1167',0,0,0),(1168,0,1164,'2015-10-15 15:02:00','2015-10-15 15:02:00','1/2/1158/1164/1168',0,0,0),(1169,0,1158,'2015-10-15 15:02:01','2015-10-15 15:02:01','1/2/1158/1169',0,0,4),(1170,0,1169,'2015-10-15 15:02:02','2015-10-15 15:02:02','1/2/1158/1169/1170',0,0,0),(1171,0,1169,'2015-10-15 15:02:02','2015-10-15 15:02:02','1/2/1158/1169/1171',0,0,0),(1172,0,1169,'2015-10-15 15:02:03','2015-10-15 15:02:03','1/2/1158/1169/1172',0,0,0),(1173,0,1169,'2015-10-15 15:02:03','2015-10-15 15:02:03','1/2/1158/1169/1173',0,0,0),(1174,0,1158,'2015-10-15 15:02:04','2015-10-15 15:02:04','1/2/1158/1174',0,0,4),(1175,0,1174,'2015-10-15 15:02:04','2015-10-15 15:02:04','1/2/1158/1174/1175',0,0,0),(1176,0,1174,'2015-10-15 15:02:05','2015-10-15 15:02:05','1/2/1158/1174/1176',0,0,0),(1177,0,1174,'2015-10-15 15:02:05','2015-10-15 15:02:05','1/2/1158/1174/1177',0,0,0),(1178,0,1174,'2015-10-15 15:02:06','2015-10-15 15:02:06','1/2/1158/1174/1178',0,0,0),(1179,0,1158,'2015-10-15 15:02:06','2015-10-15 15:02:06','1/2/1158/1179',0,0,2),(1180,0,1179,'2015-10-15 15:02:07','2015-10-15 15:02:07','1/2/1158/1179/1180',0,0,0),(1181,0,1179,'2015-10-15 15:02:08','2015-10-15 15:02:08','1/2/1158/1179/1181',0,0,0),(1182,0,1158,'2015-10-15 15:02:08','2015-10-15 15:02:08','1/2/1158/1182',0,0,3),(1183,0,1182,'2015-10-15 15:02:09','2015-10-15 15:02:09','1/2/1158/1182/1183',0,0,0),(1184,0,1182,'2015-10-15 15:02:09','2015-10-15 15:02:09','1/2/1158/1182/1184',0,0,0),(1185,0,1182,'2015-10-15 15:02:10','2015-10-15 15:02:10','1/2/1158/1182/1185',0,0,0),(1186,0,1158,'2015-10-15 15:02:10','2015-10-15 15:02:10','1/2/1158/1186',0,0,2),(1187,0,1186,'2015-10-15 15:02:11','2015-10-15 15:02:11','1/2/1158/1186/1187',0,0,0),(1188,0,1186,'2015-10-15 15:02:12','2015-10-15 15:02:12','1/2/1158/1186/1188',0,0,0),(1189,0,1158,'2015-10-15 15:02:12','2015-10-15 15:02:12','1/2/1158/1189',0,0,5),(1190,0,1189,'2015-10-15 15:02:13','2015-10-15 15:02:13','1/2/1158/1189/1190',0,0,0),(1191,0,1189,'2015-10-15 15:02:13','2015-10-15 15:02:13','1/2/1158/1189/1191',0,0,0),(1192,0,1189,'2015-10-15 15:02:14','2015-10-15 15:02:14','1/2/1158/1189/1192',0,0,0),(1193,0,1189,'2015-10-15 15:02:14','2015-10-15 15:02:14','1/2/1158/1189/1193',0,0,0),(1194,0,1189,'2015-10-15 15:02:15','2015-10-15 15:02:15','1/2/1158/1189/1194',0,0,0),(1195,0,1158,'2015-10-15 15:02:15','2015-10-15 15:02:15','1/2/1158/1195',0,0,2),(1196,0,1195,'2015-10-15 15:02:16','2015-10-15 15:02:16','1/2/1158/1195/1196',0,0,0),(1197,0,1195,'2015-10-15 15:02:16','2015-10-15 15:02:16','1/2/1158/1195/1197',0,0,0),(1198,0,0,'2015-10-15 15:02:17','2015-10-15 15:02:17','1/2/1198',0,0,19),(1199,0,1198,'2015-10-15 15:02:17','2015-10-15 15:02:17','1/2/1198/1199',0,0,5),(1200,0,1199,'2015-10-15 15:02:18','2015-10-15 15:02:18','1/2/1198/1199/1200',0,0,0),(1201,0,1199,'2015-10-15 15:02:19','2015-10-15 15:02:19','1/2/1198/1199/1201',0,0,0),(1202,0,1199,'2015-10-15 15:02:19','2015-10-15 15:02:19','1/2/1198/1199/1202',0,0,0),(1203,0,1199,'2015-10-15 15:02:20','2015-10-15 15:02:20','1/2/1198/1199/1203',0,0,0),(1204,0,1199,'2015-10-15 15:02:20','2015-10-15 15:02:20','1/2/1198/1199/1204',0,0,0),(1205,0,1198,'2015-10-15 15:02:21','2015-10-15 15:02:21','1/2/1198/1205',0,0,1),(1206,0,1205,'2015-10-15 15:02:21','2015-10-15 15:02:21','1/2/1198/1205/1206',0,0,0),(1207,0,1198,'2015-10-15 15:02:22','2015-10-15 15:02:22','1/2/1198/1207',0,0,3),(1208,0,1207,'2015-10-15 15:02:23','2015-10-15 15:02:23','1/2/1198/1207/1208',0,0,0),(1209,0,1207,'2015-10-15 15:02:23','2015-10-15 15:02:23','1/2/1198/1207/1209',0,0,0),(1210,0,1207,'2015-10-15 15:02:24','2015-10-15 15:02:24','1/2/1198/1207/1210',0,0,0),(1211,0,1198,'2015-10-15 15:02:24','2015-10-15 15:02:24','1/2/1198/1211',0,0,2),(1212,0,1211,'2015-10-15 15:02:25','2015-10-15 15:02:25','1/2/1198/1211/1212',0,0,0),(1213,0,1211,'2015-10-15 15:02:25','2015-10-15 15:02:25','1/2/1198/1211/1213',0,0,0),(1214,0,1198,'2015-10-15 15:02:26','2015-10-15 15:02:26','1/2/1198/1214',0,0,1),(1215,0,1214,'2015-10-15 15:02:26','2015-10-15 15:02:26','1/2/1198/1214/1215',0,0,0),(1216,0,1198,'2015-10-15 15:02:27','2015-10-15 15:02:27','1/2/1198/1216',0,0,1),(1217,0,1216,'2015-10-15 15:02:28','2015-10-15 15:02:28','1/2/1198/1216/1217',0,0,0),(1218,0,0,'2015-10-15 15:02:28','2015-10-15 15:02:28','1/2/1218',0,0,27),(1219,0,1218,'2015-10-15 15:02:29','2015-10-15 15:02:29','1/2/1218/1219',0,0,2),(1220,0,1219,'2015-10-15 15:02:29','2015-10-15 15:02:29','1/2/1218/1219/1220',0,0,0),(1221,0,1219,'2015-10-15 15:02:30','2015-10-15 15:02:30','1/2/1218/1219/1221',0,0,0),(1222,0,1218,'2015-10-15 15:02:30','2015-10-15 15:02:30','1/2/1218/1222',0,0,1),(1223,0,1222,'2015-10-15 15:02:31','2015-10-15 15:02:31','1/2/1218/1222/1223',0,0,0),(1224,0,1218,'2015-10-15 15:02:31','2015-10-15 15:02:31','1/2/1218/1224',0,0,2),(1225,0,1224,'2015-10-15 15:02:32','2015-10-15 15:02:32','1/2/1218/1224/1225',0,0,0),(1226,0,1224,'2015-10-15 15:02:33','2015-10-15 15:02:33','1/2/1218/1224/1226',0,0,0),(1227,0,1218,'2015-10-15 15:02:33','2015-10-15 15:02:33','1/2/1218/1227',0,0,3),(1228,0,1227,'2015-10-15 15:02:34','2015-10-15 15:02:34','1/2/1218/1227/1228',0,0,0),(1229,0,1227,'2015-10-15 15:02:34','2015-10-15 15:02:34','1/2/1218/1227/1229',0,0,0),(1230,0,1227,'2015-10-15 15:02:35','2015-10-15 15:02:35','1/2/1218/1227/1230',0,0,0),(1231,0,1218,'2015-10-15 15:02:35','2015-10-15 15:02:35','1/2/1218/1231',0,0,3),(1232,0,1231,'2015-10-15 15:02:36','2015-10-15 15:02:36','1/2/1218/1231/1232',0,0,0),(1233,0,1231,'2015-10-15 15:02:36','2015-10-15 15:02:36','1/2/1218/1231/1233',0,0,0),(1234,0,1231,'2015-10-15 15:02:37','2015-10-15 15:02:37','1/2/1218/1231/1234',0,0,0),(1235,0,1218,'2015-10-15 15:02:37','2015-10-15 15:02:37','1/2/1218/1235',0,0,4),(1236,0,1235,'2015-10-15 15:02:38','2015-10-15 15:02:38','1/2/1218/1235/1236',0,0,0),(1237,0,1235,'2015-10-15 15:02:39','2015-10-15 15:02:39','1/2/1218/1235/1237',0,0,0),(1238,0,1235,'2015-10-15 15:02:39','2015-10-15 15:02:39','1/2/1218/1235/1238',0,0,0),(1239,0,1235,'2015-10-15 15:02:40','2015-10-15 15:02:40','1/2/1218/1235/1239',0,0,0),(1240,0,1218,'2015-10-15 15:02:40','2015-10-15 15:02:40','1/2/1218/1240',0,0,2),(1241,0,1240,'2015-10-15 15:02:41','2015-10-15 15:02:41','1/2/1218/1240/1241',0,0,0),(1242,0,1240,'2015-10-15 15:02:41','2015-10-15 15:02:41','1/2/1218/1240/1242',0,0,0),(1243,0,1218,'2015-10-15 15:02:42','2015-10-15 15:02:42','1/2/1218/1243',0,0,1),(1244,0,1243,'2015-10-15 15:02:43','2015-10-15 15:02:43','1/2/1218/1243/1244',0,0,0),(1245,0,0,'2015-10-15 15:02:43','2015-10-15 15:02:43','1/2/1245',0,0,36),(1246,0,1245,'2015-10-15 15:02:44','2015-10-15 15:02:44','1/2/1245/1246',0,0,2),(1247,0,1246,'2015-10-15 15:02:44','2015-10-15 15:02:44','1/2/1245/1246/1247',0,0,0),(1248,0,1246,'2015-10-15 15:02:45','2015-10-15 15:02:45','1/2/1245/1246/1248',0,0,0),(1249,0,1245,'2015-10-15 15:02:45','2015-10-15 15:02:45','1/2/1245/1249',0,0,13),(1250,0,1249,'2015-10-15 15:02:46','2015-10-15 15:02:46','1/2/1245/1249/1250',0,0,0),(1251,0,1249,'2015-10-15 15:02:47','2015-10-15 15:02:47','1/2/1245/1249/1251',0,0,0),(1252,0,1249,'2015-10-15 15:02:47','2015-10-15 15:02:47','1/2/1245/1249/1252',0,0,0),(1253,0,1249,'2015-10-15 15:02:48','2015-10-15 15:02:48','1/2/1245/1249/1253',0,0,0),(1254,0,1249,'2015-10-15 15:02:48','2015-10-15 15:02:48','1/2/1245/1249/1254',0,0,0),(1255,0,1249,'2015-10-15 15:02:49','2015-10-15 15:02:49','1/2/1245/1249/1255',0,0,0),(1256,0,1249,'2015-10-15 15:02:49','2015-10-15 15:02:49','1/2/1245/1249/1256',0,0,0),(1257,0,1249,'2015-10-15 15:02:50','2015-10-15 15:02:50','1/2/1245/1249/1257',0,0,0),(1258,0,1249,'2015-10-15 15:02:50','2015-10-15 15:02:50','1/2/1245/1249/1258',0,0,0),(1259,0,1249,'2015-10-15 15:02:51','2015-10-15 15:02:51','1/2/1245/1249/1259',0,0,0),(1260,0,1249,'2015-10-15 15:02:51','2015-10-15 15:02:51','1/2/1245/1249/1260',0,0,0),(1261,0,1249,'2015-10-15 15:02:51','2015-10-15 15:02:51','1/2/1245/1249/1261',0,0,0),(1262,0,1249,'2015-10-15 15:02:52','2015-10-15 15:02:52','1/2/1245/1249/1262',0,0,0),(1263,0,1245,'2015-10-15 15:02:52','2015-10-15 15:02:52','1/2/1245/1263',0,0,1),(1264,0,1263,'2015-10-15 15:02:53','2015-10-15 15:02:53','1/2/1245/1263/1264',0,0,0),(1265,0,1245,'2015-10-15 15:02:54','2015-10-15 15:02:54','1/2/1245/1265',0,0,7),(1266,0,1265,'2015-10-15 15:02:54','2015-10-15 15:02:54','1/2/1245/1265/1266',0,0,0),(1267,0,1265,'2015-10-15 15:02:55','2015-10-15 15:02:55','1/2/1245/1265/1267',0,0,0),(1268,0,1265,'2015-10-15 15:02:55','2015-10-15 15:02:55','1/2/1245/1265/1268',0,0,0),(1269,0,1265,'2015-10-15 15:02:56','2015-10-15 15:02:56','1/2/1245/1265/1269',0,0,0),(1270,0,1265,'2015-10-15 15:02:56','2015-10-15 15:02:56','1/2/1245/1265/1270',0,0,0),(1271,0,1265,'2015-10-15 15:02:57','2015-10-15 15:02:57','1/2/1245/1265/1271',0,0,0),(1272,0,1265,'2015-10-15 15:02:57','2015-10-15 15:02:57','1/2/1245/1265/1272',0,0,0),(1273,0,1245,'2015-10-15 15:02:58','2015-10-15 15:02:58','1/2/1245/1273',0,0,2),(1274,0,1273,'2015-10-15 15:02:59','2015-10-15 15:02:59','1/2/1245/1273/1274',0,0,0),(1275,0,1273,'2015-10-15 15:02:59','2015-10-15 15:02:59','1/2/1245/1273/1275',0,0,0),(1276,0,1245,'2015-10-15 15:03:00','2015-10-15 15:03:00','1/2/1245/1276',0,0,5),(1277,0,1276,'2015-10-15 15:03:00','2015-10-15 15:03:00','1/2/1245/1276/1277',0,0,0),(1278,0,1276,'2015-10-15 15:03:01','2015-10-15 15:03:01','1/2/1245/1276/1278',0,0,0),(1279,0,1276,'2015-10-15 15:03:01','2015-10-15 15:03:01','1/2/1245/1276/1279',0,0,0),(1280,0,1276,'2015-10-15 15:03:02','2015-10-15 15:03:02','1/2/1245/1276/1280',0,0,0),(1281,0,1276,'2015-10-15 15:03:02','2015-10-15 15:03:02','1/2/1245/1276/1281',0,0,0),(1282,0,0,'2015-10-15 15:03:03','2015-10-15 15:03:03','1/2/1282',0,0,10),(1283,0,1282,'2015-10-15 15:03:03','2015-10-15 15:03:03','1/2/1282/1283',0,0,4),(1284,0,1283,'2015-10-15 15:03:04','2015-10-15 15:03:04','1/2/1282/1283/1284',0,0,0),(1285,0,1283,'2015-10-15 15:03:04','2015-10-15 15:03:04','1/2/1282/1283/1285',0,0,0),(1286,0,1283,'2015-10-15 15:03:05','2015-10-15 15:03:05','1/2/1282/1283/1286',0,0,0),(1287,0,1283,'2015-10-15 15:03:05','2015-10-15 15:03:05','1/2/1282/1283/1287',0,0,0),(1288,0,1282,'2015-10-15 15:03:06','2015-10-15 15:03:06','1/2/1282/1288',0,0,4),(1289,0,1288,'2015-10-15 15:03:07','2015-10-15 15:03:07','1/2/1282/1288/1289',0,0,0),(1290,0,1288,'2015-10-15 15:03:07','2015-10-15 15:03:07','1/2/1282/1288/1290',0,0,0),(1291,0,1288,'2015-10-15 15:03:08','2015-10-15 15:03:08','1/2/1282/1288/1291',0,0,0),(1292,0,1288,'2015-10-15 15:03:08','2015-10-15 15:03:08','1/2/1282/1288/1292',0,0,0),(1293,0,0,'2015-10-15 15:03:09','2015-10-15 15:03:09','1/2/1293',0,0,3),(1294,0,1293,'2015-10-15 15:03:09','2015-10-15 15:03:09','1/2/1293/1294',0,0,2),(1295,0,1294,'2015-10-15 15:03:10','2015-10-15 15:03:10','1/2/1293/1294/1295',0,0,0),(1296,0,1294,'2015-10-15 15:03:10','2015-10-15 15:03:10','1/2/1293/1294/1296',0,0,0),(1297,0,0,'2015-10-15 15:03:11','2015-10-15 15:03:11','1/2/1297',0,0,24),(1298,0,1297,'2015-10-15 15:03:11','2015-10-15 15:03:11','1/2/1297/1298',0,0,2),(1299,0,1298,'2015-10-15 15:03:12','2015-10-15 15:03:12','1/2/1297/1298/1299',0,0,0),(1300,0,1298,'2015-10-15 15:03:13','2015-10-15 15:03:13','1/2/1297/1298/1300',0,0,0),(1301,0,1297,'2015-10-15 15:03:13','2015-10-15 15:03:13','1/2/1297/1301',0,0,6),(1302,0,1301,'2015-10-15 15:03:14','2015-10-15 15:03:14','1/2/1297/1301/1302',0,0,0),(1303,0,1301,'2015-10-15 15:03:14','2015-10-15 15:03:14','1/2/1297/1301/1303',0,0,0),(1304,0,1301,'2015-10-15 15:03:15','2015-10-15 15:03:15','1/2/1297/1301/1304',0,0,0),(1305,0,1301,'2015-10-15 15:03:15','2015-10-15 15:03:15','1/2/1297/1301/1305',0,0,0),(1306,0,1301,'2015-10-15 15:03:16','2015-10-15 15:03:16','1/2/1297/1301/1306',0,0,0),(1307,0,1301,'2015-10-15 15:03:16','2015-10-15 15:03:16','1/2/1297/1301/1307',0,0,0),(1308,0,1297,'2015-10-15 15:03:17','2015-10-15 15:03:17','1/2/1297/1308',0,0,7),(1309,0,1308,'2015-10-15 15:03:18','2015-10-15 15:03:18','1/2/1297/1308/1309',0,0,0),(1310,0,1308,'2015-10-15 15:03:18','2015-10-15 15:03:18','1/2/1297/1308/1310',0,0,0),(1311,0,1308,'2015-10-15 15:03:19','2015-10-15 15:03:19','1/2/1297/1308/1311',0,0,0),(1312,0,1308,'2015-10-15 15:03:19','2015-10-15 15:03:19','1/2/1297/1308/1312',0,0,0),(1313,0,1308,'2015-10-15 15:03:20','2015-10-15 15:03:20','1/2/1297/1308/1313',0,0,0),(1314,0,1308,'2015-10-15 15:03:20','2015-10-15 15:03:20','1/2/1297/1308/1314',0,0,0),(1315,0,1308,'2015-10-15 15:03:20','2015-10-15 15:03:20','1/2/1297/1308/1315',0,0,0),(1316,0,1297,'2015-10-15 15:03:21','2015-10-15 15:03:21','1/2/1297/1316',0,0,1),(1317,0,1316,'2015-10-15 15:03:22','2015-10-15 15:03:22','1/2/1297/1316/1317',0,0,0),(1318,0,1297,'2015-10-15 15:03:22','2015-10-15 15:03:22','1/2/1297/1318',0,0,1),(1319,0,1318,'2015-10-15 15:03:23','2015-10-15 15:03:23','1/2/1297/1318/1319',0,0,0),(1320,0,1297,'2015-10-15 15:03:23','2015-10-15 15:03:23','1/2/1297/1320',0,0,1),(1321,0,1320,'2015-10-15 15:03:24','2015-10-15 15:03:24','1/2/1297/1320/1321',0,0,0),(1322,0,0,'2015-10-15 15:03:25','2015-10-15 15:03:25','1/2/1322',0,0,14),(1323,0,1322,'2015-10-15 15:03:25','2015-10-15 15:03:25','1/2/1322/1323',0,0,4),(1324,0,1323,'2015-10-15 15:03:26','2015-10-15 15:03:26','1/2/1322/1323/1324',0,0,0),(1325,0,1323,'2015-10-15 15:03:26','2015-10-15 15:03:26','1/2/1322/1323/1325',0,0,0),(1326,0,1323,'2015-10-15 15:03:27','2015-10-15 15:03:27','1/2/1322/1323/1326',0,0,0),(1327,0,1323,'2015-10-15 15:03:27','2015-10-15 15:03:27','1/2/1322/1323/1327',0,0,0),(1328,0,1322,'2015-10-15 15:03:28','2015-10-15 15:03:28','1/2/1322/1328',0,0,5),(1329,0,1328,'2015-10-15 15:03:29','2015-10-15 15:03:29','1/2/1322/1328/1329',0,0,0),(1330,0,1328,'2015-10-15 15:03:29','2015-10-15 15:03:29','1/2/1322/1328/1330',0,0,0),(1331,0,1328,'2015-10-15 15:03:30','2015-10-15 15:03:30','1/2/1322/1328/1331',0,0,0),(1332,0,1328,'2015-10-15 15:03:30','2015-10-15 15:03:30','1/2/1322/1328/1332',0,0,0),(1333,0,1328,'2015-10-15 15:03:31','2015-10-15 15:03:31','1/2/1322/1328/1333',0,0,0),(1334,0,1322,'2015-10-15 15:03:31','2015-10-15 15:03:31','1/2/1322/1334',0,0,2),(1335,0,1334,'2015-10-15 15:03:32','2015-10-15 15:03:32','1/2/1322/1334/1335',0,0,0),(1336,0,1334,'2015-10-15 15:03:32','2015-10-15 15:03:32','1/2/1322/1334/1336',0,0,0),(1337,3,1146,'2015-10-15 15:04:59','2015-10-15 15:04:59','1/2/1145/1146/1337',1,4,0),(1338,3,1157,'2015-10-15 15:05:35','2015-10-15 15:05:35','1/2/1145/1157/1338',1,4,0),(1339,3,2,'2015-10-16 11:18:59','2015-10-16 11:18:59','1/2/1339',1,2,0),(1340,3,1218,'2015-10-16 11:22:35','2015-10-16 11:23:13','1/2/1218/1340',1,3,0);
/*!40000 ALTER TABLE `grocery_bag_catalog_category_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_category_entity_datetime`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_category_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DTIME_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1377 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Datetime Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_category_entity_datetime`
--

LOCK TABLES `grocery_bag_catalog_category_entity_datetime` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_category_entity_datetime` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_category_entity_datetime` VALUES (1,58,0,1,NULL),(2,58,0,2,NULL),(896,58,0,884,NULL),(897,58,0,885,NULL),(898,58,0,886,NULL),(899,58,0,887,NULL),(900,58,0,888,NULL),(901,58,0,889,NULL),(902,58,0,890,NULL),(903,58,0,891,NULL),(904,58,0,892,NULL),(905,58,0,893,NULL),(906,58,0,894,NULL),(907,58,0,895,NULL),(908,58,0,896,NULL),(909,58,0,897,NULL),(910,58,0,898,NULL),(911,58,0,899,NULL),(912,58,0,900,NULL),(913,58,0,901,NULL),(914,58,0,902,NULL),(915,58,0,903,NULL),(916,58,0,904,NULL),(917,58,0,905,NULL),(918,58,0,906,NULL),(919,58,0,907,NULL),(920,58,0,908,NULL),(921,58,0,909,NULL),(922,58,0,910,NULL),(923,58,0,911,NULL),(924,58,0,912,NULL),(925,58,0,913,NULL),(926,58,0,914,NULL),(927,58,0,915,NULL),(928,58,0,916,NULL),(929,58,0,917,NULL),(930,58,0,918,NULL),(931,58,0,919,NULL),(932,58,0,920,NULL),(933,58,0,921,NULL),(934,58,0,922,NULL),(935,58,0,923,NULL),(936,58,0,924,NULL),(937,58,0,925,NULL),(938,58,0,926,NULL),(939,58,0,927,NULL),(940,58,0,928,NULL),(941,58,0,929,NULL),(942,58,0,930,NULL),(943,58,0,931,NULL),(944,58,0,932,NULL),(945,58,0,933,NULL),(946,58,0,934,NULL),(947,58,0,935,NULL),(948,58,0,936,NULL),(949,58,0,937,NULL),(950,58,0,938,NULL),(951,58,0,939,NULL),(952,58,0,940,NULL),(953,58,0,941,NULL),(954,58,0,942,NULL),(955,58,0,943,NULL),(956,58,0,944,NULL),(957,58,0,945,NULL),(958,58,0,946,NULL),(959,58,0,947,NULL),(960,58,0,948,NULL),(961,58,0,949,NULL),(962,58,0,950,NULL),(963,58,0,951,NULL),(964,58,0,952,NULL),(965,58,0,953,NULL),(966,58,0,954,NULL),(967,58,0,955,NULL),(968,58,0,956,NULL),(969,58,0,957,NULL),(970,58,0,958,NULL),(971,58,0,959,NULL),(972,58,0,960,NULL),(973,58,0,961,NULL),(974,58,0,962,NULL),(975,58,0,963,NULL),(976,58,0,964,NULL),(977,58,0,965,NULL),(978,58,0,966,NULL),(979,58,0,967,NULL),(980,58,0,968,NULL),(981,58,0,969,NULL),(982,58,0,970,NULL),(983,58,0,971,NULL),(984,58,0,972,NULL),(985,58,0,973,NULL),(986,58,0,974,NULL),(987,58,0,975,NULL),(988,58,0,976,NULL),(989,58,0,977,NULL),(990,58,0,978,NULL),(991,58,0,979,NULL),(992,58,0,980,NULL),(993,58,0,981,NULL),(994,58,0,982,NULL),(995,58,0,983,NULL),(996,58,0,984,NULL),(997,58,0,985,NULL),(998,58,0,986,NULL),(999,58,0,987,NULL),(1000,58,0,988,NULL),(1001,58,0,989,NULL),(1002,58,0,990,NULL),(1003,58,0,991,NULL),(1004,58,0,992,NULL),(1005,58,0,993,NULL),(1006,58,0,994,NULL),(1007,58,0,995,NULL),(1008,58,0,996,NULL),(1009,58,0,997,NULL),(1010,58,0,998,NULL),(1011,58,0,999,NULL),(1012,58,0,1000,NULL),(1013,58,0,1001,NULL),(1014,58,0,1002,NULL),(1015,58,0,1003,NULL),(1016,58,0,1004,NULL),(1017,58,0,1005,NULL),(1018,58,0,1006,NULL),(1019,58,0,1007,NULL),(1020,58,0,1008,NULL),(1021,58,0,1009,NULL),(1022,58,0,1010,NULL),(1023,58,0,1011,NULL),(1024,58,0,1012,NULL),(1025,58,0,1013,NULL),(1026,58,0,1014,NULL),(1027,58,0,1015,NULL),(1028,58,0,1016,NULL),(1029,58,0,1017,NULL),(1030,58,0,1018,NULL),(1031,58,0,1019,NULL),(1032,58,0,1020,NULL),(1033,58,0,1021,NULL),(1034,58,0,1022,NULL),(1035,58,0,1023,NULL),(1036,58,0,1024,NULL),(1037,58,0,1025,NULL),(1038,58,0,1026,NULL),(1039,58,0,1027,NULL),(1040,58,0,1028,NULL),(1041,58,0,1029,NULL),(1042,58,0,1030,NULL),(1043,58,0,1031,NULL),(1044,58,0,1032,NULL),(1045,58,0,1033,NULL),(1046,58,0,1034,NULL),(1047,58,0,1035,NULL),(1048,58,0,1036,NULL),(1049,58,0,1037,NULL),(1050,58,0,1038,NULL),(1051,58,0,1039,NULL),(1052,58,0,1040,NULL),(1053,58,0,1041,NULL),(1054,58,0,1042,NULL),(1055,58,0,1043,NULL),(1056,58,0,1044,NULL),(1057,58,0,1045,NULL),(1058,58,0,1046,NULL),(1059,58,0,1047,NULL),(1060,58,0,1048,NULL),(1061,58,0,1049,NULL),(1062,58,0,1050,NULL),(1063,58,0,1051,NULL),(1064,58,0,1052,NULL),(1065,58,0,1053,NULL),(1066,58,0,1054,NULL),(1067,58,0,1055,NULL),(1068,58,0,1056,NULL),(1069,58,0,1057,NULL),(1070,58,0,1058,NULL),(1071,58,0,1059,NULL),(1072,58,0,1060,NULL),(1073,58,0,1061,NULL),(1074,58,0,1062,NULL),(1075,58,0,1063,NULL),(1076,58,0,1064,NULL),(1077,58,0,1065,NULL),(1078,58,0,1066,NULL),(1079,58,0,1067,NULL),(1080,58,0,1068,NULL),(1081,58,0,1069,NULL),(1082,58,0,1070,NULL),(1083,58,0,1071,NULL),(1084,58,0,1072,NULL),(1085,58,0,1073,NULL),(1086,58,0,1074,NULL),(1087,58,0,1075,NULL),(1088,58,0,1076,NULL),(1089,58,0,1077,NULL),(1090,58,0,1078,NULL),(1091,58,0,1079,NULL),(1092,58,0,1080,NULL),(1093,58,0,1081,NULL),(1094,58,0,1082,NULL),(1095,58,0,1083,NULL),(1096,58,0,1084,NULL),(1097,58,0,1085,NULL),(1098,58,0,1086,NULL),(1099,58,0,1087,NULL),(1100,58,0,1088,NULL),(1101,58,0,1089,NULL),(1102,58,0,1090,NULL),(1103,58,0,1091,NULL),(1104,58,0,1092,NULL),(1105,58,0,1093,NULL),(1106,58,0,1094,NULL),(1107,58,0,1095,NULL),(1108,58,0,1096,NULL),(1109,58,0,1097,NULL),(1110,58,0,1098,NULL),(1111,58,0,1099,NULL),(1112,58,0,1100,NULL),(1113,58,0,1101,NULL),(1114,58,0,1102,NULL),(1115,58,0,1103,NULL),(1116,58,0,1104,NULL),(1117,58,0,1105,NULL),(1118,58,0,1106,NULL),(1119,58,0,1107,NULL),(1120,58,0,1108,NULL),(1121,58,0,1109,NULL),(1122,58,0,1110,NULL),(1123,58,0,1111,NULL),(1124,58,0,1112,NULL),(1125,58,0,1113,NULL),(1126,58,0,1114,NULL),(1127,58,0,1115,NULL),(1128,58,0,1116,NULL),(1129,58,0,1117,NULL),(1130,58,0,1118,NULL),(1131,58,0,1119,NULL),(1132,58,0,1120,NULL),(1133,58,0,1121,NULL),(1134,58,0,1122,NULL),(1135,58,0,1123,NULL),(1136,58,0,1124,NULL),(1137,58,0,1125,NULL),(1138,58,0,1126,NULL),(1139,58,0,1127,NULL),(1140,58,0,1128,NULL),(1141,58,0,1129,NULL),(1142,58,0,1130,NULL),(1143,58,0,1131,NULL),(1144,58,0,1132,NULL),(1145,58,0,1133,NULL),(1146,58,0,1134,NULL),(1147,58,0,1135,NULL),(1148,58,0,1136,NULL),(1149,58,0,1137,NULL),(1150,58,0,1138,NULL),(1151,58,0,1139,NULL),(1152,58,0,1140,NULL),(1153,58,0,1141,NULL),(1154,58,0,1142,NULL),(1155,58,0,1143,NULL),(1156,58,0,1144,NULL),(1157,58,0,1145,NULL),(1158,58,0,1146,NULL),(1159,58,0,1147,NULL),(1160,58,0,1148,NULL),(1161,58,0,1149,NULL),(1162,58,0,1150,NULL),(1163,58,0,1151,NULL),(1164,58,0,1152,NULL),(1165,58,0,1153,NULL),(1166,58,0,1154,NULL),(1167,58,0,1155,NULL),(1168,58,0,1156,NULL),(1169,58,0,1157,NULL),(1170,58,0,1158,NULL),(1171,58,0,1159,NULL),(1172,58,0,1160,NULL),(1173,58,0,1161,NULL),(1174,58,0,1162,NULL),(1175,58,0,1163,NULL),(1176,58,0,1164,NULL),(1177,58,0,1165,NULL),(1178,58,0,1166,NULL),(1179,58,0,1167,NULL),(1180,58,0,1168,NULL),(1181,58,0,1169,NULL),(1182,58,0,1170,NULL),(1183,58,0,1171,NULL),(1184,58,0,1172,NULL),(1185,58,0,1173,NULL),(1186,58,0,1174,NULL),(1187,58,0,1175,NULL),(1188,58,0,1176,NULL),(1189,58,0,1177,NULL),(1190,58,0,1178,NULL),(1191,58,0,1179,NULL),(1192,58,0,1180,NULL),(1193,58,0,1181,NULL),(1194,58,0,1182,NULL),(1195,58,0,1183,NULL),(1196,58,0,1184,NULL),(1197,58,0,1185,NULL),(1198,58,0,1186,NULL),(1199,58,0,1187,NULL),(1200,58,0,1188,NULL),(1201,58,0,1189,NULL),(1202,58,0,1190,NULL),(1203,58,0,1191,NULL),(1204,58,0,1192,NULL),(1205,58,0,1193,NULL),(1206,58,0,1194,NULL),(1207,58,0,1195,NULL),(1208,58,0,1196,NULL),(1209,58,0,1197,NULL),(1210,58,0,1198,NULL),(1211,58,0,1199,NULL),(1212,58,0,1200,NULL),(1213,58,0,1201,NULL),(1214,58,0,1202,NULL),(1215,58,0,1203,NULL),(1216,58,0,1204,NULL),(1217,58,0,1205,NULL),(1218,58,0,1206,NULL),(1219,58,0,1207,NULL),(1220,58,0,1208,NULL),(1221,58,0,1209,NULL),(1222,58,0,1210,NULL),(1223,58,0,1211,NULL),(1224,58,0,1212,NULL),(1225,58,0,1213,NULL),(1226,58,0,1214,NULL),(1227,58,0,1215,NULL),(1228,58,0,1216,NULL),(1229,58,0,1217,NULL),(1230,58,0,1218,NULL),(1231,58,0,1219,NULL),(1232,58,0,1220,NULL),(1233,58,0,1221,NULL),(1234,58,0,1222,NULL),(1235,58,0,1223,NULL),(1236,58,0,1224,NULL),(1237,58,0,1225,NULL),(1238,58,0,1226,NULL),(1239,58,0,1227,NULL),(1240,58,0,1228,NULL),(1241,58,0,1229,NULL),(1242,58,0,1230,NULL),(1243,58,0,1231,NULL),(1244,58,0,1232,NULL),(1245,58,0,1233,NULL),(1246,58,0,1234,NULL),(1247,58,0,1235,NULL),(1248,58,0,1236,NULL),(1249,58,0,1237,NULL),(1250,58,0,1238,NULL),(1251,58,0,1239,NULL),(1252,58,0,1240,NULL),(1253,58,0,1241,NULL),(1254,58,0,1242,NULL),(1255,58,0,1243,NULL),(1256,58,0,1244,NULL),(1257,58,0,1245,NULL),(1258,58,0,1246,NULL),(1259,58,0,1247,NULL),(1260,58,0,1248,NULL),(1261,58,0,1249,NULL),(1262,58,0,1250,NULL),(1263,58,0,1251,NULL),(1264,58,0,1252,NULL),(1265,58,0,1253,NULL),(1266,58,0,1254,NULL),(1267,58,0,1255,NULL),(1268,58,0,1256,NULL),(1269,58,0,1257,NULL),(1270,58,0,1258,NULL),(1271,58,0,1259,NULL),(1272,58,0,1260,NULL),(1273,58,0,1261,NULL),(1274,58,0,1262,NULL),(1275,58,0,1263,NULL),(1276,58,0,1264,NULL),(1277,58,0,1265,NULL),(1278,58,0,1266,NULL),(1279,58,0,1267,NULL),(1280,58,0,1268,NULL),(1281,58,0,1269,NULL),(1282,58,0,1270,NULL),(1283,58,0,1271,NULL),(1284,58,0,1272,NULL),(1285,58,0,1273,NULL),(1286,58,0,1274,NULL),(1287,58,0,1275,NULL),(1288,58,0,1276,NULL),(1289,58,0,1277,NULL),(1290,58,0,1278,NULL),(1291,58,0,1279,NULL),(1292,58,0,1280,NULL),(1293,58,0,1281,NULL),(1294,58,0,1282,NULL),(1295,58,0,1283,NULL),(1296,58,0,1284,NULL),(1297,58,0,1285,NULL),(1298,58,0,1286,NULL),(1299,58,0,1287,NULL),(1300,58,0,1288,NULL),(1301,58,0,1289,NULL),(1302,58,0,1290,NULL),(1303,58,0,1291,NULL),(1304,58,0,1292,NULL),(1305,58,0,1293,NULL),(1306,58,0,1294,NULL),(1307,58,0,1295,NULL),(1308,58,0,1296,NULL),(1309,58,0,1297,NULL),(1310,58,0,1298,NULL),(1311,58,0,1299,NULL),(1312,58,0,1300,NULL),(1313,58,0,1301,NULL),(1314,58,0,1302,NULL),(1315,58,0,1303,NULL),(1316,58,0,1304,NULL),(1317,58,0,1305,NULL),(1318,58,0,1306,NULL),(1319,58,0,1307,NULL),(1320,58,0,1308,NULL),(1321,58,0,1309,NULL),(1322,58,0,1310,NULL),(1323,58,0,1311,NULL),(1324,58,0,1312,NULL),(1325,58,0,1313,NULL),(1326,58,0,1314,NULL),(1327,58,0,1315,NULL),(1328,58,0,1316,NULL),(1329,58,0,1317,NULL),(1330,58,0,1318,NULL),(1331,58,0,1319,NULL),(1332,58,0,1320,NULL),(1333,58,0,1321,NULL),(1334,58,0,1322,NULL),(1335,58,0,1323,NULL),(1336,58,0,1324,NULL),(1337,58,0,1325,NULL),(1338,58,0,1326,NULL),(1339,58,0,1327,NULL),(1340,58,0,1328,NULL),(1341,58,0,1329,NULL),(1342,58,0,1330,NULL),(1343,58,0,1331,NULL),(1344,58,0,1332,NULL),(1345,58,0,1333,NULL),(1346,58,0,1334,NULL),(1347,58,0,1335,NULL),(1348,58,0,1336,NULL),(1349,58,0,1337,NULL),(1350,59,0,1337,NULL),(1351,58,0,1338,NULL),(1352,59,0,1338,NULL),(1353,59,0,887,NULL),(1363,58,0,1339,NULL),(1364,59,0,1339,NULL),(1371,58,0,1340,NULL),(1372,59,0,1340,NULL);
/*!40000 ALTER TABLE `grocery_bag_catalog_category_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_category_entity_decimal`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_category_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_DEC_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_category_entity_decimal`
--

LOCK TABLES `grocery_bag_catalog_category_entity_decimal` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_category_entity_decimal` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_category_entity_decimal` VALUES (13,69,0,1337,NULL),(14,69,0,1338,NULL),(15,69,0,887,NULL),(20,69,0,1339,NULL),(24,69,0,1340,NULL);
/*!40000 ALTER TABLE `grocery_bag_catalog_category_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_category_entity_int`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_category_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_INT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5426 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_category_entity_int`
--

LOCK TABLES `grocery_bag_catalog_category_entity_int` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_category_entity_int` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_category_entity_int` VALUES (1,66,0,1,1),(2,43,0,2,1),(3,66,0,2,1),(3552,43,0,884,1),(3553,66,0,884,1),(3556,43,0,885,1),(3557,66,0,885,1),(3560,43,0,886,1),(3561,66,0,886,1),(3564,43,0,887,1),(3565,66,0,887,1),(3568,43,0,888,1),(3569,66,0,888,1),(3572,43,0,889,1),(3573,66,0,889,1),(3576,43,0,890,1),(3577,66,0,890,1),(3580,43,0,891,1),(3581,66,0,891,1),(3584,43,0,892,1),(3585,66,0,892,1),(3588,43,0,893,1),(3589,66,0,893,1),(3592,43,0,894,1),(3593,66,0,894,1),(3596,43,0,895,1),(3597,66,0,895,1),(3600,43,0,896,1),(3601,66,0,896,1),(3604,43,0,897,1),(3605,66,0,897,1),(3608,43,0,898,1),(3609,66,0,898,1),(3612,43,0,899,1),(3613,66,0,899,1),(3616,43,0,900,1),(3617,66,0,900,1),(3620,43,0,901,1),(3621,66,0,901,1),(3624,43,0,902,1),(3625,66,0,902,1),(3628,43,0,903,1),(3629,66,0,903,1),(3632,43,0,904,1),(3633,66,0,904,1),(3636,43,0,905,1),(3637,66,0,905,1),(3640,43,0,906,1),(3641,66,0,906,1),(3644,43,0,907,1),(3645,66,0,907,1),(3648,43,0,908,1),(3649,66,0,908,1),(3652,43,0,909,1),(3653,66,0,909,1),(3656,43,0,910,1),(3657,66,0,910,1),(3660,43,0,911,1),(3661,66,0,911,1),(3664,43,0,912,1),(3665,66,0,912,1),(3668,43,0,913,1),(3669,66,0,913,1),(3672,43,0,914,1),(3673,66,0,914,1),(3676,43,0,915,1),(3677,66,0,915,1),(3680,43,0,916,1),(3681,66,0,916,1),(3684,43,0,917,1),(3685,66,0,917,1),(3688,43,0,918,1),(3689,66,0,918,1),(3692,43,0,919,1),(3693,66,0,919,1),(3696,43,0,920,1),(3697,66,0,920,1),(3700,43,0,921,1),(3701,66,0,921,1),(3704,43,0,922,1),(3705,66,0,922,1),(3708,43,0,923,1),(3709,66,0,923,1),(3712,43,0,924,1),(3713,66,0,924,1),(3716,43,0,925,1),(3717,66,0,925,1),(3720,43,0,926,1),(3721,66,0,926,1),(3724,43,0,927,1),(3725,66,0,927,1),(3728,43,0,928,1),(3729,66,0,928,1),(3732,43,0,929,1),(3733,66,0,929,1),(3736,43,0,930,1),(3737,66,0,930,1),(3740,43,0,931,1),(3741,66,0,931,1),(3744,43,0,932,1),(3745,66,0,932,1),(3748,43,0,933,1),(3749,66,0,933,1),(3752,43,0,934,1),(3753,66,0,934,1),(3756,43,0,935,1),(3757,66,0,935,1),(3760,43,0,936,1),(3761,66,0,936,1),(3764,43,0,937,1),(3765,66,0,937,1),(3768,43,0,938,1),(3769,66,0,938,1),(3772,43,0,939,1),(3773,66,0,939,1),(3776,43,0,940,1),(3777,66,0,940,1),(3780,43,0,941,1),(3781,66,0,941,1),(3784,43,0,942,1),(3785,66,0,942,1),(3788,43,0,943,1),(3789,66,0,943,1),(3792,43,0,944,1),(3793,66,0,944,1),(3796,43,0,945,1),(3797,66,0,945,1),(3800,43,0,946,1),(3801,66,0,946,1),(3804,43,0,947,1),(3805,66,0,947,1),(3808,43,0,948,1),(3809,66,0,948,1),(3812,43,0,949,1),(3813,66,0,949,1),(3816,43,0,950,1),(3817,66,0,950,1),(3820,43,0,951,1),(3821,66,0,951,1),(3824,43,0,952,1),(3825,66,0,952,1),(3828,43,0,953,1),(3829,66,0,953,1),(3832,43,0,954,1),(3833,66,0,954,1),(3836,43,0,955,1),(3837,66,0,955,1),(3840,43,0,956,1),(3841,66,0,956,1),(3844,43,0,957,1),(3845,66,0,957,1),(3848,43,0,958,1),(3849,66,0,958,1),(3852,43,0,959,1),(3853,66,0,959,1),(3856,43,0,960,1),(3857,66,0,960,1),(3860,43,0,961,1),(3861,66,0,961,1),(3864,43,0,962,1),(3865,66,0,962,1),(3868,43,0,963,1),(3869,66,0,963,1),(3872,43,0,964,1),(3873,66,0,964,1),(3876,43,0,965,1),(3877,66,0,965,1),(3880,43,0,966,1),(3881,66,0,966,1),(3884,43,0,967,1),(3885,66,0,967,1),(3888,43,0,968,1),(3889,66,0,968,1),(3892,43,0,969,1),(3893,66,0,969,1),(3896,43,0,970,1),(3897,66,0,970,1),(3900,43,0,971,1),(3901,66,0,971,1),(3904,43,0,972,1),(3905,66,0,972,1),(3908,43,0,973,1),(3909,66,0,973,1),(3912,43,0,974,1),(3913,66,0,974,1),(3916,43,0,975,1),(3917,66,0,975,1),(3920,43,0,976,1),(3921,66,0,976,1),(3924,43,0,977,1),(3925,66,0,977,1),(3928,43,0,978,1),(3929,66,0,978,1),(3932,43,0,979,1),(3933,66,0,979,1),(3936,43,0,980,1),(3937,66,0,980,1),(3940,43,0,981,1),(3941,66,0,981,1),(3944,43,0,982,1),(3945,66,0,982,1),(3948,43,0,983,1),(3949,66,0,983,1),(3952,43,0,984,1),(3953,66,0,984,1),(3956,43,0,985,1),(3957,66,0,985,1),(3960,43,0,986,1),(3961,66,0,986,1),(3964,43,0,987,1),(3965,66,0,987,1),(3968,43,0,988,1),(3969,66,0,988,1),(3972,43,0,989,1),(3973,66,0,989,1),(3976,43,0,990,1),(3977,66,0,990,1),(3980,43,0,991,1),(3981,66,0,991,1),(3984,43,0,992,1),(3985,66,0,992,1),(3988,43,0,993,1),(3989,66,0,993,1),(3992,43,0,994,1),(3993,66,0,994,1),(3996,43,0,995,1),(3997,66,0,995,1),(4000,43,0,996,1),(4001,66,0,996,1),(4004,43,0,997,1),(4005,66,0,997,1),(4008,43,0,998,1),(4009,66,0,998,1),(4012,43,0,999,1),(4013,66,0,999,1),(4016,43,0,1000,1),(4017,66,0,1000,1),(4020,43,0,1001,1),(4021,66,0,1001,1),(4024,43,0,1002,1),(4025,66,0,1002,1),(4028,43,0,1003,1),(4029,66,0,1003,1),(4032,43,0,1004,1),(4033,66,0,1004,1),(4036,43,0,1005,1),(4037,66,0,1005,1),(4040,43,0,1006,1),(4041,66,0,1006,1),(4044,43,0,1007,1),(4045,66,0,1007,1),(4048,43,0,1008,1),(4049,66,0,1008,1),(4052,43,0,1009,1),(4053,66,0,1009,1),(4056,43,0,1010,1),(4057,66,0,1010,1),(4060,43,0,1011,1),(4061,66,0,1011,1),(4064,43,0,1012,1),(4065,66,0,1012,1),(4068,43,0,1013,1),(4069,66,0,1013,1),(4072,43,0,1014,1),(4073,66,0,1014,1),(4076,43,0,1015,1),(4077,66,0,1015,1),(4080,43,0,1016,1),(4081,66,0,1016,1),(4084,43,0,1017,1),(4085,66,0,1017,1),(4088,43,0,1018,1),(4089,66,0,1018,1),(4092,43,0,1019,1),(4093,66,0,1019,1),(4096,43,0,1020,1),(4097,66,0,1020,1),(4100,43,0,1021,1),(4101,66,0,1021,1),(4104,43,0,1022,1),(4105,66,0,1022,1),(4108,43,0,1023,1),(4109,66,0,1023,1),(4112,43,0,1024,1),(4113,66,0,1024,1),(4116,43,0,1025,1),(4117,66,0,1025,1),(4120,43,0,1026,1),(4121,66,0,1026,1),(4124,43,0,1027,1),(4125,66,0,1027,1),(4128,43,0,1028,1),(4129,66,0,1028,1),(4132,43,0,1029,1),(4133,66,0,1029,1),(4136,43,0,1030,1),(4137,66,0,1030,1),(4140,43,0,1031,1),(4141,66,0,1031,1),(4144,43,0,1032,1),(4145,66,0,1032,1),(4148,43,0,1033,1),(4149,66,0,1033,1),(4152,43,0,1034,1),(4153,66,0,1034,1),(4156,43,0,1035,1),(4157,66,0,1035,1),(4160,43,0,1036,1),(4161,66,0,1036,1),(4164,43,0,1037,1),(4165,66,0,1037,1),(4168,43,0,1038,1),(4169,66,0,1038,1),(4172,43,0,1039,1),(4173,66,0,1039,1),(4176,43,0,1040,1),(4177,66,0,1040,1),(4180,43,0,1041,1),(4181,66,0,1041,1),(4184,43,0,1042,1),(4185,66,0,1042,1),(4188,43,0,1043,1),(4189,66,0,1043,1),(4192,43,0,1044,1),(4193,66,0,1044,1),(4196,43,0,1045,1),(4197,66,0,1045,1),(4200,43,0,1046,1),(4201,66,0,1046,1),(4204,43,0,1047,1),(4205,66,0,1047,1),(4208,43,0,1048,1),(4209,66,0,1048,1),(4212,43,0,1049,1),(4213,66,0,1049,1),(4216,43,0,1050,1),(4217,66,0,1050,1),(4220,43,0,1051,1),(4221,66,0,1051,1),(4224,43,0,1052,1),(4225,66,0,1052,1),(4228,43,0,1053,1),(4229,66,0,1053,1),(4232,43,0,1054,1),(4233,66,0,1054,1),(4236,43,0,1055,1),(4237,66,0,1055,1),(4240,43,0,1056,1),(4241,66,0,1056,1),(4244,43,0,1057,1),(4245,66,0,1057,1),(4248,43,0,1058,1),(4249,66,0,1058,1),(4252,43,0,1059,1),(4253,66,0,1059,1),(4256,43,0,1060,1),(4257,66,0,1060,1),(4260,43,0,1061,1),(4261,66,0,1061,1),(4264,43,0,1062,1),(4265,66,0,1062,1),(4268,43,0,1063,1),(4269,66,0,1063,1),(4272,43,0,1064,1),(4273,66,0,1064,1),(4276,43,0,1065,1),(4277,66,0,1065,1),(4280,43,0,1066,1),(4281,66,0,1066,1),(4284,43,0,1067,1),(4285,66,0,1067,1),(4288,43,0,1068,1),(4289,66,0,1068,1),(4292,43,0,1069,1),(4293,66,0,1069,1),(4296,43,0,1070,1),(4297,66,0,1070,1),(4300,43,0,1071,1),(4301,66,0,1071,1),(4304,43,0,1072,1),(4305,66,0,1072,1),(4308,43,0,1073,1),(4309,66,0,1073,1),(4312,43,0,1074,1),(4313,66,0,1074,1),(4316,43,0,1075,1),(4317,66,0,1075,1),(4320,43,0,1076,1),(4321,66,0,1076,1),(4324,43,0,1077,1),(4325,66,0,1077,1),(4328,43,0,1078,1),(4329,66,0,1078,1),(4332,43,0,1079,1),(4333,66,0,1079,1),(4336,43,0,1080,1),(4337,66,0,1080,1),(4340,43,0,1081,1),(4341,66,0,1081,1),(4344,43,0,1082,1),(4345,66,0,1082,1),(4348,43,0,1083,1),(4349,66,0,1083,1),(4352,43,0,1084,1),(4353,66,0,1084,1),(4356,43,0,1085,1),(4357,66,0,1085,1),(4360,43,0,1086,1),(4361,66,0,1086,1),(4364,43,0,1087,1),(4365,66,0,1087,1),(4368,43,0,1088,1),(4369,66,0,1088,1),(4372,43,0,1089,1),(4373,66,0,1089,1),(4376,43,0,1090,1),(4377,66,0,1090,1),(4380,43,0,1091,1),(4381,66,0,1091,1),(4384,43,0,1092,1),(4385,66,0,1092,1),(4388,43,0,1093,1),(4389,66,0,1093,1),(4392,43,0,1094,1),(4393,66,0,1094,1),(4396,43,0,1095,1),(4397,66,0,1095,1),(4400,43,0,1096,1),(4401,66,0,1096,1),(4404,43,0,1097,1),(4405,66,0,1097,1),(4408,43,0,1098,1),(4409,66,0,1098,1),(4412,43,0,1099,1),(4413,66,0,1099,1),(4416,43,0,1100,1),(4417,66,0,1100,1),(4420,43,0,1101,1),(4421,66,0,1101,1),(4424,43,0,1102,1),(4425,66,0,1102,1),(4428,43,0,1103,1),(4429,66,0,1103,1),(4432,43,0,1104,1),(4433,66,0,1104,1),(4436,43,0,1105,1),(4437,66,0,1105,1),(4440,43,0,1106,1),(4441,66,0,1106,1),(4444,43,0,1107,1),(4445,66,0,1107,1),(4448,43,0,1108,1),(4449,66,0,1108,1),(4452,43,0,1109,1),(4453,66,0,1109,1),(4456,43,0,1110,1),(4457,66,0,1110,1),(4460,43,0,1111,1),(4461,66,0,1111,1),(4464,43,0,1112,1),(4465,66,0,1112,1),(4468,43,0,1113,1),(4469,66,0,1113,1),(4472,43,0,1114,1),(4473,66,0,1114,1),(4476,43,0,1115,1),(4477,66,0,1115,1),(4480,43,0,1116,1),(4481,66,0,1116,1),(4484,43,0,1117,1),(4485,66,0,1117,1),(4488,43,0,1118,1),(4489,66,0,1118,1),(4492,43,0,1119,1),(4493,66,0,1119,1),(4496,43,0,1120,1),(4497,66,0,1120,1),(4500,43,0,1121,1),(4501,66,0,1121,1),(4504,43,0,1122,1),(4505,66,0,1122,1),(4508,43,0,1123,1),(4509,66,0,1123,1),(4512,43,0,1124,1),(4513,66,0,1124,1),(4516,43,0,1125,1),(4517,66,0,1125,1),(4520,43,0,1126,1),(4521,66,0,1126,1),(4524,43,0,1127,1),(4525,66,0,1127,1),(4528,43,0,1128,1),(4529,66,0,1128,1),(4532,43,0,1129,1),(4533,66,0,1129,1),(4536,43,0,1130,1),(4537,66,0,1130,1),(4540,43,0,1131,1),(4541,66,0,1131,1),(4544,43,0,1132,1),(4545,66,0,1132,1),(4548,43,0,1133,1),(4549,66,0,1133,1),(4552,43,0,1134,1),(4553,66,0,1134,1),(4556,43,0,1135,1),(4557,66,0,1135,1),(4560,43,0,1136,1),(4561,66,0,1136,1),(4564,43,0,1137,1),(4565,66,0,1137,1),(4568,43,0,1138,1),(4569,66,0,1138,1),(4572,43,0,1139,1),(4573,66,0,1139,1),(4576,43,0,1140,1),(4577,66,0,1140,1),(4580,43,0,1141,1),(4581,66,0,1141,1),(4584,43,0,1142,1),(4585,66,0,1142,1),(4588,43,0,1143,1),(4589,66,0,1143,1),(4592,43,0,1144,1),(4593,66,0,1144,1),(4596,43,0,1145,1),(4597,66,0,1145,1),(4600,43,0,1146,1),(4601,66,0,1146,1),(4604,43,0,1147,1),(4605,66,0,1147,1),(4608,43,0,1148,1),(4609,66,0,1148,1),(4612,43,0,1149,1),(4613,66,0,1149,1),(4616,43,0,1150,1),(4617,66,0,1150,1),(4620,43,0,1151,1),(4621,66,0,1151,1),(4624,43,0,1152,1),(4625,66,0,1152,1),(4628,43,0,1153,1),(4629,66,0,1153,1),(4632,43,0,1154,1),(4633,66,0,1154,1),(4636,43,0,1155,1),(4637,66,0,1155,1),(4640,43,0,1156,1),(4641,66,0,1156,1),(4644,43,0,1157,1),(4645,66,0,1157,1),(4648,43,0,1158,1),(4649,66,0,1158,1),(4652,43,0,1159,1),(4653,66,0,1159,1),(4656,43,0,1160,1),(4657,66,0,1160,1),(4660,43,0,1161,1),(4661,66,0,1161,1),(4664,43,0,1162,1),(4665,66,0,1162,1),(4668,43,0,1163,1),(4669,66,0,1163,1),(4672,43,0,1164,1),(4673,66,0,1164,1),(4676,43,0,1165,1),(4677,66,0,1165,1),(4680,43,0,1166,1),(4681,66,0,1166,1),(4684,43,0,1167,1),(4685,66,0,1167,1),(4688,43,0,1168,1),(4689,66,0,1168,1),(4692,43,0,1169,1),(4693,66,0,1169,1),(4696,43,0,1170,1),(4697,66,0,1170,1),(4700,43,0,1171,1),(4701,66,0,1171,1),(4704,43,0,1172,1),(4705,66,0,1172,1),(4708,43,0,1173,1),(4709,66,0,1173,1),(4712,43,0,1174,1),(4713,66,0,1174,1),(4716,43,0,1175,1),(4717,66,0,1175,1),(4720,43,0,1176,1),(4721,66,0,1176,1),(4724,43,0,1177,1),(4725,66,0,1177,1),(4728,43,0,1178,1),(4729,66,0,1178,1),(4732,43,0,1179,1),(4733,66,0,1179,1),(4736,43,0,1180,1),(4737,66,0,1180,1),(4740,43,0,1181,1),(4741,66,0,1181,1),(4744,43,0,1182,1),(4745,66,0,1182,1),(4748,43,0,1183,1),(4749,66,0,1183,1),(4752,43,0,1184,1),(4753,66,0,1184,1),(4756,43,0,1185,1),(4757,66,0,1185,1),(4760,43,0,1186,1),(4761,66,0,1186,1),(4764,43,0,1187,1),(4765,66,0,1187,1),(4768,43,0,1188,1),(4769,66,0,1188,1),(4772,43,0,1189,1),(4773,66,0,1189,1),(4776,43,0,1190,1),(4777,66,0,1190,1),(4780,43,0,1191,1),(4781,66,0,1191,1),(4784,43,0,1192,1),(4785,66,0,1192,1),(4788,43,0,1193,1),(4789,66,0,1193,1),(4792,43,0,1194,1),(4793,66,0,1194,1),(4796,43,0,1195,1),(4797,66,0,1195,1),(4800,43,0,1196,1),(4801,66,0,1196,1),(4804,43,0,1197,1),(4805,66,0,1197,1),(4808,43,0,1198,1),(4809,66,0,1198,1),(4812,43,0,1199,1),(4813,66,0,1199,1),(4816,43,0,1200,1),(4817,66,0,1200,1),(4820,43,0,1201,1),(4821,66,0,1201,1),(4824,43,0,1202,1),(4825,66,0,1202,1),(4828,43,0,1203,1),(4829,66,0,1203,1),(4832,43,0,1204,1),(4833,66,0,1204,1),(4836,43,0,1205,1),(4837,66,0,1205,1),(4840,43,0,1206,1),(4841,66,0,1206,1),(4844,43,0,1207,1),(4845,66,0,1207,1),(4848,43,0,1208,1),(4849,66,0,1208,1),(4852,43,0,1209,1),(4853,66,0,1209,1),(4856,43,0,1210,1),(4857,66,0,1210,1),(4860,43,0,1211,1),(4861,66,0,1211,1),(4864,43,0,1212,1),(4865,66,0,1212,1),(4868,43,0,1213,1),(4869,66,0,1213,1),(4872,43,0,1214,1),(4873,66,0,1214,1),(4876,43,0,1215,1),(4877,66,0,1215,1),(4880,43,0,1216,1),(4881,66,0,1216,1),(4884,43,0,1217,1),(4885,66,0,1217,1),(4888,43,0,1218,1),(4889,66,0,1218,1),(4892,43,0,1219,1),(4893,66,0,1219,1),(4896,43,0,1220,1),(4897,66,0,1220,1),(4900,43,0,1221,1),(4901,66,0,1221,1),(4904,43,0,1222,1),(4905,66,0,1222,1),(4908,43,0,1223,1),(4909,66,0,1223,1),(4912,43,0,1224,1),(4913,66,0,1224,1),(4916,43,0,1225,1),(4917,66,0,1225,1),(4920,43,0,1226,1),(4921,66,0,1226,1),(4924,43,0,1227,1),(4925,66,0,1227,1),(4928,43,0,1228,1),(4929,66,0,1228,1),(4932,43,0,1229,1),(4933,66,0,1229,1),(4936,43,0,1230,1),(4937,66,0,1230,1),(4940,43,0,1231,1),(4941,66,0,1231,1),(4944,43,0,1232,1),(4945,66,0,1232,1),(4948,43,0,1233,1),(4949,66,0,1233,1),(4952,43,0,1234,1),(4953,66,0,1234,1),(4956,43,0,1235,1),(4957,66,0,1235,1),(4960,43,0,1236,1),(4961,66,0,1236,1),(4964,43,0,1237,1),(4965,66,0,1237,1),(4968,43,0,1238,1),(4969,66,0,1238,1),(4972,43,0,1239,1),(4973,66,0,1239,1),(4976,43,0,1240,1),(4977,66,0,1240,1),(4980,43,0,1241,1),(4981,66,0,1241,1),(4984,43,0,1242,1),(4985,66,0,1242,1),(4988,43,0,1243,1),(4989,66,0,1243,1),(4992,43,0,1244,1),(4993,66,0,1244,1),(4996,43,0,1245,1),(4997,66,0,1245,1),(5000,43,0,1246,1),(5001,66,0,1246,1),(5004,43,0,1247,1),(5005,66,0,1247,1),(5008,43,0,1248,1),(5009,66,0,1248,1),(5012,43,0,1249,1),(5013,66,0,1249,1),(5016,43,0,1250,1),(5017,66,0,1250,1),(5020,43,0,1251,1),(5021,66,0,1251,1),(5024,43,0,1252,1),(5025,66,0,1252,1),(5028,43,0,1253,1),(5029,66,0,1253,1),(5032,43,0,1254,1),(5033,66,0,1254,1),(5036,43,0,1255,1),(5037,66,0,1255,1),(5040,43,0,1256,1),(5041,66,0,1256,1),(5044,43,0,1257,1),(5045,66,0,1257,1),(5048,43,0,1258,1),(5049,66,0,1258,1),(5052,43,0,1259,1),(5053,66,0,1259,1),(5056,43,0,1260,1),(5057,66,0,1260,1),(5060,43,0,1261,1),(5061,66,0,1261,1),(5064,43,0,1262,1),(5065,66,0,1262,1),(5068,43,0,1263,1),(5069,66,0,1263,1),(5072,43,0,1264,1),(5073,66,0,1264,1),(5076,43,0,1265,1),(5077,66,0,1265,1),(5080,43,0,1266,1),(5081,66,0,1266,1),(5084,43,0,1267,1),(5085,66,0,1267,1),(5088,43,0,1268,1),(5089,66,0,1268,1),(5092,43,0,1269,1),(5093,66,0,1269,1),(5096,43,0,1270,1),(5097,66,0,1270,1),(5100,43,0,1271,1),(5101,66,0,1271,1),(5104,43,0,1272,1),(5105,66,0,1272,1),(5108,43,0,1273,1),(5109,66,0,1273,1),(5112,43,0,1274,1),(5113,66,0,1274,1),(5116,43,0,1275,1),(5117,66,0,1275,1),(5120,43,0,1276,1),(5121,66,0,1276,1),(5124,43,0,1277,1),(5125,66,0,1277,1),(5128,43,0,1278,1),(5129,66,0,1278,1),(5132,43,0,1279,1),(5133,66,0,1279,1),(5136,43,0,1280,1),(5137,66,0,1280,1),(5140,43,0,1281,1),(5141,66,0,1281,1),(5144,43,0,1282,1),(5145,66,0,1282,1),(5148,43,0,1283,1),(5149,66,0,1283,1),(5152,43,0,1284,1),(5153,66,0,1284,1),(5156,43,0,1285,1),(5157,66,0,1285,1),(5160,43,0,1286,1),(5161,66,0,1286,1),(5164,43,0,1287,1),(5165,66,0,1287,1),(5168,43,0,1288,1),(5169,66,0,1288,1),(5172,43,0,1289,1),(5173,66,0,1289,1),(5176,43,0,1290,1),(5177,66,0,1290,1),(5180,43,0,1291,1),(5181,66,0,1291,1),(5184,43,0,1292,1),(5185,66,0,1292,1),(5188,43,0,1293,1),(5189,66,0,1293,1),(5192,43,0,1294,1),(5193,66,0,1294,1),(5196,43,0,1295,1),(5197,66,0,1295,1),(5200,43,0,1296,1),(5201,66,0,1296,1),(5204,43,0,1297,1),(5205,66,0,1297,1),(5208,43,0,1298,1),(5209,66,0,1298,1),(5212,43,0,1299,1),(5213,66,0,1299,1),(5216,43,0,1300,1),(5217,66,0,1300,1),(5220,43,0,1301,1),(5221,66,0,1301,1),(5224,43,0,1302,1),(5225,66,0,1302,1),(5228,43,0,1303,1),(5229,66,0,1303,1),(5232,43,0,1304,1),(5233,66,0,1304,1),(5236,43,0,1305,1),(5237,66,0,1305,1),(5240,43,0,1306,1),(5241,66,0,1306,1),(5244,43,0,1307,1),(5245,66,0,1307,1),(5248,43,0,1308,1),(5249,66,0,1308,1),(5252,43,0,1309,1),(5253,66,0,1309,1),(5256,43,0,1310,1),(5257,66,0,1310,1),(5260,43,0,1311,1),(5261,66,0,1311,1),(5264,43,0,1312,1),(5265,66,0,1312,1),(5268,43,0,1313,1),(5269,66,0,1313,1),(5272,43,0,1314,1),(5273,66,0,1314,1),(5276,43,0,1315,1),(5277,66,0,1315,1),(5280,43,0,1316,1),(5281,66,0,1316,1),(5284,43,0,1317,1),(5285,66,0,1317,1),(5288,43,0,1318,1),(5289,66,0,1318,1),(5292,43,0,1319,1),(5293,66,0,1319,1),(5296,43,0,1320,1),(5297,66,0,1320,1),(5300,43,0,1321,1),(5301,66,0,1321,1),(5304,43,0,1322,1),(5305,66,0,1322,1),(5308,43,0,1323,1),(5309,66,0,1323,1),(5312,43,0,1324,1),(5313,66,0,1324,1),(5316,43,0,1325,1),(5317,66,0,1325,1),(5320,43,0,1326,1),(5321,66,0,1326,1),(5324,43,0,1327,1),(5325,66,0,1327,1),(5328,43,0,1328,1),(5329,66,0,1328,1),(5332,43,0,1329,1),(5333,66,0,1329,1),(5336,43,0,1330,1),(5337,66,0,1330,1),(5340,43,0,1331,1),(5341,66,0,1331,1),(5344,43,0,1332,1),(5345,66,0,1332,1),(5348,43,0,1333,1),(5349,66,0,1333,1),(5352,43,0,1334,1),(5353,66,0,1334,1),(5356,43,0,1335,1),(5357,66,0,1335,1),(5360,43,0,1336,1),(5361,66,0,1336,1),(5364,43,0,1337,1),(5365,66,0,1337,1),(5366,50,0,1337,NULL),(5367,51,0,1337,0),(5368,67,0,1337,0),(5369,68,0,1337,0),(5370,43,0,1338,1),(5371,66,0,1338,1),(5372,50,0,1338,NULL),(5373,51,0,1338,0),(5374,67,0,1338,0),(5375,68,0,1338,0),(5376,50,0,887,NULL),(5377,51,0,887,0),(5378,67,0,887,0),(5379,68,0,887,0),(5396,43,0,1339,1),(5397,66,0,1339,1),(5398,50,0,1339,NULL),(5399,51,0,1339,0),(5400,67,0,1339,0),(5401,68,0,1339,0),(5414,43,0,1340,1),(5415,66,0,1340,1),(5416,50,0,1340,NULL),(5417,51,0,1340,0),(5418,67,0,1340,0),(5419,68,0,1340,0);
/*!40000 ALTER TABLE `grocery_bag_catalog_category_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_category_entity_text`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_category_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_category_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_TEXT_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3957 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Text Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_category_entity_text`
--

LOCK TABLES `grocery_bag_catalog_category_entity_text` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_category_entity_text` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_category_entity_text` VALUES (1,64,0,1,NULL),(2,64,0,2,NULL),(1801,64,0,884,NULL),(1803,64,0,885,NULL),(1805,64,0,886,NULL),(1807,64,0,887,NULL),(1809,64,0,888,NULL),(1811,64,0,889,NULL),(1813,64,0,890,NULL),(1815,64,0,891,NULL),(1817,64,0,892,NULL),(1819,64,0,893,NULL),(1821,64,0,894,NULL),(1823,64,0,895,NULL),(1825,64,0,896,NULL),(1827,64,0,897,NULL),(1829,64,0,898,NULL),(1831,64,0,899,NULL),(1833,64,0,900,NULL),(1835,64,0,901,NULL),(1837,64,0,902,NULL),(1839,64,0,903,NULL),(1841,64,0,904,NULL),(1843,64,0,905,NULL),(1845,64,0,906,NULL),(1847,64,0,907,NULL),(1849,64,0,908,NULL),(1851,64,0,909,NULL),(1853,64,0,910,NULL),(1855,64,0,911,NULL),(1857,64,0,912,NULL),(1859,64,0,913,NULL),(1861,64,0,914,NULL),(1863,64,0,915,NULL),(1865,64,0,916,NULL),(1867,64,0,917,NULL),(1869,64,0,918,NULL),(1871,64,0,919,NULL),(1873,64,0,920,NULL),(1875,64,0,921,NULL),(1877,64,0,922,NULL),(1879,64,0,923,NULL),(1881,64,0,924,NULL),(1883,64,0,925,NULL),(1885,64,0,926,NULL),(1887,64,0,927,NULL),(1889,64,0,928,NULL),(1891,64,0,929,NULL),(1893,64,0,930,NULL),(1895,64,0,931,NULL),(1897,64,0,932,NULL),(1899,64,0,933,NULL),(1901,64,0,934,NULL),(1903,64,0,935,NULL),(1905,64,0,936,NULL),(1907,64,0,937,NULL),(1909,64,0,938,NULL),(1911,64,0,939,NULL),(1913,64,0,940,NULL),(1915,64,0,941,NULL),(1917,64,0,942,NULL),(1919,64,0,943,NULL),(1921,64,0,944,NULL),(1923,64,0,945,NULL),(1925,64,0,946,NULL),(1927,64,0,947,NULL),(1929,64,0,948,NULL),(1931,64,0,949,NULL),(1933,64,0,950,NULL),(1935,64,0,951,NULL),(1937,64,0,952,NULL),(1939,64,0,953,NULL),(1941,64,0,954,NULL),(1943,64,0,955,NULL),(1945,64,0,956,NULL),(1947,64,0,957,NULL),(1949,64,0,958,NULL),(1951,64,0,959,NULL),(1953,64,0,960,NULL),(1955,64,0,961,NULL),(1957,64,0,962,NULL),(1959,64,0,963,NULL),(1961,64,0,964,NULL),(1963,64,0,965,NULL),(1965,64,0,966,NULL),(1967,64,0,967,NULL),(1969,64,0,968,NULL),(1971,64,0,969,NULL),(1973,64,0,970,NULL),(1975,64,0,971,NULL),(1977,64,0,972,NULL),(1979,64,0,973,NULL),(1981,64,0,974,NULL),(1983,64,0,975,NULL),(1985,64,0,976,NULL),(1987,64,0,977,NULL),(1989,64,0,978,NULL),(1991,64,0,979,NULL),(1993,64,0,980,NULL),(1995,64,0,981,NULL),(1997,64,0,982,NULL),(1999,64,0,983,NULL),(2001,64,0,984,NULL),(2003,64,0,985,NULL),(2005,64,0,986,NULL),(2007,64,0,987,NULL),(2009,64,0,988,NULL),(2011,64,0,989,NULL),(2013,64,0,990,NULL),(2015,64,0,991,NULL),(2017,64,0,992,NULL),(2019,64,0,993,NULL),(2021,64,0,994,NULL),(2023,64,0,995,NULL),(2025,64,0,996,NULL),(2027,64,0,997,NULL),(2029,64,0,998,NULL),(2031,64,0,999,NULL),(2033,64,0,1000,NULL),(2035,64,0,1001,NULL),(2037,64,0,1002,NULL),(2039,64,0,1003,NULL),(2041,64,0,1004,NULL),(2043,64,0,1005,NULL),(2045,64,0,1006,NULL),(2047,64,0,1007,NULL),(2049,64,0,1008,NULL),(2051,64,0,1009,NULL),(2053,64,0,1010,NULL),(2055,64,0,1011,NULL),(2057,64,0,1012,NULL),(2059,64,0,1013,NULL),(2061,64,0,1014,NULL),(2063,64,0,1015,NULL),(2065,64,0,1016,NULL),(2067,64,0,1017,NULL),(2069,64,0,1018,NULL),(2071,64,0,1019,NULL),(2073,64,0,1020,NULL),(2075,64,0,1021,NULL),(2077,64,0,1022,NULL),(2079,64,0,1023,NULL),(2081,64,0,1024,NULL),(2083,64,0,1025,NULL),(2085,64,0,1026,NULL),(2087,64,0,1027,NULL),(2089,64,0,1028,NULL),(2091,64,0,1029,NULL),(2093,64,0,1030,NULL),(2095,64,0,1031,NULL),(2097,64,0,1032,NULL),(2099,64,0,1033,NULL),(2101,64,0,1034,NULL),(2103,64,0,1035,NULL),(2105,64,0,1036,NULL),(2107,64,0,1037,NULL),(2109,64,0,1038,NULL),(2111,64,0,1039,NULL),(2113,64,0,1040,NULL),(2115,64,0,1041,NULL),(2117,64,0,1042,NULL),(2119,64,0,1043,NULL),(2121,64,0,1044,NULL),(2123,64,0,1045,NULL),(2125,64,0,1046,NULL),(2127,64,0,1047,NULL),(2129,64,0,1048,NULL),(2131,64,0,1049,NULL),(2133,64,0,1050,NULL),(2135,64,0,1051,NULL),(2137,64,0,1052,NULL),(2139,64,0,1053,NULL),(2141,64,0,1054,NULL),(2143,64,0,1055,NULL),(2145,64,0,1056,NULL),(2147,64,0,1057,NULL),(2149,64,0,1058,NULL),(2151,64,0,1059,NULL),(2153,64,0,1060,NULL),(2155,64,0,1061,NULL),(2157,64,0,1062,NULL),(2159,64,0,1063,NULL),(2161,64,0,1064,NULL),(2163,64,0,1065,NULL),(2165,64,0,1066,NULL),(2167,64,0,1067,NULL),(2169,64,0,1068,NULL),(2171,64,0,1069,NULL),(2173,64,0,1070,NULL),(2175,64,0,1071,NULL),(2177,64,0,1072,NULL),(2179,64,0,1073,NULL),(2181,64,0,1074,NULL),(2183,64,0,1075,NULL),(2185,64,0,1076,NULL),(2187,64,0,1077,NULL),(2189,64,0,1078,NULL),(2191,64,0,1079,NULL),(2193,64,0,1080,NULL),(2195,64,0,1081,NULL),(2197,64,0,1082,NULL),(2199,64,0,1083,NULL),(2201,64,0,1084,NULL),(2203,64,0,1085,NULL),(2205,64,0,1086,NULL),(2207,64,0,1087,NULL),(2209,64,0,1088,NULL),(2211,64,0,1089,NULL),(2213,64,0,1090,NULL),(2215,64,0,1091,NULL),(2217,64,0,1092,NULL),(2219,64,0,1093,NULL),(2221,64,0,1094,NULL),(2223,64,0,1095,NULL),(2225,64,0,1096,NULL),(2227,64,0,1097,NULL),(2229,64,0,1098,NULL),(2231,64,0,1099,NULL),(2233,64,0,1100,NULL),(2235,64,0,1101,NULL),(2237,64,0,1102,NULL),(2239,64,0,1103,NULL),(2241,64,0,1104,NULL),(2243,64,0,1105,NULL),(2245,64,0,1106,NULL),(2247,64,0,1107,NULL),(2249,64,0,1108,NULL),(2251,64,0,1109,NULL),(2253,64,0,1110,NULL),(2255,64,0,1111,NULL),(2257,64,0,1112,NULL),(2259,64,0,1113,NULL),(2261,64,0,1114,NULL),(2263,64,0,1115,NULL),(2265,64,0,1116,NULL),(2267,64,0,1117,NULL),(2269,64,0,1118,NULL),(2271,64,0,1119,NULL),(2273,64,0,1120,NULL),(2275,64,0,1121,NULL),(2277,64,0,1122,NULL),(2279,64,0,1123,NULL),(2281,64,0,1124,NULL),(2283,64,0,1125,NULL),(2285,64,0,1126,NULL),(2287,64,0,1127,NULL),(2289,64,0,1128,NULL),(2291,64,0,1129,NULL),(2293,64,0,1130,NULL),(2295,64,0,1131,NULL),(2297,64,0,1132,NULL),(2299,64,0,1133,NULL),(2301,64,0,1134,NULL),(2303,64,0,1135,NULL),(2305,64,0,1136,NULL),(2307,64,0,1137,NULL),(2309,64,0,1138,NULL),(2311,64,0,1139,NULL),(2313,64,0,1140,NULL),(2315,64,0,1141,NULL),(2317,64,0,1142,NULL),(2319,64,0,1143,NULL),(2321,64,0,1144,NULL),(2323,64,0,1145,NULL),(2325,64,0,1146,NULL),(2327,64,0,1147,NULL),(2329,64,0,1148,NULL),(2331,64,0,1149,NULL),(2333,64,0,1150,NULL),(2335,64,0,1151,NULL),(2337,64,0,1152,NULL),(2339,64,0,1153,NULL),(2341,64,0,1154,NULL),(2343,64,0,1155,NULL),(2345,64,0,1156,NULL),(2347,64,0,1157,NULL),(2349,64,0,1158,NULL),(2351,64,0,1159,NULL),(2353,64,0,1160,NULL),(2355,64,0,1161,NULL),(2357,64,0,1162,NULL),(2359,64,0,1163,NULL),(2361,64,0,1164,NULL),(2363,64,0,1165,NULL),(2365,64,0,1166,NULL),(2367,64,0,1167,NULL),(2369,64,0,1168,NULL),(2371,64,0,1169,NULL),(2373,64,0,1170,NULL),(2375,64,0,1171,NULL),(2377,64,0,1172,NULL),(2379,64,0,1173,NULL),(2381,64,0,1174,NULL),(2383,64,0,1175,NULL),(2385,64,0,1176,NULL),(2387,64,0,1177,NULL),(2389,64,0,1178,NULL),(2391,64,0,1179,NULL),(2393,64,0,1180,NULL),(2395,64,0,1181,NULL),(2397,64,0,1182,NULL),(2399,64,0,1183,NULL),(2401,64,0,1184,NULL),(2403,64,0,1185,NULL),(2405,64,0,1186,NULL),(2407,64,0,1187,NULL),(2409,64,0,1188,NULL),(2411,64,0,1189,NULL),(2413,64,0,1190,NULL),(2415,64,0,1191,NULL),(2417,64,0,1192,NULL),(2419,64,0,1193,NULL),(2421,64,0,1194,NULL),(2423,64,0,1195,NULL),(2425,64,0,1196,NULL),(2427,64,0,1197,NULL),(2429,64,0,1198,NULL),(2431,64,0,1199,NULL),(2433,64,0,1200,NULL),(2435,64,0,1201,NULL),(2437,64,0,1202,NULL),(2439,64,0,1203,NULL),(2441,64,0,1204,NULL),(2443,64,0,1205,NULL),(2445,64,0,1206,NULL),(2447,64,0,1207,NULL),(2449,64,0,1208,NULL),(2451,64,0,1209,NULL),(2453,64,0,1210,NULL),(2455,64,0,1211,NULL),(2457,64,0,1212,NULL),(2459,64,0,1213,NULL),(2461,64,0,1214,NULL),(2463,64,0,1215,NULL),(2465,64,0,1216,NULL),(2467,64,0,1217,NULL),(2469,64,0,1218,NULL),(2471,64,0,1219,NULL),(2473,64,0,1220,NULL),(2475,64,0,1221,NULL),(2477,64,0,1222,NULL),(2479,64,0,1223,NULL),(2481,64,0,1224,NULL),(2483,64,0,1225,NULL),(2485,64,0,1226,NULL),(2487,64,0,1227,NULL),(2489,64,0,1228,NULL),(2491,64,0,1229,NULL),(2493,64,0,1230,NULL),(2495,64,0,1231,NULL),(2497,64,0,1232,NULL),(2499,64,0,1233,NULL),(2501,64,0,1234,NULL),(2503,64,0,1235,NULL),(2505,64,0,1236,NULL),(2507,64,0,1237,NULL),(2509,64,0,1238,NULL),(2511,64,0,1239,NULL),(2513,64,0,1240,NULL),(2515,64,0,1241,NULL),(2517,64,0,1242,NULL),(2519,64,0,1243,NULL),(2521,64,0,1244,NULL),(2523,64,0,1245,NULL),(2525,64,0,1246,NULL),(2527,64,0,1247,NULL),(2529,64,0,1248,NULL),(2531,64,0,1249,NULL),(2533,64,0,1250,NULL),(2535,64,0,1251,NULL),(2537,64,0,1252,NULL),(2539,64,0,1253,NULL),(2541,64,0,1254,NULL),(2543,64,0,1255,NULL),(2545,64,0,1256,NULL),(2547,64,0,1257,NULL),(2549,64,0,1258,NULL),(2551,64,0,1259,NULL),(2553,64,0,1260,NULL),(2555,64,0,1261,NULL),(2557,64,0,1262,NULL),(2559,64,0,1263,NULL),(2561,64,0,1264,NULL),(2563,64,0,1265,NULL),(2565,64,0,1266,NULL),(2567,64,0,1267,NULL),(2569,64,0,1268,NULL),(2571,64,0,1269,NULL),(2573,64,0,1270,NULL),(2575,64,0,1271,NULL),(2577,64,0,1272,NULL),(2579,64,0,1273,NULL),(2581,64,0,1274,NULL),(2583,64,0,1275,NULL),(2585,64,0,1276,NULL),(2587,64,0,1277,NULL),(2589,64,0,1278,NULL),(2591,64,0,1279,NULL),(2593,64,0,1280,NULL),(2595,64,0,1281,NULL),(2597,64,0,1282,NULL),(2599,64,0,1283,NULL),(2601,64,0,1284,NULL),(2603,64,0,1285,NULL),(2605,64,0,1286,NULL),(2607,64,0,1287,NULL),(2609,64,0,1288,NULL),(2611,64,0,1289,NULL),(2613,64,0,1290,NULL),(2615,64,0,1291,NULL),(2617,64,0,1292,NULL),(2619,64,0,1293,NULL),(2621,64,0,1294,NULL),(2623,64,0,1295,NULL),(2625,64,0,1296,NULL),(2627,64,0,1297,NULL),(2629,64,0,1298,NULL),(2631,64,0,1299,NULL),(2633,64,0,1300,NULL),(2635,64,0,1301,NULL),(2637,64,0,1302,NULL),(2639,64,0,1303,NULL),(2641,64,0,1304,NULL),(2643,64,0,1305,NULL),(2645,64,0,1306,NULL),(2647,64,0,1307,NULL),(2649,64,0,1308,NULL),(2651,64,0,1309,NULL),(2653,64,0,1310,NULL),(2655,64,0,1311,NULL),(2657,64,0,1312,NULL),(2659,64,0,1313,NULL),(2661,64,0,1314,NULL),(2663,64,0,1315,NULL),(2665,64,0,1316,NULL),(2667,64,0,1317,NULL),(2669,64,0,1318,NULL),(2671,64,0,1319,NULL),(2673,64,0,1320,NULL),(2675,64,0,1321,NULL),(2677,64,0,1322,NULL),(2679,64,0,1323,NULL),(2681,64,0,1324,NULL),(2683,64,0,1325,NULL),(2685,64,0,1326,NULL),(2687,64,0,1327,NULL),(2689,64,0,1328,NULL),(2691,64,0,1329,NULL),(2693,64,0,1330,NULL),(2695,64,0,1331,NULL),(2697,64,0,1332,NULL),(2699,64,0,1333,NULL),(2701,64,0,1334,NULL),(2703,64,0,1335,NULL),(2705,64,0,1336,NULL),(2707,44,0,1337,NULL),(2708,47,0,1337,NULL),(2709,48,0,1337,NULL),(2710,64,0,1337,NULL),(2711,61,0,1337,NULL),(2712,44,0,1338,NULL),(2713,47,0,1338,NULL),(2714,48,0,1338,NULL),(2715,64,0,1338,NULL),(2716,61,0,1338,NULL),(3897,44,0,887,NULL),(3898,47,0,887,NULL),(3899,48,0,887,NULL),(3900,61,0,887,NULL),(3922,44,0,1339,NULL),(3923,47,0,1339,NULL),(3924,48,0,1339,NULL),(3925,64,0,1339,NULL),(3926,61,0,1339,NULL),(3942,44,0,1340,NULL),(3943,47,0,1340,NULL),(3944,48,0,1340,NULL),(3945,64,0,1340,NULL),(3946,61,0,1340,NULL);
/*!40000 ALTER TABLE `grocery_bag_catalog_category_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_category_entity_varchar`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_category_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_ENTT_VCHR_ENTT_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_category_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2855 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_category_entity_varchar`
--

LOCK TABLES `grocery_bag_catalog_category_entity_varchar` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_category_entity_varchar` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_category_entity_varchar` VALUES (1,42,0,1,'Root Catalog'),(2,42,0,2,'Default Category'),(3,49,0,2,'PRODUCTS'),(1840,42,0,884,'Household'),(1842,42,0,885,'Baby Foods'),(1844,42,0,886,'Baby Milk Powder'),(1846,42,0,887,'Cereals'),(1848,42,0,888,'Desserts'),(1850,42,0,889,'Prepared Meals'),(1852,42,0,890,'Rusk/Biscuits'),(1854,42,0,891,'Baby Needs'),(1856,42,0,892,'Accessories'),(1858,42,0,893,'Baby Napies'),(1860,42,0,894,'Cleaning aids'),(1862,42,0,895,'Gift Packs'),(1864,42,0,896,'Skin and Hair Care'),(1866,42,0,897,'Beauty Counter'),(1868,42,0,898,'Accessories'),(1870,42,0,899,'Car Care'),(1872,42,0,900,'Car Freshner'),(1874,42,0,901,'Cleaning Aids'),(1876,42,0,902,'Maintenance'),(1878,42,0,903,'Cleaning Aids'),(1880,42,0,904,'Air Freshener'),(1882,42,0,905,'Cleaning Aids'),(1884,42,0,906,'Dish wash'),(1886,42,0,907,'Disinfectants'),(1888,42,0,908,'Other'),(1890,42,0,909,'Toilet Cleaner'),(1892,42,0,910,'Disposables'),(1894,42,0,911,'Cups'),(1896,42,0,912,'Cutlery'),(1898,42,0,913,'Plates'),(1900,42,0,914,'General Needs'),(1902,42,0,915,'Floor Polish'),(1904,42,0,916,'Garbage Handling Requisits'),(1906,42,0,917,'Gloves'),(1908,42,0,918,'Mask/Pack'),(1910,42,0,919,'Other'),(1912,42,0,920,'Shoe Care'),(1914,42,0,921,'Surface Cleaner'),(1916,42,0,922,'Wipes'),(1918,42,0,923,'Laundry'),(1920,42,0,924,'Bleach'),(1922,42,0,925,'Fabric Softner'),(1924,42,0,926,'Starch'),(1926,42,0,927,'Washing'),(1928,42,0,928,'Oral Care'),(1930,42,0,929,'Mouth Wash'),(1932,42,0,930,'Tooth Paste'),(1934,42,0,931,'Toothbrush'),(1936,42,0,932,'Paper Goods'),(1938,42,0,933,'Facial Tissues'),(1940,42,0,934,'Kitchen Towel'),(1942,42,0,935,'Serviettes'),(1944,42,0,936,'Toilet Usage'),(1946,42,0,937,'Party Ware'),(1948,42,0,938,'Balloons'),(1950,42,0,939,'Birthday Candles'),(1952,42,0,940,'Other'),(1954,42,0,941,'Personal Hygiene'),(1956,42,0,942,'Adult Diapers'),(1958,42,0,943,'Feminine Hygiene'),(1960,42,0,944,'Pest Control'),(1962,42,0,945,'Cockroach'),(1964,42,0,946,'Mosquito'),(1966,42,0,947,'Other'),(1968,42,0,948,'Rats'),(1970,42,0,949,'Pet Care'),(1972,42,0,950,'Accessories'),(1974,42,0,951,'Medications'),(1976,42,0,952,'Pet Food'),(1978,42,0,953,'Shampoo/Soap'),(1980,42,0,954,'Toiletries Men'),(1982,42,0,955,'Deodorant'),(1984,42,0,956,'Fragrance Access.'),(1986,42,0,957,'Hair Care'),(1988,42,0,958,'Shaving Accessories'),(1990,42,0,959,'Skin Care'),(1992,42,0,960,'Toiletries Unisex'),(1994,42,0,961,'Body cleansing'),(1996,42,0,962,'Hair Care'),(1998,42,0,963,'Skin Care'),(2000,42,0,964,'Liquor'),(2002,42,0,965,'Beer'),(2004,42,0,966,'Imported'),(2006,42,0,967,'Local'),(2008,42,0,968,'Spirits'),(2010,42,0,969,'Foreign Spirits'),(2012,42,0,970,'Local Spirits'),(2014,42,0,971,'Locally Manufactured Foreign Spirit'),(2016,42,0,972,'Wines'),(2018,42,0,973,'Imported'),(2020,42,0,974,'Grocery'),(2022,42,0,975,'Biscuits'),(2024,42,0,976,'Assorted'),(2026,42,0,977,'Cookies'),(2028,42,0,978,'Crackers'),(2030,42,0,979,'Savoury'),(2032,42,0,980,'Sweet'),(2034,42,0,981,'Tea Biscuit'),(2036,42,0,982,'Cereals'),(2038,42,0,983,'Bran'),(2040,42,0,984,'Cereal Bars'),(2042,42,0,985,'Corn'),(2044,42,0,986,'Muesli'),(2046,42,0,987,'Oats'),(2048,42,0,988,'Rice'),(2050,42,0,989,'Wheat'),(2052,42,0,990,'Condiments'),(2054,42,0,991,'Chutneys'),(2056,42,0,992,'Lime Juice'),(2058,42,0,993,'Mayonnaise'),(2060,42,0,994,'Pickles'),(2062,42,0,995,'Salad Dressings'),(2064,42,0,996,'Sambol/Badum'),(2066,42,0,997,'Unclassified'),(2068,42,0,998,'Confectionery'),(2070,42,0,999,'Chewing Gums'),(2072,42,0,1000,'Choc Assorted Packs'),(2074,42,0,1001,'Choc Balls'),(2076,42,0,1002,'Choc Bars'),(2078,42,0,1003,'Choc Slabs'),(2080,42,0,1004,'Imported'),(2082,42,0,1005,'Local'),(2084,42,0,1006,'Local Specialities'),(2086,42,0,1007,'Mint'),(2088,42,0,1008,'Pudding'),(2090,42,0,1009,'Toffees'),(2092,42,0,1010,'Convenient Food'),(2094,42,0,1011,'Pappadam'),(2096,42,0,1012,'Dessert Ingredients'),(2098,42,0,1013,'Bee Honey'),(2100,42,0,1014,'Cocoa Powder'),(2102,42,0,1015,'Colouring'),(2104,42,0,1016,'Condensed Milk'),(2106,42,0,1017,'Cooking Chocolate'),(2108,42,0,1018,'Corn Flour'),(2110,42,0,1019,'Dates'),(2112,42,0,1020,'Dessicated Coconut'),(2114,42,0,1021,'Flavouring'),(2116,42,0,1022,'Gelatine'),(2118,42,0,1023,'Icing Sugar'),(2120,42,0,1024,'Jaggery'),(2122,42,0,1025,'Nuts'),(2124,42,0,1026,'Processed/Preserved Fruits'),(2126,42,0,1027,'Raising Agent'),(2128,42,0,1028,'Soft Sugar'),(2130,42,0,1029,'Syrups'),(2132,42,0,1030,'Treacle'),(2134,42,0,1031,'Unclassified'),(2136,42,0,1032,'Desserts'),(2138,42,0,1033,'Pre Mix'),(2140,42,0,1034,'Ready To Eat'),(2142,42,0,1035,'Sauce/Topping'),(2144,42,0,1036,'Eggs'),(2146,42,0,1037,'Hen'),(2148,42,0,1038,'Quail'),(2150,42,0,1039,'Flour'),(2152,42,0,1040,'Atta'),(2154,42,0,1041,'Gram'),(2156,42,0,1042,'Instant Mixes'),(2158,42,0,1043,'Kurakkan'),(2160,42,0,1044,'Orid'),(2162,42,0,1045,'Rice'),(2164,42,0,1046,'Wheat'),(2166,42,0,1047,'Noodles'),(2168,42,0,1048,'Cups'),(2170,42,0,1049,'Instant Large'),(2172,42,0,1050,'Instant Small'),(2174,42,0,1051,'Regular'),(2176,42,0,1052,'Unclassified'),(2178,42,0,1053,'Oils/Fats'),(2180,42,0,1054,'Coconut Oil'),(2182,42,0,1055,'Cooking Fat'),(2184,42,0,1056,'Corn Oil'),(2186,42,0,1057,'Olive Oil'),(2188,42,0,1058,'Palm'),(2190,42,0,1059,'Sesame Oil'),(2192,42,0,1060,'Soya Oil'),(2194,42,0,1061,'Sunflower'),(2196,42,0,1062,'Pasta'),(2198,42,0,1063,'Assorted'),(2200,42,0,1064,'Couscus'),(2202,42,0,1065,'Fettuccini'),(2204,42,0,1066,'Lasagna'),(2206,42,0,1067,'Macaroni'),(2208,42,0,1068,'Sauce'),(2210,42,0,1069,'Spaghetti'),(2212,42,0,1070,'Vermicelli'),(2214,42,0,1071,'Processed Cheese'),(2216,42,0,1072,'Blocks'),(2218,42,0,1073,'Canned'),(2220,42,0,1074,'Processed/Preserved Fish'),(2222,42,0,1075,'Dry'),(2224,42,0,1076,'Mackerel'),(2226,42,0,1077,'Sardine'),(2228,42,0,1078,'Tuna'),(2230,42,0,1079,'Processed/Preserved Fruits'),(2232,42,0,1080,'Apricot'),(2234,42,0,1081,'Coconut Milk'),(2236,42,0,1082,'Lycheese'),(2238,42,0,1083,'Mixed Fruits'),(2240,42,0,1084,'Olive'),(2242,42,0,1085,'Peach'),(2244,42,0,1086,'Pears'),(2246,42,0,1087,'Unclassified'),(2248,42,0,1088,'Processed/Preserved Meat'),(2250,42,0,1089,'Beef'),(2252,42,0,1090,'Mutton'),(2254,42,0,1091,'Poultry'),(2256,42,0,1092,'Processed/Preserved Vegetable'),(2258,42,0,1093,'Asparagus'),(2260,42,0,1094,'Baked Beans'),(2262,42,0,1095,'Corn'),(2264,42,0,1096,'Curry'),(2266,42,0,1097,'Mushrooms'),(2268,42,0,1098,'Soya Meat'),(2270,42,0,1099,'Tomatoes'),(2272,42,0,1100,'Unclassified'),(2274,42,0,1101,'Pulses'),(2276,42,0,1102,'Barley'),(2278,42,0,1103,'Bean'),(2280,42,0,1104,'Corn'),(2282,42,0,1105,'Dhal'),(2284,42,0,1106,'Gram'),(2286,42,0,1107,'Orid'),(2288,42,0,1108,'Peas'),(2290,42,0,1109,'Rice'),(2292,42,0,1110,'Sago'),(2294,42,0,1111,'Semolina'),(2296,42,0,1112,'Sesame'),(2298,42,0,1113,'Wheat'),(2300,42,0,1114,'Sauce'),(2302,42,0,1115,'BBQ'),(2304,42,0,1116,'Chilie Based'),(2306,42,0,1117,'Ketchups'),(2308,42,0,1118,'Oyster'),(2310,42,0,1119,'Soy'),(2312,42,0,1120,'Specialty'),(2314,42,0,1121,'Tomato Based'),(2316,42,0,1122,'Seasoning'),(2318,42,0,1123,'Marinade'),(2320,42,0,1124,'Paste/Mixes'),(2322,42,0,1125,'Salt'),(2324,42,0,1126,'Spices'),(2326,42,0,1127,'Unclassified'),(2328,42,0,1128,'Vinegar'),(2330,42,0,1129,'Snacks'),(2332,42,0,1130,'Crisp/Chips'),(2334,42,0,1131,'Mixture'),(2336,42,0,1132,'Nuts'),(2338,42,0,1133,'Pop Corn'),(2340,42,0,1134,'Soups'),(2342,42,0,1135,'Local'),(2344,42,0,1136,'Spreads'),(2346,42,0,1137,'Chocolate Spreads'),(2348,42,0,1138,'Jam'),(2350,42,0,1139,'Marmalade'),(2352,42,0,1140,'Peanut Butter'),(2354,42,0,1141,'Vegetable Extracts'),(2356,42,0,1142,'Sugar'),(2358,42,0,1143,'Brown Sugar'),(2360,42,0,1144,'White Sugar'),(2362,42,0,1145,'Bakery'),(2364,42,0,1146,'Biscuits'),(2366,42,0,1147,'Breads'),(2368,42,0,1148,'Regular Bread'),(2370,42,0,1149,'Specialty'),(2372,42,0,1150,'Cakes'),(2374,42,0,1151,'Whole'),(2376,42,0,1152,'Ingredients'),(2378,42,0,1153,'Unclassified'),(2380,42,0,1154,'Savoury'),(2382,42,0,1155,'Buns'),(2384,42,0,1156,'Rolls'),(2386,42,0,1157,'Sweets'),(2388,42,0,1158,'Beverages'),(2390,42,0,1159,'Carbonated Drink'),(2392,42,0,1160,'Multiple consumption'),(2394,42,0,1161,'Single consumption'),(2396,42,0,1162,'Chocolate Drink'),(2398,42,0,1163,'Concentrates/Mixes'),(2400,42,0,1164,'Coffee'),(2402,42,0,1165,'Creamers'),(2404,42,0,1166,'Instant'),(2406,42,0,1167,'Powders'),(2408,42,0,1168,'RTD'),(2410,42,0,1169,'Juices'),(2412,42,0,1170,'Cordial'),(2414,42,0,1171,'Drink Powder'),(2416,42,0,1172,'RTD'),(2418,42,0,1173,'Squash'),(2420,42,0,1174,'Long Life'),(2422,42,0,1175,'Full Cream'),(2424,42,0,1176,'Low/Non Fat'),(2426,42,0,1177,'RTD'),(2428,42,0,1178,'Soy Milk'),(2430,42,0,1179,'Malt Drink'),(2432,42,0,1180,'Natural'),(2434,42,0,1181,'RTD'),(2436,42,0,1182,'Milk Foods'),(2438,42,0,1183,'Full Cream'),(2440,42,0,1184,'Low/Non Fat'),(2442,42,0,1185,'Special Health'),(2444,42,0,1186,'Sports/Energy Drink'),(2446,42,0,1187,'Carbonated'),(2448,42,0,1188,'ISO Tonic'),(2450,42,0,1189,'Tea'),(2452,42,0,1190,'Flavoured'),(2454,42,0,1191,'Green Tea'),(2456,42,0,1192,'Herbal'),(2458,42,0,1193,'Non Flavoured'),(2460,42,0,1194,'RTD'),(2462,42,0,1195,'Water'),(2464,42,0,1196,'Mineral'),(2466,42,0,1197,'Sparkling'),(2468,42,0,1198,'Frozen                          Food'),(2470,42,0,1199,'Convenient Food'),(2472,42,0,1200,'Bread Wraps'),(2474,42,0,1201,'Bread/Naan/Roti'),(2476,42,0,1202,'Chips/Wedges'),(2478,42,0,1203,'Pizzas'),(2480,42,0,1204,'Savoury Bakery'),(2482,42,0,1205,'Desserts'),(2484,42,0,1206,'Ice Cream'),(2486,42,0,1207,'Processed/Preserved Meat'),(2488,42,0,1208,'Beef'),(2490,42,0,1209,'Pork'),(2492,42,0,1210,'Poultry'),(2494,42,0,1211,'Raw Meat'),(2496,42,0,1212,'Mutton'),(2498,42,0,1213,'Poultry'),(2500,42,0,1214,'Unclassified'),(2502,42,0,1215,'Ice Cubes'),(2504,42,0,1216,'Vegetable/Fruits'),(2506,42,0,1217,'Vegetables'),(2508,42,0,1218,'Chilled'),(2510,42,0,1219,'Cream'),(2512,42,0,1220,'Fresh'),(2514,42,0,1221,'Whipping'),(2516,42,0,1222,'Curd'),(2518,42,0,1223,'Full Cream'),(2520,42,0,1224,'Milk'),(2522,42,0,1225,'Full Cream'),(2524,42,0,1226,'Low/Non Fat'),(2526,42,0,1227,'Miscellaneous'),(2528,42,0,1228,'Cakes'),(2530,42,0,1229,'Desserts'),(2532,42,0,1230,'Jaggery'),(2534,42,0,1231,'Natural Cheese'),(2536,42,0,1232,'Blocks'),(2538,42,0,1233,'Cream'),(2540,42,0,1234,'Mozzarella'),(2542,42,0,1235,'Processed Cheese'),(2544,42,0,1236,'Blocks'),(2546,42,0,1237,'Portions'),(2548,42,0,1238,'Sliced'),(2550,42,0,1239,'Spreads'),(2552,42,0,1240,'Spreads'),(2554,42,0,1241,'Butter'),(2556,42,0,1242,'Margarine'),(2558,42,0,1243,'Yoghurt'),(2560,42,0,1244,'Local'),(2562,42,0,1245,'Vegetables'),(2564,42,0,1246,'Exotic'),(2566,42,0,1247,'Cabbage Family'),(2568,42,0,1248,'Lettuce'),(2570,42,0,1249,'Low Country Vegetables'),(2572,42,0,1250,'Aubergine'),(2574,42,0,1251,'Beans'),(2576,42,0,1252,'Chilies'),(2578,42,0,1253,'Citric Family'),(2580,42,0,1254,'Cucumber'),(2582,42,0,1255,'Gourd'),(2584,42,0,1256,'Herbs'),(2586,42,0,1257,'Leaves'),(2588,42,0,1258,'Okra'),(2590,42,0,1259,'Onions'),(2592,42,0,1260,'Pumpkin'),(2594,42,0,1261,'Unclassified'),(2596,42,0,1262,'Yam'),(2598,42,0,1263,'Organic'),(2600,42,0,1264,'Packets & Units'),(2602,42,0,1265,'Packets &amp; Units'),(2604,42,0,1266,'Assorted Vegetable Packs'),(2606,42,0,1267,'Coconut'),(2608,42,0,1268,'Cooking Cashew'),(2610,42,0,1269,'Corn'),(2612,42,0,1270,'Mushrooms'),(2614,42,0,1271,'Sprouts'),(2616,42,0,1272,'Unclassified'),(2618,42,0,1273,'Pola'),(2620,42,0,1274,'Bulk'),(2622,42,0,1275,'Numbers'),(2624,42,0,1276,'Up Country Vegetables'),(2626,42,0,1277,'Beans'),(2628,42,0,1278,'Cabbage Family'),(2630,42,0,1279,'Onion'),(2632,42,0,1280,'Roots'),(2634,42,0,1281,'Tomatoes'),(2636,42,0,1282,'Meat'),(2638,42,0,1283,'Fresh Meat'),(2640,42,0,1284,'Beef'),(2642,42,0,1285,'Mutton'),(2644,42,0,1286,'Pork'),(2646,42,0,1287,'Poultry'),(2648,42,0,1288,'Processed Meat Serve Over'),(2650,42,0,1289,'Assorted'),(2652,42,0,1290,'Beef'),(2654,42,0,1291,'Pork'),(2656,42,0,1292,'Poultry'),(2658,42,0,1293,'Fish'),(2660,42,0,1294,'Fresh Sea Food'),(2662,42,0,1295,'Shell'),(2664,42,0,1296,'Unclassified'),(2666,42,0,1297,'Homeware'),(2668,42,0,1298,'General Needs'),(2670,42,0,1299,'Illumination'),(2672,42,0,1300,'Incense'),(2674,42,0,1301,'Kitchen Needs'),(2676,42,0,1302,'BBQ Aids'),(2678,42,0,1303,'Cling Wraps'),(2680,42,0,1304,'Foil'),(2682,42,0,1305,'Food Containers'),(2684,42,0,1306,'Sealer Bags'),(2686,42,0,1307,'Unclassified'),(2688,42,0,1308,'Stationary/Books'),(2690,42,0,1309,'Colouring Aids'),(2692,42,0,1310,'Exercise Books'),(2694,42,0,1311,'Markers/Highlighters'),(2696,42,0,1312,'Office Aids'),(2698,42,0,1313,'Pencil Box/Case'),(2700,42,0,1314,'Pencils/Pens'),(2702,42,0,1315,'School aids'),(2704,42,0,1316,'Textile'),(2706,42,0,1317,'Unclassified'),(2708,42,0,1318,'Tools'),(2710,42,0,1319,'Tools'),(2712,42,0,1320,'Wrapping Papers'),(2714,42,0,1321,'Wrapping Papers'),(2716,42,0,1322,'Fruits'),(2718,42,0,1323,'Imported Fruits'),(2720,42,0,1324,'Apples'),(2722,42,0,1325,'Citrus'),(2724,42,0,1326,'Grapes'),(2726,42,0,1327,'Pears'),(2728,42,0,1328,'Local Fruits'),(2730,42,0,1329,'Banana'),(2732,42,0,1330,'Citrus'),(2734,42,0,1331,'Mangoes'),(2736,42,0,1332,'Melon'),(2738,42,0,1333,'Tropical'),(2740,42,0,1334,'Packets &amp; Units'),(2742,42,0,1335,'Pineapples'),(2744,42,0,1336,'Unclassified'),(2746,42,0,1337,'Rusk/Biscuits'),(2747,113,0,1337,'rusk-biscuits'),(2748,46,0,1337,NULL),(2749,49,0,1337,'PRODUCTS'),(2750,57,0,1337,NULL),(2751,60,0,1337,NULL),(2752,65,0,1337,NULL),(2753,114,0,1337,'/rusk-biscuits'),(2754,42,0,1338,'Unclassified'),(2755,113,0,1338,'unclassified'),(2756,46,0,1338,NULL),(2757,49,0,1338,'PRODUCTS'),(2758,57,0,1338,NULL),(2759,60,0,1338,NULL),(2760,65,0,1338,NULL),(2761,114,0,1338,'/unclassified'),(2762,114,0,887,'cereals'),(2763,113,0,887,'cereals'),(2764,46,0,887,NULL),(2765,49,0,887,'PRODUCTS'),(2766,57,0,887,NULL),(2767,60,0,887,NULL),(2768,65,0,887,NULL),(2802,42,0,1339,'asdasdasd'),(2803,113,0,1339,'asdasdasd'),(2804,46,0,1339,NULL),(2805,49,0,1339,'PRODUCTS'),(2806,57,0,1339,NULL),(2807,60,0,1339,NULL),(2808,65,0,1339,NULL),(2809,114,0,1339,'asdasdasd'),(2834,42,0,1340,'dfgdfg'),(2835,113,0,1340,'dfgdfg'),(2836,46,0,1340,NULL),(2837,49,0,1340,'PRODUCTS'),(2838,57,0,1340,NULL),(2839,60,0,1340,NULL),(2840,65,0,1340,NULL),(2841,114,0,1340,'/dfgdfg');
/*!40000 ALTER TABLE `grocery_bag_catalog_category_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_category_product`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_category_product` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`category_id`,`product_id`),
  KEY `CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_CTGR_PRD_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `grocery_bag_catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_CTGR_PRD_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Category Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_category_product`
--

LOCK TABLES `grocery_bag_catalog_category_product` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_category_product` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_category_product` VALUES (886,26,0),(886,27,0),(886,28,0),(886,29,0),(886,30,0),(886,31,0),(886,32,0),(886,33,0),(886,34,0),(886,35,0),(886,36,0),(886,37,0);
/*!40000 ALTER TABLE `grocery_bag_catalog_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_category_product_index`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_category_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `CAT_CTGR_PRD_IDX_STORE_ID_CTGR_ID_VISIBILITY_IS_PARENT_POSITION` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_category_product_index`
--

LOCK TABLES `grocery_bag_catalog_category_product_index` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_category_product_index` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_category_product_index` VALUES (2,26,0,0,1,4),(2,27,0,0,1,4),(2,28,0,0,1,4),(2,29,0,0,1,4),(2,30,0,0,1,4),(2,31,0,0,1,4),(2,32,0,0,1,4),(2,33,0,0,1,4),(2,34,0,0,1,4),(2,35,0,0,1,4),(2,36,0,0,1,4),(2,37,0,0,1,4),(2,38,0,0,1,4),(2,39,0,0,1,4),(2,40,0,0,1,4),(2,41,0,0,1,4),(2,42,0,0,1,4),(2,43,0,0,1,4),(2,44,0,0,1,4),(2,45,0,0,1,4),(2,46,0,0,1,4),(2,47,0,0,1,4),(2,48,0,0,1,4),(2,49,0,0,1,4),(2,50,0,0,1,4),(2,51,0,0,1,4),(2,52,0,0,1,4),(2,53,0,0,1,4),(2,54,0,0,1,4),(2,55,0,0,1,4),(2,56,0,0,1,4),(2,57,0,0,1,4),(2,58,0,0,1,4),(2,59,0,0,1,4),(2,60,0,0,1,4),(2,61,0,0,1,4),(2,62,0,0,1,4),(2,63,0,0,1,4),(2,64,0,0,1,4),(2,65,0,0,1,4),(2,66,0,0,1,4),(2,67,0,0,1,4),(2,68,0,0,1,4),(2,69,0,0,1,4),(2,70,0,0,1,4),(2,71,0,0,1,4),(2,72,0,0,1,4),(2,73,0,0,1,4),(2,74,0,0,1,4),(2,75,0,0,1,4),(2,76,0,0,1,4),(2,77,0,0,1,4),(2,78,0,0,1,4),(2,79,0,0,1,4),(2,80,0,0,1,4),(2,81,0,0,1,4),(2,82,0,0,1,4),(2,83,0,0,1,4),(2,84,0,0,1,4),(2,85,0,0,1,4),(2,86,0,0,1,4),(2,87,0,0,1,4),(2,88,0,0,1,4),(2,89,0,0,1,4),(2,90,0,0,1,4),(2,91,0,0,1,4),(2,92,0,0,1,4),(2,93,0,0,1,4),(2,94,0,0,1,4),(2,95,0,0,1,4),(2,96,0,0,1,4),(2,97,0,0,1,4),(2,98,0,0,1,4),(2,99,0,0,1,4),(2,100,0,0,1,4),(2,101,0,0,1,4),(2,102,0,0,1,4),(2,103,0,0,1,4),(2,104,0,0,1,4),(2,105,0,0,1,4),(2,106,0,0,1,4),(2,107,0,0,1,4),(2,108,0,0,1,4),(2,109,0,0,1,4),(2,110,0,0,1,4),(2,111,0,0,1,4),(2,112,0,0,1,4),(2,113,0,0,1,4),(2,114,0,0,1,4),(2,115,0,0,1,4),(2,116,0,0,1,4),(2,117,0,0,1,4),(2,118,0,0,1,4),(2,119,0,0,1,4),(2,120,0,0,1,4),(2,121,0,0,1,4),(2,122,0,0,1,4),(2,123,0,0,1,4),(2,124,0,0,1,4),(2,125,0,0,1,4),(2,126,0,0,1,4),(2,127,0,0,1,4),(2,128,0,0,1,4),(2,129,0,0,1,4),(2,130,0,0,1,4),(2,131,0,0,1,4),(2,132,0,0,1,4),(2,133,0,0,1,4),(2,134,0,0,1,4),(2,135,0,0,1,4),(2,136,0,0,1,4),(2,137,0,0,1,4),(2,138,0,0,1,4),(2,139,0,0,1,4),(2,140,0,0,1,4),(2,141,0,0,1,4),(2,142,0,0,1,4),(2,143,0,0,1,4),(2,144,0,0,1,4),(2,145,0,0,1,4),(2,146,0,0,1,4),(2,147,0,0,1,4),(2,148,0,0,1,4),(2,149,0,0,1,4),(2,150,0,0,1,4),(2,151,0,0,1,4),(2,152,0,0,1,4),(2,153,0,0,1,4),(2,154,0,0,1,4),(2,155,0,0,1,4),(2,156,0,0,1,4),(2,157,0,0,1,4),(2,158,0,0,1,4),(2,159,0,0,1,4),(2,160,0,0,1,4),(2,161,0,0,1,4),(2,162,0,0,1,4),(2,163,0,0,1,4),(2,164,0,0,1,4),(2,165,0,0,1,4),(2,166,0,0,1,4),(2,167,0,0,1,4),(2,168,0,0,1,4),(2,169,0,0,1,4),(2,170,0,0,1,4),(2,171,0,0,1,4),(2,172,0,0,1,4),(2,173,0,0,1,4),(2,174,0,0,1,4),(2,175,0,0,1,4),(2,176,0,0,1,4),(2,177,0,0,1,4),(2,178,0,0,1,4),(2,179,0,0,1,4),(2,180,0,0,1,4),(2,181,0,0,1,4),(2,182,0,0,1,4),(2,183,0,0,1,4),(2,184,0,0,1,4),(2,185,0,0,1,4),(2,186,0,0,1,4),(2,187,0,0,1,4),(2,188,0,0,1,4),(2,189,0,0,1,4),(2,190,0,0,1,4),(2,191,0,0,1,4),(2,192,0,0,1,4),(2,193,0,0,1,4),(2,194,0,0,1,4),(2,195,0,0,1,4),(2,196,0,0,1,4),(2,197,0,0,1,4),(2,198,0,0,1,4),(2,199,0,0,1,4),(2,200,0,0,1,4),(2,201,0,0,1,4),(2,202,0,0,1,4),(2,203,0,0,1,4),(2,204,0,0,1,4),(2,205,0,0,1,4),(2,206,0,0,1,4),(2,207,0,0,1,4),(2,208,0,0,1,4),(2,209,0,0,1,4),(2,210,0,0,1,4),(2,211,0,0,1,4),(2,212,0,0,1,4),(2,213,0,0,1,4),(2,214,0,0,1,4),(2,215,0,0,1,4),(2,216,0,0,1,4),(2,217,0,0,1,4),(2,218,0,0,1,4),(2,219,0,0,1,4),(2,220,0,0,1,4),(2,221,0,0,1,4),(2,222,0,0,1,4),(2,223,0,0,1,4),(2,224,0,0,1,4),(2,225,0,0,1,4),(2,226,0,0,1,4),(2,227,0,0,1,4),(2,228,0,0,1,4),(2,229,0,0,1,4),(2,230,0,0,1,4),(2,231,0,0,1,4),(2,232,0,0,1,4),(2,233,0,0,1,4),(2,234,0,0,1,4),(2,235,0,0,1,4),(2,236,0,0,1,4),(2,237,0,0,1,4),(2,238,0,0,1,4),(2,239,0,0,1,4),(2,240,0,0,1,4),(2,241,0,0,1,4),(2,242,0,0,1,4),(2,243,0,0,1,4),(2,244,0,0,1,4),(2,245,0,0,1,4),(2,246,0,0,1,4),(2,247,0,0,1,4),(2,248,0,0,1,4),(2,249,0,0,1,4),(2,250,0,0,1,4),(2,251,0,0,1,4),(2,252,0,0,1,4),(2,253,0,0,1,4),(2,254,0,0,1,4),(2,255,0,0,1,4),(2,256,0,0,1,4),(2,257,0,0,1,4),(2,258,0,0,1,4),(2,259,0,0,1,4),(2,260,0,0,1,4),(2,261,0,0,1,4),(2,262,0,0,1,4),(2,263,0,0,1,4),(2,264,0,0,1,4),(2,265,0,0,1,4),(2,266,0,0,1,4),(2,267,0,0,1,4),(2,268,0,0,1,4),(2,269,0,0,1,4),(2,270,0,0,1,4),(2,271,0,0,1,4),(2,272,0,0,1,4),(2,273,0,0,1,4),(2,274,0,0,1,4),(2,275,0,0,1,4),(2,276,0,0,1,4),(2,277,0,0,1,4),(2,278,0,0,1,4),(2,279,0,0,1,4),(2,280,0,0,1,4),(2,281,0,0,1,4),(2,282,0,0,1,4),(2,283,0,0,1,4),(2,284,0,0,1,4),(2,285,0,0,1,4),(2,286,0,0,1,4),(2,287,0,0,1,4),(2,288,0,0,1,4),(2,289,0,0,1,4),(2,290,0,0,1,4),(2,291,0,0,1,4),(2,292,0,0,1,4),(2,293,0,0,1,4),(2,294,0,0,1,4),(2,295,0,0,1,4),(2,296,0,0,1,4),(2,297,0,0,1,4),(2,298,0,0,1,4),(2,299,0,0,1,4),(2,300,0,0,1,4),(2,301,0,0,1,4),(2,302,0,0,1,4),(2,303,0,0,1,4),(2,304,0,0,1,4),(2,305,0,0,1,4),(2,306,0,0,1,4),(2,307,0,0,1,4),(2,308,0,0,1,4),(2,309,0,0,1,4),(2,310,0,0,1,4),(2,311,0,0,1,4),(2,312,0,0,1,4),(2,313,0,0,1,4),(886,26,0,1,1,4),(886,27,0,1,1,4),(886,28,0,1,1,4),(886,29,0,1,1,4),(886,30,0,1,1,4),(886,31,0,1,1,4),(886,32,0,1,1,4),(886,33,0,1,1,4),(886,34,0,1,1,4),(886,35,0,1,1,4),(886,36,0,1,1,4),(886,37,0,1,1,4);
/*!40000 ALTER TABLE `grocery_bag_catalog_category_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_category_product_index_tmp`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_category_product_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_category_product_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  KEY `CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_category_product_index_tmp`
--

LOCK TABLES `grocery_bag_catalog_category_product_index_tmp` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_category_product_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_category_product_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_compare_item`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_compare_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_compare_item` (
  `catalog_compare_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID',
  `visitor_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_COMPARE_ITEM_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOG_COMPARE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Compare Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_compare_item`
--

LOCK TABLES `grocery_bag_catalog_compare_item` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_compare_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_compare_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_eav_attribute`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Global',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `is_searchable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable',
  `is_filterable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable',
  `is_comparable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Comparable',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Sorting',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible In Advanced Search',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_wysiwyg_enabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Promo Rules',
  `is_required_in_admin_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Required In Admin Store',
  `is_used_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `search_weight` float NOT NULL DEFAULT '1' COMMENT 'Search Weight',
  `additional_data` text COMMENT 'Additional swatch attributes data',
  PRIMARY KEY (`attribute_id`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`),
  CONSTRAINT `CATALOG_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog EAV Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_eav_attribute`
--

LOCK TABLES `grocery_bag_catalog_eav_attribute` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_eav_attribute` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_eav_attribute` VALUES (42,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(43,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(44,NULL,0,1,0,0,0,0,1,0,0,0,0,NULL,0,0,1,0,0,0,0,0,1,NULL),(45,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(46,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(47,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(48,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(49,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(50,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(51,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(52,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(53,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(54,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(55,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(56,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(57,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(58,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(59,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(60,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(61,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(62,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(63,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(64,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\Available',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(65,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Sortby\\DefaultSortby',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(66,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(67,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(68,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(69,'Magento\\Catalog\\Block\\Adminhtml\\Category\\Helper\\Pricestep',0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(70,NULL,0,1,1,0,0,0,0,0,0,1,1,NULL,1,0,0,0,0,0,0,0,5,NULL),(71,NULL,1,1,1,0,1,0,0,0,0,0,0,NULL,1,0,0,0,0,0,0,0,6,NULL),(72,NULL,0,1,1,0,1,0,1,0,0,0,0,NULL,1,0,1,0,0,0,0,0,1,NULL),(73,NULL,0,1,1,0,1,0,1,0,0,1,0,NULL,1,0,1,0,0,1,0,0,1,NULL),(74,NULL,2,1,1,1,0,0,0,0,0,1,1,'simple,virtual,bundle,downloadable,configurable',1,0,0,0,0,0,0,0,1,NULL),(75,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,1,1,NULL),(76,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,0,1,NULL),(77,NULL,2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,0,1,NULL),(78,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,virtual,downloadable',0,0,0,0,0,1,0,1,1,NULL),(79,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Weight',1,1,0,0,0,0,0,0,0,0,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,1,1,NULL),(80,NULL,1,1,1,1,1,0,0,0,0,0,0,'simple',1,0,0,0,0,1,0,1,1,NULL),(81,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL),(82,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL),(83,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL),(84,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\BaseImage',0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(85,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(86,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(87,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(88,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(89,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,0,0,0,1,NULL),(90,NULL,1,1,1,1,1,0,0,0,0,0,0,'simple,virtual,configurable',1,0,0,0,0,1,0,1,1,NULL),(91,NULL,2,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(92,NULL,2,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(93,NULL,1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(94,'Magento\\Framework\\Data\\Form\\Element\\Hidden',2,1,1,0,0,0,0,0,0,1,0,NULL,0,0,0,0,1,0,0,0,1,NULL),(95,NULL,0,0,0,0,0,0,0,0,0,0,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,0,0,0,1,NULL),(96,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,1,0,0,0,1,NULL),(97,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,1,1,NULL),(98,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(99,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(100,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(101,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL),(102,'Magento\\Catalog\\Block\\Adminhtml\\Product\\Helper\\Form\\Category',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(103,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(104,NULL,1,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(105,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(106,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(107,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(108,NULL,0,0,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(109,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(110,NULL,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(111,NULL,2,1,0,0,0,0,0,0,0,0,0,'simple,bundle,grouped,configurable',0,0,0,0,0,1,0,1,1,NULL),(112,'Magento\\CatalogInventory\\Block\\Adminhtml\\Form\\Field\\Stock',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(113,NULL,0,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(114,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(115,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,1,0,1,1,NULL),(116,NULL,0,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(117,'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type',2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,1,0,1,1,NULL),(118,'Magento\\Msrp\\Block\\Adminhtml\\Product\\Helper\\Form\\Type\\Price',2,1,0,0,0,0,0,0,0,1,0,'simple,virtual,downloadable,bundle,configurable',0,0,0,0,0,0,0,0,1,NULL),(119,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),(120,NULL,1,0,0,0,0,0,0,0,0,0,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),(121,NULL,1,0,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),(122,NULL,1,1,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),(123,NULL,1,0,0,0,0,0,0,0,0,1,0,'bundle',0,0,0,0,0,0,0,0,1,NULL),(124,NULL,1,0,0,0,0,0,0,0,0,1,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL),(125,NULL,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL),(126,NULL,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL),(127,NULL,1,0,0,0,0,0,0,0,0,1,0,'downloadable',0,0,0,0,0,0,0,0,1,NULL),(128,NULL,0,1,0,0,0,0,0,0,0,1,0,NULL,0,0,0,0,0,0,0,0,1,NULL),(129,NULL,2,1,1,0,0,0,0,0,0,1,0,'simple,virtual,bundle,downloadable,configurable',0,0,0,0,0,1,0,1,1,NULL),(130,'Magento\\GiftMessage\\Block\\Adminhtml\\Product\\Helper\\Form\\Config',1,1,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,1,0,0,1,NULL);
/*!40000 ALTER TABLE `grocery_bag_catalog_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_bundle_option`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_bundle_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`),
  CONSTRAINT `CAT_PRD_BNDL_OPT_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_bundle_option`
--

LOCK TABLES `grocery_bag_catalog_product_bundle_option` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_bundle_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_bundle_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_bundle_option_value`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_bundle_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_BUNDLE_OPTION_VALUE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  CONSTRAINT `CAT_PRD_BNDL_OPT_VAL_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `grocery_bag_catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_bundle_option_value`
--

LOCK TABLES `grocery_bag_catalog_product_bundle_option_value` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_bundle_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_bundle_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_bundle_price_index`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_bundle_price_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `min_price` decimal(12,4) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) NOT NULL COMMENT 'Max Price',
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `grocery_bag_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_PRICE_IDX_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Price Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_bundle_price_index`
--

LOCK TABLES `grocery_bag_catalog_product_bundle_price_index` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_bundle_price_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_bundle_price_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_bundle_selection`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_bundle_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Selection Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Selection Can Change Qty',
  PRIMARY KEY (`selection_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_OPT_ID_CAT_PRD_BNDL_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `grocery_bag_catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_bundle_selection`
--

LOCK TABLES `grocery_bag_catalog_product_bundle_selection` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_bundle_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_bundle_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_bundle_selection_price`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_bundle_selection_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_bundle_selection_price` (
  `selection_id` int(10) unsigned NOT NULL COMMENT 'Selection Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  PRIMARY KEY (`selection_id`,`website_id`),
  KEY `CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_BNDL_SELECTION_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DCF37523AA05D770A70AA4ED7C2616E4` FOREIGN KEY (`selection_id`) REFERENCES `grocery_bag_catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_bundle_selection_price`
--

LOCK TABLES `grocery_bag_catalog_product_bundle_selection_price` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_bundle_selection_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_bundle_selection_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_bundle_stock_index`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_bundle_stock_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `stock_status` smallint(6) DEFAULT '0' COMMENT 'Stock Status',
  PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Stock Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_bundle_stock_index`
--

LOCK TABLES `grocery_bag_catalog_product_bundle_stock_index` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_bundle_stock_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_bundle_stock_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_entity`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Template ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `has_options` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Has Options',
  `required_options` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required Options',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `CATALOG_PRODUCT_ENTITY_SKU` (`sku`),
  CONSTRAINT `CAT_PRD_ENTT_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `grocery_bag_eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_entity`
--

LOCK TABLES `grocery_bag_catalog_product_entity` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_product_entity` VALUES (26,4,'simple','enfamilastage2milkpowdertin800g',0,0,'2015-10-16 08:11:20','2015-10-16 09:59:26'),(27,4,'simple','enfagrowagrowingmilkvani800g',0,0,'2015-10-16 08:11:23','2015-10-16 09:59:29'),(28,4,'simple','enfagrowa4tin800g',0,0,'2015-10-16 08:11:26','2015-10-16 09:59:31'),(29,4,'simple','enfamila2milkpowder400g',0,0,'2015-10-16 08:11:31','2015-10-16 09:59:34'),(30,4,'simple','anchorpediapro25yearchild.1kg',0,0,'2015-10-16 08:11:33','2015-10-16 09:59:36'),(31,4,'simple','enfagrowagrowingmilkvani400g',0,0,'2015-10-16 08:11:35','2015-10-16 09:59:39'),(32,4,'simple','nanstage2h.a.milkpowder400g',0,0,'2015-10-16 08:11:37','2015-10-16 09:59:41'),(33,4,'simple','enfagrowa4tin400g',0,0,'2015-10-16 08:11:39','2015-10-16 09:59:44'),(34,4,'simple','smagold3milkpowdertin400g',0,0,'2015-10-16 08:11:41','2015-10-16 09:59:46'),(35,4,'simple','cow/gatepremium400g',0,0,'2015-10-16 08:11:44','2015-10-16 09:59:48'),(36,4,'simple','nanstage3milkpowdertin400g',0,0,'2015-10-16 08:11:46','2015-10-16 09:59:50'),(37,4,'simple','smagold1milkpowdertin400g',0,0,'2015-10-16 08:11:48','2015-10-16 09:59:53'),(38,4,'simple','nestlecerelacmixedfruit300g',0,0,'2015-10-16 08:21:29','2015-10-16 11:08:46'),(39,4,'simple','nestlecerelacdhalveget.rice300g',0,0,'2015-10-16 08:21:35','2015-10-16 11:04:27'),(40,4,'simple','nestlecerelacvegetable&rice300g',0,0,'2015-10-16 08:21:42','2015-10-16 11:04:35'),(41,4,'simple','nestlecerelacwheatapple300g',0,0,'2015-10-16 08:46:16','2015-10-16 10:53:11'),(42,4,'simple','nestlecerelacredricebabymeal300g',0,0,'2015-10-16 08:46:18','2015-10-16 10:53:13'),(43,4,'simple','nestlenestumfruitscereal240g',0,0,'2015-10-16 08:46:20','2015-10-16 10:53:15'),(44,4,'simple','nestlegreengramcereal240g',0,0,'2015-10-16 08:46:23','2015-10-16 10:53:17'),(45,4,'simple','heinzbabydessertpear&ban.4170g',0,0,'2015-10-16 08:46:33','2015-10-16 10:53:20'),(46,4,'simple','heinzbabycustardvanila6110g',0,0,'2015-10-16 08:46:35','2015-10-16 10:53:22'),(47,4,'simple','heinzbabycustardstr.&ban.6110g',0,0,'2015-10-16 08:46:37','2015-10-16 10:53:23'),(48,4,'simple','heinzbabycustardcaramel6120g',0,0,'2015-10-16 08:46:39','2015-10-16 10:53:25'),(49,4,'simple','heinzbabyyoghurtfruitsa.6110g',0,0,'2015-10-16 08:46:40','2015-10-16 10:53:27'),(50,4,'simple','heinzbabygelapple&bla.cu.6110g',0,0,'2015-10-16 08:46:42','2015-10-16 10:53:29'),(51,4,'simple','heinzbabydessertpear&ban.4110g',0,0,'2015-10-16 08:46:44','2015-10-16 10:53:31'),(52,4,'simple','bellybeesbabyf.papaya&man.150g',0,0,'2015-10-16 08:46:46','2015-10-16 10:53:33'),(53,4,'simple','bellybeesbabyfoodmango150g',0,0,'2015-10-16 08:46:48','2015-10-16 10:53:35'),(54,4,'simple','cow/gatemushr.&chi.withnood.250g',0,0,'2015-10-16 08:47:03','2015-10-16 10:53:38'),(55,4,'simple','cow/gatechicken&tastyvegpot200g',0,0,'2015-10-16 08:47:06','2015-10-16 10:53:40'),(56,4,'simple','cow/gatebabyf.ricepudding125g',0,0,'2015-10-16 08:47:08','2015-10-16 10:53:42'),(57,4,'simple','heinzbabymealpum.&sw.co.4110g',0,0,'2015-10-16 08:47:10','2015-10-16 10:53:44'),(58,4,'simple','heinzfarleysruskbanana150g',0,0,'2015-10-16 08:47:28','2015-10-16 10:53:46'),(59,4,'simple','heinzfarleysruskorange150g',0,0,'2015-10-16 08:47:30','2015-10-16 10:53:48'),(60,4,'simple','heinzfarleysruskoriginal150g',0,0,'2015-10-16 08:47:33','2015-10-16 10:53:50'),(61,4,'simple','heinzfarleysruskapple60g',0,0,'2015-10-16 08:47:34','2015-10-16 10:53:52'),(62,4,'simple','muncheebabyrusk100g',0,0,'2015-10-16 08:47:37','2015-10-16 10:53:54'),(63,4,'simple','littleliongoldencowrusk110g',0,0,'2015-10-16 08:47:38','2015-10-16 10:53:56'),(64,4,'simple','muncheebabyrusk60g',0,0,'2015-10-16 08:47:40','2015-10-16 10:53:58'),(65,4,'simple','littleliong/cowruskoriginal70g',0,0,'2015-10-16 08:47:42','2015-10-16 10:54:00'),(66,4,'simple','littleliong/cowruskbanana70g',0,0,'2015-10-16 08:47:44','2015-10-16 10:54:02'),(67,4,'simple','kidsjoylargebowlforkspoona1301',0,0,'2015-10-16 08:49:13','2015-10-16 10:54:05'),(68,4,'simple','kidsjoyspillproofcupa807',0,0,'2015-10-16 08:49:16','2015-10-16 10:54:07'),(69,4,'simple','kidsjoynipplebottlebrusha1405',0,0,'2015-10-16 08:49:17','2015-10-16 10:54:09'),(70,4,'simple','farlingumsootherrubberbf141',0,0,'2015-10-16 08:49:19','2015-10-16 10:54:11'),(71,4,'simple','drypersdrypantslargediapers36s',0,0,'2015-10-16 08:54:27','2015-10-16 10:54:13'),(72,4,'simple','softlovebabydiapersxl54s',0,0,'2015-10-16 08:54:29','2015-10-16 10:54:15'),(73,4,'simple','softlovebanydiaperslarge54s',0,0,'2015-10-16 08:54:31','2015-10-16 10:54:17'),(74,4,'simple','softlovebabydiapersmedium54s',0,0,'2015-10-16 08:54:33','2015-10-16 10:54:19'),(75,4,'simple','drypersweeweedryxl36s',0,0,'2015-10-16 08:54:35','2015-10-16 10:54:21'),(76,4,'simple','drypersdrypantsmediumdiapers24s',0,0,'2015-10-16 08:54:37','2015-10-16 10:54:23'),(77,4,'simple','pampersbabydiaperslarge32s',0,0,'2015-10-16 08:54:39','2015-10-16 10:54:25'),(78,4,'simple','pampersdiapermedium34s',0,0,'2015-10-16 08:54:41','2015-10-16 10:54:27'),(79,4,'simple','drypersweeweedryxxl16s',0,0,'2015-10-16 08:54:42','2015-10-16 10:54:29'),(80,4,'simple','softlovebabydiapersmedium12s',0,0,'2015-10-16 08:54:44','2015-10-16 10:54:31'),(81,4,'simple','softlovebabydiaperslarge11s',0,0,'2015-10-16 08:54:46','2015-10-16 10:54:33'),(82,4,'simple','softlovebabydiapersxl10s',0,0,'2015-10-16 08:54:48','2015-10-16 10:54:35'),(83,4,'simple','j&jbabyskincarewipes80s',0,0,'2015-10-16 08:54:59','2015-10-16 10:54:38'),(84,4,'simple','farlinwetwipesrefillantrash85s',0,0,'2015-10-16 08:55:01','2015-10-16 10:54:40'),(85,4,'simple','babycheramynappywashpowdernappy1kg',0,0,'2015-10-16 08:55:04','2015-10-16 10:54:42'),(86,4,'simple','cutebabybabywipes80s',0,0,'2015-10-16 08:55:06','2015-10-16 10:54:44'),(87,4,'simple','aquawipebabywipes40s',0,0,'2015-10-16 08:55:09','2015-10-16 10:54:46'),(88,4,'simple','teepolkidsdishwashodourless500ml',0,0,'2015-10-16 08:55:11','2015-10-16 10:54:48'),(89,4,'simple','j&jbabybutterflycarepack',0,0,'2015-10-16 08:55:17','2015-10-16 10:54:50'),(90,4,'simple','j&jbabyduckcarepack',0,0,'2015-10-16 08:55:19','2015-10-16 10:54:52'),(91,4,'simple','j&jbabylotio.alo/vite500mlmal',0,0,'2015-10-16 08:55:26','2015-10-16 10:54:55'),(92,4,'simple','j&jbabysoftpinkcream100g',0,0,'2015-10-16 08:55:29','2015-10-16 10:54:57'),(93,4,'simple','j&jbabyavocadohairoil200ml',0,0,'2015-10-16 08:55:31','2015-10-16 10:55:00'),(94,4,'simple','j&jbabyshampoosoft&shiny200ml',0,0,'2015-10-16 08:55:33','2015-10-16 10:55:02'),(95,4,'simple','j&jbabylotionalo/vite200ml',0,0,'2015-10-16 08:55:36','2015-10-16 10:55:05'),(96,4,'simple','j&jbabybathmilkrice200ml',0,0,'2015-10-16 08:55:38','2015-10-16 10:55:07'),(97,4,'simple','j&jbabyregularbath200ml',0,0,'2015-10-16 08:55:40','2015-10-16 10:55:10'),(98,4,'simple','j&jbabybathpeachvie200mlmal',0,0,'2015-10-16 08:55:43','2015-10-16 10:55:12'),(99,4,'simple','babycher.cologne100mlbuy2&1free',0,0,'2015-10-16 08:55:45','2015-10-16 10:55:14'),(100,4,'simple','j&jbabylotion200ml(ind)',0,0,'2015-10-16 08:55:48','2015-10-16 10:55:17'),(101,4,'simple','littleprin.sh/geljadegarden250ml',0,0,'2015-10-16 08:55:50','2015-10-16 10:55:19'),(102,4,'simple','littleprin.sh/gelrosepetal250ml',0,0,'2015-10-16 08:55:52','2015-10-16 10:55:21'),(103,4,'simple','shaisafeeyebrowrazor3s',0,0,'2015-10-16 08:56:00','2015-10-16 10:55:24'),(104,4,'simple','dorcoshaisafeeyebrowrazor',0,0,'2015-10-16 08:56:02','2015-10-16 10:55:26'),(105,4,'simple','godrejaertwistcarfragrancefresh',0,0,'2015-10-16 08:56:11','2015-10-16 10:55:29'),(106,4,'simple','godrejaertwistcarfragrancecool',0,0,'2015-10-16 08:56:13','2015-10-16 10:55:31'),(107,4,'simple','godrejaertwistcarfragrancepetal',0,0,'2015-10-16 08:56:16','2015-10-16 10:55:33'),(108,4,'simple','ambipurcara/fstr.packlav/spa7ml',0,0,'2015-10-16 08:56:18','2015-10-16 10:55:35'),(109,4,'simple','ambipurcarair/fstr.packaqua7ml',0,0,'2015-10-16 08:56:21','2015-10-16 10:55:37'),(110,4,'simple','godrejaerclickcarfragrancefresh',0,0,'2015-10-16 08:56:23','2015-10-16 10:48:15'),(111,4,'simple','godrejaerclickcarfragrancecool',0,0,'2015-10-16 08:56:25','2015-10-16 10:48:18'),(112,4,'simple','godrejaerclickmusk9ml',0,0,'2015-10-16 08:56:28','2015-10-16 10:48:22'),(113,4,'simple','gladeairfreshenersportcoolwater7ml',0,0,'2015-10-16 08:56:30','2015-10-16 10:48:26'),(114,4,'simple','gladea/fresh.sporttrop/fresh7ml',0,0,'2015-10-16 08:56:32','2015-10-16 10:48:30'),(115,4,'simple','minipoppycarairfreshener10ml',0,0,'2015-10-16 08:56:34','2015-10-16 10:48:34'),(116,4,'simple','ntccleaningclothpvachamois',0,0,'2015-10-16 08:56:43','2015-10-16 10:48:40'),(117,4,'simple','malcarwashmopcomplete',0,0,'2015-10-16 08:56:46','2015-10-16 10:48:44'),(118,4,'simple','strtireshine500ml',0,0,'2015-10-16 08:56:48','2015-10-16 10:48:48'),(119,4,'simple','wonderwipemicrofiberclothcar',0,0,'2015-10-16 08:56:50','2015-10-16 10:48:52'),(120,4,'simple','britolcarinteriorcleaner475ml',0,0,'2015-10-16 08:56:53','2015-10-16 10:48:56'),(121,4,'simple','strcarwaxliquid225ml',0,0,'2015-10-16 08:56:55','2015-10-16 10:49:00'),(122,4,'simple','strcarpetupholsteryhightech500ml',0,0,'2015-10-16 08:56:57','2015-10-16 10:49:03'),(123,4,'simple','strpolishdashboard118ml',0,0,'2015-10-16 08:57:00','2015-10-16 10:49:05'),(124,4,'simple','dashcarwash800ml',0,0,'2015-10-16 08:57:02','2015-10-16 10:49:08'),(125,4,'simple','dashoriginalshine200ml',0,0,'2015-10-16 08:57:04','2015-10-16 10:49:10'),(126,4,'simple','britolleathercareliquid300ml',0,0,'2015-10-16 08:57:06','2015-10-16 10:49:12'),(127,4,'simple','britolcarwash500ml',0,0,'2015-10-16 08:57:08','2015-10-16 10:49:15'),(128,4,'simple','strradiatorcoolantengine1l',0,0,'2015-10-16 08:57:15','2015-10-16 10:49:17'),(129,4,'simple','airwicka/fre.aerosolvel/rose249ml',0,0,'2015-10-16 08:57:25','2015-10-16 10:49:20'),(130,4,'simple','airwickliquidspraylavender475ml',0,0,'2015-10-16 08:57:27','2015-10-16 10:49:22'),(131,4,'simple','airwickliquidsprayjasmine475ml',0,0,'2015-10-16 08:57:29','2015-10-16 10:49:24'),(132,4,'simple','airwickliquidsprayeng/rose475ml',0,0,'2015-10-16 08:57:32','2015-10-16 10:49:26'),(133,4,'simple','gladea/ftouchf.wildlavender12ml',0,0,'2015-10-16 08:57:34','2015-10-16 10:49:28'),(134,4,'simple','kchoicea/freshsprayjasmine475ml',0,0,'2015-10-16 08:57:36','2015-10-16 10:49:30'),(135,4,'simple','malbroomwithstickxl',0,0,'2015-10-16 08:57:53','2015-10-16 10:49:33'),(136,4,'simple','malmopwithplastichandle',0,0,'2015-10-16 08:57:55','2015-10-16 10:49:35'),(137,4,'simple','kitcheneazydishwand60g',0,0,'2015-10-16 08:57:57','2015-10-16 10:49:37'),(138,4,'simple','malfloorwipersmall',0,0,'2015-10-16 08:57:59','2015-10-16 10:49:39'),(139,4,'simple','maldustpansetlarge',0,0,'2015-10-16 08:58:02','2015-10-16 10:49:40'),(140,4,'simple','malekalbroom',0,0,'2015-10-16 08:58:04','2015-10-16 10:49:42'),(141,4,'simple','h&sbroomwithstickhb001',0,0,'2015-10-16 08:58:07','2015-10-16 10:49:44'),(142,4,'simple','malfloorbrushwithhandle',0,0,'2015-10-16 08:58:09','2015-10-16 10:49:46'),(143,4,'simple','malscavengerbroom',0,0,'2015-10-16 08:58:11','2015-10-16 10:49:48'),(144,4,'simple','ravipotbrushda004blpv',0,0,'2015-10-16 08:58:13','2015-10-16 10:49:50'),(145,4,'simple','ravimultipurposescrubsc025dpv',0,0,'2015-10-16 08:58:15','2015-10-16 10:49:52'),(146,4,'simple','h&sclothpegsw/bottle20s',0,0,'2015-10-16 08:58:17','2015-10-16 10:49:54'),(147,4,'simple','vimdishwashliquidantibacterial500ml',0,0,'2015-10-16 08:58:22','2015-10-16 10:49:57'),(148,4,'simple','vimdishwashliquid500ml',0,0,'2015-10-16 08:58:24','2015-10-16 10:49:59'),(149,4,'simple','teepoldishwashgellime500ml',0,0,'2015-10-16 08:58:26','2015-10-16 10:50:01'),(150,4,'simple','teepoldishwashliquidgelorange500ml',0,0,'2015-10-16 08:58:28','2015-10-16 10:50:03'),(151,4,'simple','dashglizdishwashlimeliquid500ml',0,0,'2015-10-16 08:58:30','2015-10-16 10:50:05'),(152,4,'simple','kchoicedishwash500ml',0,0,'2015-10-16 08:58:32','2015-10-16 10:50:07'),(153,4,'simple','britoltipscouringpowder600g',0,0,'2015-10-16 08:58:34','2015-10-16 10:50:09'),(154,4,'simple','vimdishwashpowderdubbleaction650g',0,0,'2015-10-16 08:58:36','2015-10-16 10:50:10'),(155,4,'simple','kchoicedishwashpowder650g',0,0,'2015-10-16 08:58:38','2015-10-16 10:50:12'),(156,4,'simple','britoldishwashbar200g',0,0,'2015-10-16 08:58:40','2015-10-16 10:50:14'),(157,4,'simple','kchoicedishwashbar200g',0,0,'2015-10-16 08:58:42','2015-10-16 10:50:16'),(158,4,'simple','britoldishwashbar100g',0,0,'2015-10-16 08:58:44','2015-10-16 10:50:18'),(159,4,'simple','dettolliquidlarge500ml',0,0,'2015-10-16 08:58:49','2015-10-16 10:50:21'),(160,4,'simple','lysolcitrus950ml',0,0,'2015-10-16 08:58:51','2015-10-16 10:50:23'),(161,4,'simple','lysolfloral950ml',0,0,'2015-10-16 08:58:53','2015-10-16 10:50:25'),(162,4,'simple','mrmusclekitchencleaner500ml',0,0,'2015-10-16 08:58:55','2015-10-16 10:50:27'),(163,4,'simple','lysolcitrus500ml',0,0,'2015-10-16 08:58:57','2015-10-16 10:50:29'),(164,4,'simple','lysolfloral500ml',0,0,'2015-10-16 08:58:59','2015-10-16 10:50:31'),(165,4,'simple','lysoldisinfectantlavender500ml',0,0,'2015-10-16 08:59:01','2015-10-16 10:50:32'),(166,4,'simple','lysolpineallpurposeclean500ml',0,0,'2015-10-16 08:59:03','2015-10-16 10:50:34'),(167,4,'simple','lankemfenol750ml',0,0,'2015-10-16 08:59:05','2015-10-16 10:50:36'),(168,4,'simple','dashcreamcleanser500ml',0,0,'2015-10-16 08:59:07','2015-10-16 10:50:38'),(169,4,'simple','colinglasshouseholdcleaner500ml',0,0,'2015-10-16 08:59:26','2015-10-16 10:50:41'),(170,4,'simple','kchoiceglasscleaner500ml',0,0,'2015-10-16 08:59:28','2015-10-16 10:50:43'),(171,4,'simple','mrmusclefl/cleanerflor.per.500ml',0,0,'2015-10-16 08:59:31','2015-10-16 10:50:45'),(172,4,'simple','dashtilecleaner500ml',0,0,'2015-10-16 08:59:33','2015-10-16 10:50:47'),(173,4,'simple','kchoicetilecleanr500ml',0,0,'2015-10-16 08:59:35','2015-10-16 10:50:48'),(174,4,'simple','kiwidranex375g',0,0,'2015-10-16 08:59:41','2015-10-16 10:50:51'),(175,4,'simple','harpicfreshpine750ml',0,0,'2015-10-16 08:59:43','2015-10-16 10:50:53'),(176,4,'simple','harpicfreshfloral750ml',0,0,'2015-10-16 08:59:45','2015-10-16 10:50:55'),(177,4,'simple','harpicfreshpine500ml',0,0,'2015-10-16 08:59:47','2015-10-16 10:50:57'),(178,4,'simple','harpicfreshfloral500ml',0,0,'2015-10-16 08:59:49','2015-10-16 10:50:59'),(179,4,'simple','kiwikleenflushsuperactive500ml',0,0,'2015-10-16 08:59:51','2015-10-16 10:51:01'),(180,4,'simple','kchoicet/bowlcleanerfloral500ml',0,0,'2015-10-16 08:59:53','2015-10-16 10:51:03'),(181,4,'simple','kchoicetoiletbowlcleanerpower500ml',0,0,'2015-10-16 08:59:55','2015-10-16 10:51:05'),(182,4,'simple','aconpartyfavorspapercupspink6s',0,0,'2015-10-16 09:00:00','2015-10-16 10:51:08'),(183,4,'simple','kchoiceplasticcups12s',0,0,'2015-10-16 09:00:02','2015-10-16 10:51:10'),(184,4,'simple','acondisposablespoons50s',0,0,'2015-10-16 09:00:06','2015-10-16 10:51:12'),(185,4,'simple','safepacknife25s',0,0,'2015-10-16 09:00:08','2015-10-16 10:51:14'),(186,4,'simple','aconpartyfavorsspoons12s',0,0,'2015-10-16 09:00:10','2015-10-16 10:51:16'),(187,4,'simple','kchoicestraws25s',0,0,'2015-10-16 09:00:12','2015-10-16 10:51:18'),(188,4,'simple','safepac7inchesplatesup25s',0,0,'2015-10-16 09:00:17','2015-10-16 10:51:20'),(189,4,'simple','pranjapaneemedi.t/picksholder100s',0,0,'2015-10-16 09:00:19','2015-10-16 10:51:22'),(190,4,'simple','floradisneypaperplates10s',0,0,'2015-10-16 09:00:20','2015-10-16 10:51:24'),(191,4,'simple','pranjapaneemedi.t/picksrefill100s',0,0,'2015-10-16 09:00:22','2015-10-16 10:51:26'),(192,4,'simple','florawoodentoothpicks500s',0,0,'2015-10-16 09:00:24','2015-10-16 10:51:28'),(193,4,'simple','pranjapaneecinnamontoothpicks40s',0,0,'2015-10-16 09:00:26','2015-10-16 10:51:30'),(194,4,'simple','florabarbecuesticks6100s',0,0,'2015-10-16 09:00:28','2015-10-16 10:51:32'),(195,4,'simple','floratoothpicksplasticjar200s',0,0,'2015-10-16 09:00:30','2015-10-16 10:51:34'),(196,4,'simple','kchoicepaperplates7inch25s',0,0,'2015-10-16 09:00:32','2015-10-16 10:51:36'),(197,4,'simple','florawoodentoothpicks100s',0,0,'2015-10-16 09:00:34','2015-10-16 10:51:38'),(198,4,'simple','cardinalfloorpolishbrown750g',0,0,'2015-10-16 09:00:39','2015-10-16 10:51:41'),(199,4,'simple','mansionwaxwhite600g',0,0,'2015-10-16 09:00:41','2015-10-16 10:51:43'),(200,4,'simple','cardinalredfloorpolish800g',0,0,'2015-10-16 09:00:43','2015-10-16 10:51:45'),(201,4,'simple','kchoicegarbagebagyellowxl10s',0,0,'2015-10-16 09:00:51','2015-10-16 10:51:47'),(202,4,'simple','kchoicegarbagebagbluexl10s',0,0,'2015-10-16 09:00:53','2015-10-16 10:51:49'),(203,4,'simple','kchoicegarbagebagxl20x8x3610s',0,0,'2015-10-16 09:00:55','2015-10-16 10:51:51'),(204,4,'simple','aconpartydisposableglove100s',0,0,'2015-10-16 09:01:02','2015-10-16 10:51:54'),(205,4,'simple','rusiruglovesdoublesidedot',0,0,'2015-10-16 09:01:04','2015-10-16 10:51:56'),(206,4,'simple','oxypurafacemaskcitymedium',0,0,'2015-10-16 09:01:09','2015-10-16 10:51:58'),(207,4,'simple','oxypurafacemaskcitylarge',0,0,'2015-10-16 09:01:12','2015-10-16 10:52:00'),(208,4,'simple','ikleenlintroller60sheet',0,0,'2015-10-16 09:03:12','2015-10-16 10:52:03'),(209,4,'simple','ikleenlintroller20sheet',0,0,'2015-10-16 09:03:15','2015-10-16 10:52:05'),(210,4,'simple','ikleenrefill60seconomypack',0,0,'2015-10-16 09:03:17','2015-10-16 10:52:07'),(211,4,'simple','kiwishoeshinebrush',0,0,'2015-10-16 09:03:22','2015-10-16 10:52:09'),(212,4,'simple','kiwishoeshinespongeneutral',0,0,'2015-10-16 09:03:24','2015-10-16 10:52:11'),(213,4,'simple','kiwishoeshinespongeblack',0,0,'2015-10-16 09:03:26','2015-10-16 10:52:13'),(214,4,'simple','kiwishoepolishblack75ml',0,0,'2015-10-16 09:03:28','2015-10-16 10:52:15'),(215,4,'simple','kiwishoepolishneutral75ml',0,0,'2015-10-16 09:03:30','2015-10-16 10:52:17'),(216,4,'simple','kiwicasualshoepollishbrown75ml',0,0,'2015-10-16 09:03:32','2015-10-16 10:52:19'),(217,4,'simple','silvershinespongeblack6ml',0,0,'2015-10-16 09:03:34','2015-10-16 10:52:21'),(218,4,'simple','kiwishoepolishblack36g',0,0,'2015-10-16 09:03:36','2015-10-16 10:52:23'),(219,4,'simple','kiwishoewhitener120g',0,0,'2015-10-16 09:03:38','2015-10-16 10:52:25'),(220,4,'simple','qualityshinefurniturepolish450ml',0,0,'2015-10-16 09:03:43','2015-10-16 10:52:28'),(221,4,'simple','brassomedium200ml',0,0,'2015-10-16 09:03:45','2015-10-16 10:52:31'),(222,4,'simple','cleanappm/purpo.cleaningwiperoll',0,0,'2015-10-16 09:03:50','2015-10-16 10:52:34'),(223,4,'simple','wonderwipemicrofiberclothgeneral',0,0,'2015-10-16 09:03:52','2015-10-16 10:52:36'),(224,4,'simple','comfortf/cond.ultrapurebaby800ml',0,0,'2015-10-16 09:04:05','2015-10-16 09:04:05'),(225,4,'simple','comfortfabriccond.antibac.800ml',0,0,'2015-10-16 09:04:07','2015-10-16 09:04:07'),(226,4,'simple','tidede.powderjasmine&rose2kg',0,0,'2015-10-16 09:04:21','2015-10-16 09:04:21'),(227,4,'simple','safematicliquiddetergent1l',0,0,'2015-10-16 09:04:23','2015-10-16 09:04:23'),(228,4,'simple','surfexcelmaticw/pfrontload1kg',0,0,'2015-10-16 09:04:25','2015-10-16 09:04:25'),(229,4,'simple','bubblecompactdetergentpowder1kg',0,0,'2015-10-16 09:04:27','2015-10-16 09:04:27'),(230,4,'simple','surfexcelmaticwashingpowder1kg',0,0,'2015-10-16 09:04:29','2015-10-16 09:04:29'),(231,4,'simple','tidedetergentpowderjasminrose1kg',0,0,'2015-10-16 09:04:31','2015-10-16 09:04:31'),(232,4,'simple','surfexcelw/powderxtraclean1kg',0,0,'2015-10-16 09:04:33','2015-10-16 09:04:33'),(233,4,'simple','rinwashingpowder1kg',0,0,'2015-10-16 09:04:35','2015-10-16 09:04:35'),(234,4,'simple','surfexcelmaticwashingpowder500g',0,0,'2015-10-16 09:04:37','2015-10-16 09:04:37'),(235,4,'simple','bubblecompactdetergentpowder500g',0,0,'2015-10-16 09:04:39','2015-10-16 09:04:39'),(236,4,'simple','tidede.powderjasmine&rose500g',0,0,'2015-10-16 09:04:41','2015-10-16 09:04:41'),(237,4,'simple','surfexcelw/powderxtraclean500g',0,0,'2015-10-16 09:04:43','2015-10-16 09:04:43'),(238,4,'simple','pierrotsensitivemouthwash500ml',0,0,'2015-10-16 09:04:49','2015-10-16 09:04:49'),(239,4,'simple','pierrotjuniormouthwash500ml',0,0,'2015-10-16 09:04:51','2015-10-16 09:04:51'),(240,4,'simple','pierrotantiplaquemouthwash500ml',0,0,'2015-10-16 09:04:53','2015-10-16 09:04:53'),(241,4,'simple','listerinefreshburstmouthwash250ml',0,0,'2015-10-16 09:04:55','2015-10-16 09:04:55'),(242,4,'simple','listerineoriginalmouthwash250ml',0,0,'2015-10-16 09:04:57','2015-10-16 09:04:57'),(243,4,'simple','freshbreathmouthwashspray100ml',0,0,'2015-10-16 09:04:59','2015-10-16 09:04:59'),(244,4,'simple','koolnfreshmouthwash250ml',0,0,'2015-10-16 09:05:01','2015-10-16 09:05:01'),(245,4,'simple','clogardmouthwash200ml',0,0,'2015-10-16 09:05:03','2015-10-16 09:05:03'),(246,4,'simple','listerinecoolmintmouthwash80ml',0,0,'2015-10-16 09:05:04','2015-10-16 09:05:04'),(247,4,'simple','listerinefreshburstmouthwash80ml',0,0,'2015-10-16 09:05:06','2015-10-16 09:05:06'),(248,4,'simple','listerineoriginalmouthwash80ml',0,0,'2015-10-16 09:05:08','2015-10-16 09:05:08'),(249,4,'simple','pierrotstrawberrydentalgel50ml',0,0,'2015-10-16 09:05:13','2015-10-16 09:05:13'),(250,4,'simple','colgatetotalminttoothpaste140g',0,0,'2015-10-16 09:05:15','2015-10-16 09:05:15'),(251,4,'simple','sensodynerapidrelieftoothpaste80g',0,0,'2015-10-16 09:05:17','2015-10-16 09:05:17'),(252,4,'simple','sensodynetp.total/multicare100g',0,0,'2015-10-16 09:05:18','2015-10-16 09:05:18'),(253,4,'simple','sensodynetoothpastecoolgel100g',0,0,'2015-10-16 09:05:20','2015-10-16 09:05:20'),(254,4,'simple','sensodynefreshminttoothpaste100g',0,0,'2015-10-16 09:05:22','2015-10-16 09:05:22'),(255,4,'simple','colgatemaxfreshtoothpastered150g',0,0,'2015-10-16 09:05:24','2015-10-16 09:05:24'),(256,4,'simple','colgatemaxfreshtoothpastegreen150g',0,0,'2015-10-16 09:05:26','2015-10-16 09:05:26'),(257,4,'simple','followmekidstoothpaste50g',0,0,'2015-10-16 09:05:28','2015-10-16 09:05:28'),(258,4,'simple','kodomostrawberrytoothpaste45g',0,0,'2015-10-16 09:05:30','2015-10-16 09:05:30'),(259,4,'simple','kodomomixedfruittoothpaste45g',0,0,'2015-10-16 09:05:32','2015-10-16 09:05:32'),(260,4,'simple','sensodynerapidrelieftoothpaste40g',0,0,'2015-10-16 09:05:33','2015-10-16 09:05:33'),(261,4,'simple','pierrotsensitivetoothbrushextrasoft',0,0,'2015-10-16 09:05:44','2015-10-16 09:05:44'),(262,4,'simple','pierrotenergytoothbrushmedium',0,0,'2015-10-16 09:05:46','2015-10-16 09:05:46'),(263,4,'simple','pierrotbabytoothbrush',0,0,'2015-10-16 09:05:48','2015-10-16 09:05:48'),(264,4,'simple','pierrotgusytoothbrush',0,0,'2015-10-16 09:05:49','2015-10-16 09:05:49'),(265,4,'simple','pierrotenergysofttoothbrush',0,0,'2015-10-16 09:05:52','2015-10-16 09:05:52'),(266,4,'simple','pierrotmonstertoothbrushsuavesoft',0,0,'2015-10-16 09:05:54','2015-10-16 09:05:54'),(267,4,'simple','dentacomforttoothbrushdoublepack',0,0,'2015-10-16 09:05:56','2015-10-16 09:05:56'),(268,4,'simple','dentacomforttoothbrushmedium',0,0,'2015-10-16 09:05:58','2015-10-16 09:05:58'),(269,4,'simple','clogardsmartplustoothbrush',0,0,'2015-10-16 09:06:00','2015-10-16 09:06:00'),(270,4,'simple','signalexperttoothbrush',0,0,'2015-10-16 09:06:03','2015-10-16 09:06:03'),(271,4,'simple','clogardchootytoothbrush',0,0,'2015-10-16 09:06:05','2015-10-16 09:06:05'),(272,4,'simple','clogardsmarttoothbrush',0,0,'2015-10-16 09:06:07','2015-10-16 09:06:07'),(273,4,'simple','aquawipehandwipesantibacterial',0,0,'2015-10-16 09:06:12','2015-10-16 09:06:12'),(274,4,'simple','florafacialtissues200s2ply',0,0,'2015-10-16 09:06:14','2015-10-16 09:06:14'),(275,4,'simple','florafacialtissues160s',0,0,'2015-10-16 09:06:16','2015-10-16 09:06:16'),(276,4,'simple','florahygienicwetwipes10s',0,0,'2015-10-16 09:06:18','2015-10-16 09:06:18'),(277,4,'simple','kchoicefacialtissues160s',0,0,'2015-10-16 09:06:20','2015-10-16 09:06:20'),(278,4,'simple','florahandkerchi.tissue2plyv/pack',0,0,'2015-10-16 09:06:22','2015-10-16 09:06:22'),(279,4,'simple','florafacialtissues100s',0,0,'2015-10-16 09:06:24','2015-10-16 09:06:24'),(280,4,'simple','kchoicefacialtissues100s',0,0,'2015-10-16 09:06:26','2015-10-16 09:06:26'),(281,4,'simple','kchoicetalltissueboxcolor80s',0,0,'2015-10-16 09:06:28','2015-10-16 09:06:28'),(282,4,'simple','florafacialtissues50s',0,0,'2015-10-16 09:06:30','2015-10-16 09:06:30'),(283,4,'simple','florahandkerchieftissues1',0,0,'2015-10-16 09:06:32','2015-10-16 09:06:32'),(284,4,'simple','kchoicepocketfacialtissues15s',0,0,'2015-10-16 09:06:33','2015-10-16 09:06:33'),(285,4,'simple','nimexkitch/toweloff/whi.2s',0,0,'2015-10-16 09:06:38','2015-10-16 09:06:38'),(286,4,'simple','florakitchentowelstwin',0,0,'2015-10-16 09:06:40','2015-10-16 09:06:40'),(287,4,'simple','florahandtowelmultifold200s',0,0,'2015-10-16 09:06:45','2015-10-16 09:06:45'),(288,4,'simple','nimexpaper/serviette1ply100',0,0,'2015-10-16 09:06:47','2015-10-16 09:06:47'),(289,4,'simple','floratoiletrolls10s',0,0,'2015-10-16 09:06:52','2015-10-16 09:06:52'),(290,4,'simple','kchoicetoiletrolls10s',0,0,'2015-10-16 09:06:54','2015-10-16 09:06:54'),(291,4,'simple','floratoiletrolls6pack',0,0,'2015-10-16 09:06:56','2015-10-16 09:06:56'),(292,4,'simple','floratoiletrollsjumbo4s',0,0,'2015-10-16 09:06:58','2015-10-16 09:06:58'),(293,4,'simple','kchoicetoiletrolls4s',0,0,'2015-10-16 09:07:00','2015-10-16 09:07:00'),(294,4,'simple','nimextoiletrolls2s',0,0,'2015-10-16 09:07:02','2015-10-16 09:07:02'),(295,4,'simple','floratoiletrolltwinpack',0,0,'2015-10-16 09:07:04','2015-10-16 09:07:04'),(296,4,'simple','kchoicetoiletrolls2s',0,0,'2015-10-16 09:07:06','2015-10-16 09:07:06'),(297,4,'simple','nimextoiletrollsingle',0,0,'2015-10-16 09:07:08','2015-10-16 09:07:08'),(298,4,'simple','floratoiletrollssingle',0,0,'2015-10-16 09:07:10','2015-10-16 09:07:10'),(299,4,'simple','floratoiletrollembosse3ply',0,0,'2015-10-16 09:07:12','2015-10-16 09:07:12'),(300,4,'simple','kchoicetoiletrolls1s',0,0,'2015-10-16 09:07:14','2015-10-16 09:07:14'),(301,4,'simple','kchoiceballoonsred9in25s',0,0,'2015-10-16 09:07:19','2015-10-16 09:07:19'),(302,4,'simple','kchoiceballoonsassorted9in25s',0,0,'2015-10-16 09:07:21','2015-10-16 09:07:21'),(303,4,'simple','aconpartybdaycandlesetstar',0,0,'2015-10-16 09:07:25','2015-10-16 09:07:25'),(304,4,'simple','aconpartybdaycandlesetletter',0,0,'2015-10-16 09:07:27','2015-10-16 09:07:27'),(305,4,'simple','aconsnowsprayparty3oz',0,0,'2015-10-16 09:07:33','2015-10-16 09:07:33'),(306,4,'simple','aconpartyfavorsglowlightstick',0,0,'2015-10-16 09:07:35','2015-10-16 09:07:35'),(307,4,'simple','aconp/favoursbdaybannerasst',0,0,'2015-10-16 09:07:37','2015-10-16 09:07:37'),(308,4,'simple','aztecgoldsparklersjunior10s',0,0,'2015-10-16 09:07:39','2015-10-16 09:07:39'),(309,4,'simple','greenhousepaperribbongold&silver',0,0,'2015-10-16 09:07:40','2015-10-16 09:07:40'),(310,4,'simple','greenhousep/ribbonasso.3colour',0,0,'2015-10-16 09:07:42','2015-10-16 09:07:42'),(311,4,'simple','aconpartyfavorscrapestrips30s',0,0,'2015-10-16 09:07:44','2015-10-16 09:07:44'),(312,4,'simple','actifitadultdiaperlarge10s',0,0,'2015-10-16 09:07:50','2015-10-16 09:07:50'),(313,4,'simple','actifitadultdiapermedium10s',0,0,'2015-10-16 09:07:52','2015-10-16 09:07:52');
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_entity_datetime`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DTIME_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=836 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Datetime Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_entity_datetime`
--

LOCK TABLES `grocery_bag_catalog_product_entity_datetime` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_datetime` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_product_entity_datetime` VALUES (62,98,0,26,NULL),(63,91,0,26,NULL),(64,98,0,27,NULL),(65,91,0,27,NULL),(66,98,0,28,NULL),(67,91,0,28,NULL),(68,98,0,29,NULL),(69,91,0,29,NULL),(70,98,0,30,NULL),(71,91,0,30,NULL),(72,98,0,31,NULL),(73,91,0,31,NULL),(74,98,0,32,NULL),(75,91,0,32,NULL),(76,98,0,33,NULL),(77,91,0,33,NULL),(78,98,0,34,NULL),(79,91,0,34,NULL),(80,98,0,35,NULL),(81,91,0,35,NULL),(82,98,0,36,NULL),(83,91,0,36,NULL),(84,98,0,37,NULL),(85,91,0,37,NULL),(86,76,0,26,NULL),(87,76,0,27,NULL),(88,76,0,28,NULL),(89,76,0,29,NULL),(90,76,0,30,NULL),(91,76,0,31,NULL),(92,76,0,32,NULL),(93,76,0,33,NULL),(94,76,0,34,NULL),(95,76,0,35,NULL),(96,76,0,36,NULL),(97,76,0,37,NULL),(98,98,0,38,NULL),(99,91,0,38,NULL),(100,98,0,39,NULL),(101,91,0,39,NULL),(102,98,0,40,NULL),(103,91,0,40,NULL),(104,76,0,38,NULL),(105,76,0,39,NULL),(106,76,0,40,NULL),(107,98,0,41,NULL),(108,91,0,41,NULL),(109,98,0,42,NULL),(110,91,0,42,NULL),(111,98,0,43,NULL),(112,91,0,43,NULL),(113,98,0,44,NULL),(114,91,0,44,NULL),(115,98,0,45,NULL),(116,91,0,45,NULL),(117,98,0,46,NULL),(118,91,0,46,NULL),(119,98,0,47,NULL),(120,91,0,47,NULL),(121,98,0,48,NULL),(122,91,0,48,NULL),(123,98,0,49,NULL),(124,91,0,49,NULL),(125,98,0,50,NULL),(126,91,0,50,NULL),(127,98,0,51,NULL),(128,91,0,51,NULL),(129,98,0,52,NULL),(130,91,0,52,NULL),(131,98,0,53,NULL),(132,91,0,53,NULL),(133,98,0,54,NULL),(134,91,0,54,NULL),(135,98,0,55,NULL),(136,91,0,55,NULL),(137,98,0,56,NULL),(138,91,0,56,NULL),(139,98,0,57,NULL),(140,91,0,57,NULL),(141,98,0,58,NULL),(142,91,0,58,NULL),(143,98,0,59,NULL),(144,91,0,59,NULL),(145,98,0,60,NULL),(146,91,0,60,NULL),(147,98,0,61,NULL),(148,91,0,61,NULL),(149,98,0,62,NULL),(150,91,0,62,NULL),(151,98,0,63,NULL),(152,91,0,63,NULL),(153,98,0,64,NULL),(154,91,0,64,NULL),(155,98,0,65,NULL),(156,91,0,65,NULL),(157,98,0,66,NULL),(158,91,0,66,NULL),(159,98,0,67,NULL),(160,91,0,67,NULL),(161,98,0,68,NULL),(162,91,0,68,NULL),(163,98,0,69,NULL),(164,91,0,69,NULL),(165,98,0,70,NULL),(166,91,0,70,NULL),(167,76,0,41,NULL),(168,76,0,42,NULL),(169,76,0,43,NULL),(170,76,0,44,NULL),(171,76,0,45,NULL),(172,76,0,46,NULL),(173,76,0,47,NULL),(174,76,0,48,NULL),(175,76,0,49,NULL),(176,76,0,50,NULL),(177,76,0,51,NULL),(178,76,0,52,NULL),(179,76,0,53,NULL),(180,76,0,54,NULL),(181,76,0,55,NULL),(182,76,0,56,NULL),(183,76,0,57,NULL),(184,76,0,58,NULL),(185,76,0,59,NULL),(186,76,0,60,NULL),(187,76,0,61,NULL),(188,76,0,62,NULL),(189,76,0,63,NULL),(190,76,0,64,NULL),(191,76,0,65,NULL),(192,76,0,66,NULL),(193,76,0,67,NULL),(194,76,0,68,NULL),(195,76,0,69,NULL),(196,76,0,70,NULL),(197,98,0,71,NULL),(198,91,0,71,NULL),(199,98,0,72,NULL),(200,91,0,72,NULL),(201,98,0,73,NULL),(202,91,0,73,NULL),(203,98,0,74,NULL),(204,91,0,74,NULL),(205,98,0,75,NULL),(206,91,0,75,NULL),(207,98,0,76,NULL),(208,91,0,76,NULL),(209,98,0,77,NULL),(210,91,0,77,NULL),(211,98,0,78,NULL),(212,91,0,78,NULL),(213,98,0,79,NULL),(214,91,0,79,NULL),(215,98,0,80,NULL),(216,91,0,80,NULL),(217,98,0,81,NULL),(218,91,0,81,NULL),(219,98,0,82,NULL),(220,91,0,82,NULL),(221,98,0,83,NULL),(222,91,0,83,NULL),(223,98,0,84,NULL),(224,91,0,84,NULL),(225,98,0,85,NULL),(226,91,0,85,NULL),(227,98,0,86,NULL),(228,91,0,86,NULL),(229,98,0,87,NULL),(230,91,0,87,NULL),(231,98,0,88,NULL),(232,91,0,88,NULL),(233,98,0,89,NULL),(234,91,0,89,NULL),(235,98,0,90,NULL),(236,91,0,90,NULL),(237,98,0,91,NULL),(238,91,0,91,NULL),(239,98,0,92,NULL),(240,91,0,92,NULL),(241,98,0,93,NULL),(242,91,0,93,NULL),(243,98,0,94,NULL),(244,91,0,94,NULL),(245,98,0,95,NULL),(246,91,0,95,NULL),(247,98,0,96,NULL),(248,91,0,96,NULL),(249,98,0,97,NULL),(250,91,0,97,NULL),(251,98,0,98,NULL),(252,91,0,98,NULL),(253,98,0,99,NULL),(254,91,0,99,NULL),(255,98,0,100,NULL),(256,91,0,100,NULL),(257,98,0,101,NULL),(258,91,0,101,NULL),(259,98,0,102,NULL),(260,91,0,102,NULL),(261,98,0,103,NULL),(262,91,0,103,NULL),(263,98,0,104,NULL),(264,91,0,104,NULL),(265,98,0,105,NULL),(266,91,0,105,NULL),(267,98,0,106,NULL),(268,91,0,106,NULL),(269,98,0,107,NULL),(270,91,0,107,NULL),(271,98,0,108,NULL),(272,91,0,108,NULL),(273,98,0,109,NULL),(274,91,0,109,NULL),(275,98,0,110,NULL),(276,91,0,110,NULL),(277,98,0,111,NULL),(278,91,0,111,NULL),(279,98,0,112,NULL),(280,91,0,112,NULL),(281,98,0,113,NULL),(282,91,0,113,NULL),(283,98,0,114,NULL),(284,91,0,114,NULL),(285,98,0,115,NULL),(286,91,0,115,NULL),(287,98,0,116,NULL),(288,91,0,116,NULL),(289,98,0,117,NULL),(290,91,0,117,NULL),(291,98,0,118,NULL),(292,91,0,118,NULL),(293,98,0,119,NULL),(294,91,0,119,NULL),(295,98,0,120,NULL),(296,91,0,120,NULL),(297,98,0,121,NULL),(298,91,0,121,NULL),(299,98,0,122,NULL),(300,91,0,122,NULL),(301,98,0,123,NULL),(302,91,0,123,NULL),(303,98,0,124,NULL),(304,91,0,124,NULL),(305,98,0,125,NULL),(306,91,0,125,NULL),(307,98,0,126,NULL),(308,91,0,126,NULL),(309,98,0,127,NULL),(310,91,0,127,NULL),(311,98,0,128,NULL),(312,91,0,128,NULL),(313,98,0,129,NULL),(314,91,0,129,NULL),(315,98,0,130,NULL),(316,91,0,130,NULL),(317,98,0,131,NULL),(318,91,0,131,NULL),(319,98,0,132,NULL),(320,91,0,132,NULL),(321,98,0,133,NULL),(322,91,0,133,NULL),(323,98,0,134,NULL),(324,91,0,134,NULL),(325,98,0,135,NULL),(326,91,0,135,NULL),(327,98,0,136,NULL),(328,91,0,136,NULL),(329,98,0,137,NULL),(330,91,0,137,NULL),(331,98,0,138,NULL),(332,91,0,138,NULL),(333,98,0,139,NULL),(334,91,0,139,NULL),(335,98,0,140,NULL),(336,91,0,140,NULL),(337,98,0,141,NULL),(338,91,0,141,NULL),(339,98,0,142,NULL),(340,91,0,142,NULL),(341,98,0,143,NULL),(342,91,0,143,NULL),(343,98,0,144,NULL),(344,91,0,144,NULL),(345,98,0,145,NULL),(346,91,0,145,NULL),(347,98,0,146,NULL),(348,91,0,146,NULL),(349,98,0,147,NULL),(350,91,0,147,NULL),(351,98,0,148,NULL),(352,91,0,148,NULL),(353,98,0,149,NULL),(354,91,0,149,NULL),(355,98,0,150,NULL),(356,91,0,150,NULL),(357,98,0,151,NULL),(358,91,0,151,NULL),(359,98,0,152,NULL),(360,91,0,152,NULL),(361,98,0,153,NULL),(362,91,0,153,NULL),(363,98,0,154,NULL),(364,91,0,154,NULL),(365,98,0,155,NULL),(366,91,0,155,NULL),(367,98,0,156,NULL),(368,91,0,156,NULL),(369,98,0,157,NULL),(370,91,0,157,NULL),(371,98,0,158,NULL),(372,91,0,158,NULL),(373,98,0,159,NULL),(374,91,0,159,NULL),(375,98,0,160,NULL),(376,91,0,160,NULL),(377,98,0,161,NULL),(378,91,0,161,NULL),(379,98,0,162,NULL),(380,91,0,162,NULL),(381,98,0,163,NULL),(382,91,0,163,NULL),(383,98,0,164,NULL),(384,91,0,164,NULL),(385,98,0,165,NULL),(386,91,0,165,NULL),(387,98,0,166,NULL),(388,91,0,166,NULL),(389,98,0,167,NULL),(390,91,0,167,NULL),(391,98,0,168,NULL),(392,91,0,168,NULL),(393,98,0,169,NULL),(394,91,0,169,NULL),(395,98,0,170,NULL),(396,91,0,170,NULL),(397,98,0,171,NULL),(398,91,0,171,NULL),(399,98,0,172,NULL),(400,91,0,172,NULL),(401,98,0,173,NULL),(402,91,0,173,NULL),(403,98,0,174,NULL),(404,91,0,174,NULL),(405,98,0,175,NULL),(406,91,0,175,NULL),(407,98,0,176,NULL),(408,91,0,176,NULL),(409,98,0,177,NULL),(410,91,0,177,NULL),(411,98,0,178,NULL),(412,91,0,178,NULL),(413,98,0,179,NULL),(414,91,0,179,NULL),(415,98,0,180,NULL),(416,91,0,180,NULL),(417,98,0,181,NULL),(418,91,0,181,NULL),(419,98,0,182,NULL),(420,91,0,182,NULL),(421,98,0,183,NULL),(422,91,0,183,NULL),(423,98,0,184,NULL),(424,91,0,184,NULL),(425,98,0,185,NULL),(426,91,0,185,NULL),(427,98,0,186,NULL),(428,91,0,186,NULL),(429,98,0,187,NULL),(430,91,0,187,NULL),(431,98,0,188,NULL),(432,91,0,188,NULL),(433,98,0,189,NULL),(434,91,0,189,NULL),(435,98,0,190,NULL),(436,91,0,190,NULL),(437,98,0,191,NULL),(438,91,0,191,NULL),(439,98,0,192,NULL),(440,91,0,192,NULL),(441,98,0,193,NULL),(442,91,0,193,NULL),(443,98,0,194,NULL),(444,91,0,194,NULL),(445,98,0,195,NULL),(446,91,0,195,NULL),(447,98,0,196,NULL),(448,91,0,196,NULL),(449,98,0,197,NULL),(450,91,0,197,NULL),(451,98,0,198,NULL),(452,91,0,198,NULL),(453,98,0,199,NULL),(454,91,0,199,NULL),(455,98,0,200,NULL),(456,91,0,200,NULL),(457,98,0,201,NULL),(458,91,0,201,NULL),(459,98,0,202,NULL),(460,91,0,202,NULL),(461,98,0,203,NULL),(462,91,0,203,NULL),(463,98,0,204,NULL),(464,91,0,204,NULL),(465,98,0,205,NULL),(466,91,0,205,NULL),(467,98,0,206,NULL),(468,91,0,206,NULL),(469,98,0,207,NULL),(470,91,0,207,NULL),(471,98,0,208,NULL),(472,91,0,208,NULL),(473,98,0,209,NULL),(474,91,0,209,NULL),(475,98,0,210,NULL),(476,91,0,210,NULL),(477,98,0,211,NULL),(478,91,0,211,NULL),(479,98,0,212,NULL),(480,91,0,212,NULL),(481,98,0,213,NULL),(482,91,0,213,NULL),(483,98,0,214,NULL),(484,91,0,214,NULL),(485,98,0,215,NULL),(486,91,0,215,NULL),(487,98,0,216,NULL),(488,91,0,216,NULL),(489,98,0,217,NULL),(490,91,0,217,NULL),(491,98,0,218,NULL),(492,91,0,218,NULL),(493,98,0,219,NULL),(494,91,0,219,NULL),(495,98,0,220,NULL),(496,91,0,220,NULL),(497,98,0,221,NULL),(498,91,0,221,NULL),(499,98,0,222,NULL),(500,91,0,222,NULL),(501,98,0,223,NULL),(502,91,0,223,NULL),(503,98,0,224,NULL),(504,91,0,224,NULL),(505,98,0,225,NULL),(506,91,0,225,NULL),(507,98,0,226,NULL),(508,91,0,226,NULL),(509,98,0,227,NULL),(510,91,0,227,NULL),(511,98,0,228,NULL),(512,91,0,228,NULL),(513,98,0,229,NULL),(514,91,0,229,NULL),(515,98,0,230,NULL),(516,91,0,230,NULL),(517,98,0,231,NULL),(518,91,0,231,NULL),(519,98,0,232,NULL),(520,91,0,232,NULL),(521,98,0,233,NULL),(522,91,0,233,NULL),(523,98,0,234,NULL),(524,91,0,234,NULL),(525,98,0,235,NULL),(526,91,0,235,NULL),(527,98,0,236,NULL),(528,91,0,236,NULL),(529,98,0,237,NULL),(530,91,0,237,NULL),(531,98,0,238,NULL),(532,91,0,238,NULL),(533,98,0,239,NULL),(534,91,0,239,NULL),(535,98,0,240,NULL),(536,91,0,240,NULL),(537,98,0,241,NULL),(538,91,0,241,NULL),(539,98,0,242,NULL),(540,91,0,242,NULL),(541,98,0,243,NULL),(542,91,0,243,NULL),(543,98,0,244,NULL),(544,91,0,244,NULL),(545,98,0,245,NULL),(546,91,0,245,NULL),(547,98,0,246,NULL),(548,91,0,246,NULL),(549,98,0,247,NULL),(550,91,0,247,NULL),(551,98,0,248,NULL),(552,91,0,248,NULL),(553,98,0,249,NULL),(554,91,0,249,NULL),(555,98,0,250,NULL),(556,91,0,250,NULL),(557,98,0,251,NULL),(558,91,0,251,NULL),(559,98,0,252,NULL),(560,91,0,252,NULL),(561,98,0,253,NULL),(562,91,0,253,NULL),(563,98,0,254,NULL),(564,91,0,254,NULL),(565,98,0,255,NULL),(566,91,0,255,NULL),(567,98,0,256,NULL),(568,91,0,256,NULL),(569,98,0,257,NULL),(570,91,0,257,NULL),(571,98,0,258,NULL),(572,91,0,258,NULL),(573,98,0,259,NULL),(574,91,0,259,NULL),(575,98,0,260,NULL),(576,91,0,260,NULL),(577,98,0,261,NULL),(578,91,0,261,NULL),(579,98,0,262,NULL),(580,91,0,262,NULL),(581,98,0,263,NULL),(582,91,0,263,NULL),(583,98,0,264,NULL),(584,91,0,264,NULL),(585,98,0,265,NULL),(586,91,0,265,NULL),(587,98,0,266,NULL),(588,91,0,266,NULL),(589,98,0,267,NULL),(590,91,0,267,NULL),(591,98,0,268,NULL),(592,91,0,268,NULL),(593,98,0,269,NULL),(594,91,0,269,NULL),(595,98,0,270,NULL),(596,91,0,270,NULL),(597,98,0,271,NULL),(598,91,0,271,NULL),(599,98,0,272,NULL),(600,91,0,272,NULL),(601,98,0,273,NULL),(602,91,0,273,NULL),(603,98,0,274,NULL),(604,91,0,274,NULL),(605,98,0,275,NULL),(606,91,0,275,NULL),(607,98,0,276,NULL),(608,91,0,276,NULL),(609,98,0,277,NULL),(610,91,0,277,NULL),(611,98,0,278,NULL),(612,91,0,278,NULL),(613,98,0,279,NULL),(614,91,0,279,NULL),(615,98,0,280,NULL),(616,91,0,280,NULL),(617,98,0,281,NULL),(618,91,0,281,NULL),(619,98,0,282,NULL),(620,91,0,282,NULL),(621,98,0,283,NULL),(622,91,0,283,NULL),(623,98,0,284,NULL),(624,91,0,284,NULL),(625,98,0,285,NULL),(626,91,0,285,NULL),(627,98,0,286,NULL),(628,91,0,286,NULL),(629,98,0,287,NULL),(630,91,0,287,NULL),(631,98,0,288,NULL),(632,91,0,288,NULL),(633,98,0,289,NULL),(634,91,0,289,NULL),(635,98,0,290,NULL),(636,91,0,290,NULL),(637,98,0,291,NULL),(638,91,0,291,NULL),(639,98,0,292,NULL),(640,91,0,292,NULL),(641,98,0,293,NULL),(642,91,0,293,NULL),(643,98,0,294,NULL),(644,91,0,294,NULL),(645,98,0,295,NULL),(646,91,0,295,NULL),(647,98,0,296,NULL),(648,91,0,296,NULL),(649,98,0,297,NULL),(650,91,0,297,NULL),(651,98,0,298,NULL),(652,91,0,298,NULL),(653,98,0,299,NULL),(654,91,0,299,NULL),(655,98,0,300,NULL),(656,91,0,300,NULL),(657,98,0,301,NULL),(658,91,0,301,NULL),(659,98,0,302,NULL),(660,91,0,302,NULL),(661,98,0,303,NULL),(662,91,0,303,NULL),(663,98,0,304,NULL),(664,91,0,304,NULL),(665,98,0,305,NULL),(666,91,0,305,NULL),(667,98,0,306,NULL),(668,91,0,306,NULL),(669,98,0,307,NULL),(670,91,0,307,NULL),(671,98,0,308,NULL),(672,91,0,308,NULL),(673,98,0,309,NULL),(674,91,0,309,NULL),(675,98,0,310,NULL),(676,91,0,310,NULL),(677,98,0,311,NULL),(678,91,0,311,NULL),(679,98,0,312,NULL),(680,91,0,312,NULL),(681,98,0,313,NULL),(682,91,0,313,NULL),(683,76,0,71,NULL),(684,76,0,72,NULL),(685,76,0,73,NULL),(686,76,0,74,NULL),(687,76,0,75,NULL),(688,76,0,76,NULL),(689,76,0,77,NULL),(690,76,0,78,NULL),(691,76,0,79,NULL),(692,76,0,80,NULL),(693,76,0,81,NULL),(694,76,0,82,NULL),(695,76,0,83,NULL),(696,76,0,84,NULL),(697,76,0,85,NULL),(698,76,0,86,NULL),(699,76,0,87,NULL),(700,76,0,88,NULL),(701,76,0,89,NULL),(702,76,0,90,NULL),(703,76,0,91,NULL),(704,76,0,92,NULL),(705,76,0,93,NULL),(706,76,0,94,NULL),(707,76,0,95,NULL),(708,76,0,96,NULL),(709,76,0,97,NULL),(710,76,0,98,NULL),(711,76,0,99,NULL),(712,76,0,100,NULL),(713,76,0,101,NULL),(714,76,0,102,NULL),(715,76,0,103,NULL),(716,76,0,104,NULL),(717,76,0,105,NULL),(718,76,0,106,NULL),(719,76,0,107,NULL),(720,76,0,108,NULL),(721,76,0,109,NULL),(722,76,0,110,NULL),(723,76,0,111,NULL),(724,76,0,112,NULL),(725,76,0,113,NULL),(726,76,0,114,NULL),(727,76,0,115,NULL),(728,76,0,116,NULL),(729,76,0,117,NULL),(730,76,0,118,NULL),(731,76,0,119,NULL),(732,76,0,120,NULL),(733,76,0,121,NULL),(734,76,0,122,NULL),(735,76,0,123,NULL),(736,76,0,124,NULL),(737,76,0,125,NULL),(738,76,0,126,NULL),(739,76,0,127,NULL),(740,76,0,128,NULL),(741,76,0,129,NULL),(742,76,0,130,NULL),(743,76,0,131,NULL),(744,76,0,132,NULL),(745,76,0,133,NULL),(746,76,0,134,NULL),(747,76,0,135,NULL),(748,76,0,136,NULL),(749,76,0,137,NULL),(750,76,0,138,NULL),(751,76,0,139,NULL),(752,76,0,140,NULL),(753,76,0,141,NULL),(754,76,0,142,NULL),(755,76,0,143,NULL),(756,76,0,144,NULL),(757,76,0,145,NULL),(758,76,0,146,NULL),(759,76,0,147,NULL),(760,76,0,148,NULL),(761,76,0,149,NULL),(762,76,0,150,NULL),(763,76,0,151,NULL),(764,76,0,152,NULL),(765,76,0,153,NULL),(766,76,0,154,NULL),(767,76,0,155,NULL),(768,76,0,156,NULL),(769,76,0,157,NULL),(770,76,0,158,NULL),(771,76,0,159,NULL),(772,76,0,160,NULL),(773,76,0,161,NULL),(774,76,0,162,NULL),(775,76,0,163,NULL),(776,76,0,164,NULL),(777,76,0,165,NULL),(778,76,0,166,NULL),(779,76,0,167,NULL),(780,76,0,168,NULL),(781,76,0,169,NULL),(782,76,0,170,NULL),(783,76,0,171,NULL),(784,76,0,172,NULL),(785,76,0,173,NULL),(786,76,0,174,NULL),(787,76,0,175,NULL),(788,76,0,176,NULL),(789,76,0,177,NULL),(790,76,0,178,NULL),(791,76,0,179,NULL),(792,76,0,180,NULL),(793,76,0,181,NULL),(794,76,0,182,NULL),(795,76,0,183,NULL),(796,76,0,184,NULL),(797,76,0,185,NULL),(798,76,0,186,NULL),(799,76,0,187,NULL),(800,76,0,188,NULL),(801,76,0,189,NULL),(802,76,0,190,NULL),(803,76,0,191,NULL),(804,76,0,192,NULL),(805,76,0,193,NULL),(806,76,0,194,NULL),(807,76,0,195,NULL),(808,76,0,196,NULL),(809,76,0,197,NULL),(810,76,0,198,NULL),(811,76,0,199,NULL),(812,76,0,200,NULL),(813,76,0,201,NULL),(814,76,0,202,NULL),(815,76,0,203,NULL),(816,76,0,204,NULL),(817,76,0,205,NULL),(818,76,0,206,NULL),(819,76,0,207,NULL),(820,76,0,208,NULL),(821,76,0,209,NULL),(822,76,0,210,NULL),(823,76,0,211,NULL),(824,76,0,212,NULL),(825,76,0,213,NULL),(826,76,0,214,NULL),(827,76,0,215,NULL),(828,76,0,216,NULL),(829,76,0,217,NULL),(830,76,0,218,NULL),(831,76,0,219,NULL),(832,76,0,220,NULL),(833,76,0,221,NULL),(834,76,0,222,NULL),(835,76,0,223,NULL);
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_entity_decimal`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_DEC_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_entity_decimal`
--

LOCK TABLES `grocery_bag_catalog_product_entity_decimal` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_decimal` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_product_entity_decimal` VALUES (22,74,0,26,2750.0000),(24,74,0,27,2700.0000),(26,74,0,28,2500.0000),(28,74,0,29,1480.0000),(30,74,0,30,1450.0000),(32,74,0,31,1430.0000),(34,74,0,32,1400.0000),(36,74,0,33,1330.0000),(38,74,0,34,1200.0000),(40,74,0,35,1180.0000),(42,74,0,36,1175.0000),(44,74,0,37,1150.0000),(46,74,0,38,400.0000),(48,74,0,39,390.0000),(50,74,0,40,380.0000),(52,74,0,41,375.0000),(54,74,0,42,375.0000),(56,74,0,43,370.0000),(58,74,0,44,325.0000),(60,74,0,45,490.0000),(62,74,0,46,350.0000),(64,74,0,47,340.0000),(66,74,0,48,340.0000),(68,74,0,49,340.0000),(70,74,0,50,340.0000),(72,74,0,51,340.0000),(74,74,0,52,185.0000),(76,74,0,53,185.0000),(78,74,0,54,720.0000),(80,74,0,55,575.0000),(82,74,0,56,430.0000),(84,74,0,57,350.0000),(86,74,0,58,535.0000),(88,74,0,59,535.0000),(90,74,0,60,520.0000),(92,74,0,61,210.0000),(94,74,0,62,150.0000),(96,74,0,63,150.0000),(98,74,0,64,100.0000),(100,74,0,65,100.0000),(102,74,0,66,100.0000),(104,74,0,67,575.0000),(106,74,0,68,450.0000),(108,74,0,69,425.0000),(110,74,0,70,415.0000),(112,74,0,71,2970.0000),(114,74,0,72,2515.0000),(116,74,0,73,2465.0000),(118,74,0,74,2465.0000),(120,74,0,75,2400.0000),(122,74,0,76,1810.0000),(124,74,0,77,1660.0000),(126,74,0,78,1660.0000),(128,74,0,79,1260.0000),(130,74,0,80,575.0000),(132,74,0,81,525.0000),(134,74,0,82,490.0000),(136,74,0,83,1150.0000),(138,74,0,84,900.0000),(140,74,0,85,445.0000),(142,74,0,86,420.0000),(144,74,0,87,390.0000),(146,74,0,88,250.0000),(148,74,0,89,1250.0000),(150,74,0,90,1250.0000),(152,74,0,91,1100.0000),(154,74,0,92,650.0000),(156,74,0,93,550.0000),(158,74,0,94,525.0000),(160,74,0,95,475.0000),(162,74,0,96,450.0000),(164,74,0,97,450.0000),(166,74,0,98,450.0000),(168,74,0,99,440.0000),(170,74,0,100,400.0000),(172,74,0,101,395.0000),(174,74,0,102,395.0000),(176,74,0,103,300.0000),(178,74,0,104,120.0000),(180,74,0,105,885.0000),(182,74,0,106,885.0000),(184,74,0,107,885.0000),(186,74,0,108,620.0000),(188,74,0,109,620.0000),(190,74,0,110,610.0000),(192,74,0,111,610.0000),(194,74,0,112,610.0000),(196,74,0,113,550.0000),(198,74,0,114,550.0000),(200,74,0,115,550.0000),(202,74,0,116,650.0000),(204,74,0,117,600.0000),(206,74,0,118,525.0000),(208,74,0,119,330.0000),(210,74,0,120,310.0000),(212,74,0,121,300.0000),(214,74,0,122,275.0000),(216,74,0,123,265.0000),(218,74,0,124,235.0000),(220,74,0,125,225.0000),(222,74,0,126,175.0000),(224,74,0,127,160.0000),(226,74,0,128,370.0000),(228,74,0,129,575.0000),(230,74,0,130,310.0000),(232,74,0,131,310.0000),(234,74,0,132,310.0000),(236,74,0,133,275.0000),(238,74,0,134,275.0000),(240,74,0,135,390.0000),(242,74,0,136,365.0000),(244,74,0,137,345.0000),(246,74,0,138,322.0000),(248,74,0,139,315.0000),(250,74,0,140,313.0000),(252,74,0,141,308.0000),(254,74,0,142,292.0000),(256,74,0,143,284.0000),(258,74,0,144,250.0000),(260,74,0,145,235.0000),(262,74,0,146,232.0000),(264,74,0,147,175.0000),(266,74,0,148,150.0000),(268,74,0,149,145.0000),(270,74,0,150,145.0000),(272,74,0,151,135.0000),(274,74,0,152,110.0000),(276,74,0,153,82.0000),(278,74,0,154,82.0000),(280,74,0,155,78.0000),(282,74,0,156,35.0000),(284,74,0,157,33.0000),(286,74,0,158,20.0000),(288,74,0,159,515.0000),(290,74,0,160,320.0000),(292,74,0,161,320.0000),(294,74,0,162,290.0000),(296,74,0,163,185.0000),(298,74,0,164,185.0000),(300,74,0,165,185.0000),(302,74,0,166,185.0000),(304,74,0,167,155.0000),(306,74,0,168,155.0000),(308,74,0,169,220.0000),(310,74,0,170,185.0000),(312,74,0,171,175.0000),(314,74,0,172,170.0000),(316,74,0,173,160.0000),(318,74,0,174,300.0000),(320,74,0,175,250.0000),(322,74,0,176,250.0000),(324,74,0,177,175.0000),(326,74,0,178,175.0000),(328,74,0,179,160.0000),(330,74,0,180,150.0000),(332,74,0,181,145.0000),(334,74,0,182,168.0000),(336,74,0,183,45.0000),(338,74,0,184,270.0000),(340,74,0,185,132.0000),(342,74,0,186,92.0000),(344,74,0,187,45.0000),(346,74,0,188,510.0000),(348,74,0,189,315.0000),(350,74,0,190,130.0000),(352,74,0,191,125.0000),(354,74,0,192,90.0000),(356,74,0,193,75.0000),(358,74,0,194,75.0000),(360,74,0,195,65.0000),(362,74,0,196,52.0000),(364,74,0,197,22.0000),(366,74,0,198,680.0000),(368,74,0,199,680.0000),(370,74,0,200,680.0000),(372,74,0,201,158.0000),(374,74,0,202,158.0000),(376,74,0,203,150.0000),(378,74,0,204,201.0000),(380,74,0,205,200.0000),(382,74,0,206,150.0000),(384,74,0,207,150.0000),(386,74,0,208,430.0000),(388,74,0,209,320.0000),(390,74,0,210,250.0000),(392,74,0,211,199.0000),(394,74,0,212,170.0000),(396,74,0,213,170.0000),(398,74,0,214,170.0000),(400,74,0,215,170.0000),(402,74,0,216,160.0000),(404,74,0,217,150.0000),(406,74,0,218,90.0000),(408,74,0,219,60.0000),(410,74,0,220,720.0000),(412,74,0,221,175.0000),(414,74,0,222,450.0000),(416,74,0,223,330.0000);
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_entity_gallery`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_entity_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_GLR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Gallery Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_entity_gallery`
--

LOCK TABLES `grocery_bag_catalog_product_entity_gallery` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_entity_int`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_INT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2662 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_entity_int`
--

LOCK TABLES `grocery_bag_catalog_product_entity_int` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_int` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_product_entity_int` VALUES (151,94,0,26,1),(152,96,0,26,4),(153,112,0,26,1),(156,94,0,27,1),(157,96,0,27,4),(158,112,0,27,1),(161,94,0,28,1),(162,96,0,28,4),(163,112,0,28,1),(166,94,0,29,1),(167,96,0,29,4),(168,112,0,29,1),(171,94,0,30,1),(172,96,0,30,4),(173,112,0,30,1),(176,94,0,31,1),(177,96,0,31,4),(178,112,0,31,1),(181,94,0,32,1),(182,96,0,32,4),(183,112,0,32,1),(186,94,0,33,1),(187,96,0,33,4),(188,112,0,33,1),(191,94,0,34,1),(192,96,0,34,4),(193,112,0,34,1),(196,94,0,35,1),(197,96,0,35,4),(198,112,0,35,1),(201,94,0,36,1),(202,96,0,36,4),(203,112,0,36,1),(206,94,0,37,1),(207,96,0,37,4),(208,112,0,37,1),(211,129,0,26,2),(213,129,0,27,2),(215,129,0,28,2),(217,129,0,29,2),(219,129,0,30,2),(221,129,0,31,2),(223,129,0,32,2),(225,129,0,33,2),(227,129,0,34,2),(229,129,0,35,2),(231,129,0,36,2),(233,129,0,37,2),(259,94,0,38,1),(260,96,0,38,4),(261,112,0,38,1),(264,94,0,39,1),(265,96,0,39,4),(266,112,0,39,1),(269,94,0,40,1),(270,96,0,40,4),(271,112,0,40,1),(286,129,0,38,2),(288,129,0,39,2),(290,129,0,40,2),(364,94,0,41,1),(365,96,0,41,4),(366,112,0,41,1),(369,94,0,42,1),(370,96,0,42,4),(371,112,0,42,1),(374,94,0,43,1),(375,96,0,43,4),(376,112,0,43,1),(379,94,0,44,1),(380,96,0,44,4),(381,112,0,44,1),(384,94,0,45,1),(385,96,0,45,4),(386,112,0,45,1),(389,94,0,46,1),(390,96,0,46,4),(391,112,0,46,1),(394,94,0,47,1),(395,96,0,47,4),(396,112,0,47,1),(399,94,0,48,1),(400,96,0,48,4),(401,112,0,48,1),(404,94,0,49,1),(405,96,0,49,4),(406,112,0,49,1),(409,94,0,50,1),(410,96,0,50,4),(411,112,0,50,1),(414,94,0,51,1),(415,96,0,51,4),(416,112,0,51,1),(419,94,0,52,1),(420,96,0,52,4),(421,112,0,52,1),(424,94,0,53,1),(425,96,0,53,4),(426,112,0,53,1),(429,94,0,54,1),(430,96,0,54,4),(431,112,0,54,1),(434,94,0,55,1),(435,96,0,55,4),(436,112,0,55,1),(439,94,0,56,1),(440,96,0,56,4),(441,112,0,56,1),(444,94,0,57,1),(445,96,0,57,4),(446,112,0,57,1),(449,94,0,58,1),(450,96,0,58,4),(451,112,0,58,1),(454,94,0,59,1),(455,96,0,59,4),(456,112,0,59,1),(459,94,0,60,1),(460,96,0,60,4),(461,112,0,60,1),(464,94,0,61,1),(465,96,0,61,4),(466,112,0,61,1),(469,94,0,62,1),(470,96,0,62,4),(471,112,0,62,1),(474,94,0,63,1),(475,96,0,63,4),(476,112,0,63,1),(479,94,0,64,1),(480,96,0,64,4),(481,112,0,64,1),(484,94,0,65,1),(485,96,0,65,4),(486,112,0,65,1),(489,94,0,66,1),(490,96,0,66,4),(491,112,0,66,1),(494,94,0,67,1),(495,96,0,67,4),(496,112,0,67,1),(499,94,0,68,1),(500,96,0,68,4),(501,112,0,68,1),(504,94,0,69,1),(505,96,0,69,4),(506,112,0,69,1),(509,94,0,70,1),(510,96,0,70,4),(511,112,0,70,1),(529,129,0,41,2),(531,129,0,42,2),(533,129,0,43,2),(535,129,0,44,2),(537,129,0,45,2),(539,129,0,46,2),(541,129,0,47,2),(543,129,0,48,2),(545,129,0,49,2),(547,129,0,50,2),(549,129,0,51,2),(551,129,0,52,2),(553,129,0,53,2),(555,129,0,54,2),(557,129,0,55,2),(559,129,0,56,2),(561,129,0,57,2),(563,129,0,58,2),(565,129,0,59,2),(567,129,0,60,2),(569,129,0,61,2),(571,129,0,62,2),(573,129,0,63,2),(575,129,0,64,2),(577,129,0,65,2),(579,129,0,66,2),(581,129,0,67,2),(583,129,0,68,2),(585,129,0,69,2),(587,129,0,70,2),(589,94,0,71,1),(590,96,0,71,4),(591,112,0,71,1),(594,94,0,72,1),(595,96,0,72,4),(596,112,0,72,1),(599,94,0,73,1),(600,96,0,73,4),(601,112,0,73,1),(604,94,0,74,1),(605,96,0,74,4),(606,112,0,74,1),(609,94,0,75,1),(610,96,0,75,4),(611,112,0,75,1),(614,94,0,76,1),(615,96,0,76,4),(616,112,0,76,1),(619,94,0,77,1),(620,96,0,77,4),(621,112,0,77,1),(624,94,0,78,1),(625,96,0,78,4),(626,112,0,78,1),(629,94,0,79,1),(630,96,0,79,4),(631,112,0,79,1),(634,94,0,80,1),(635,96,0,80,4),(636,112,0,80,1),(639,94,0,81,1),(640,96,0,81,4),(641,112,0,81,1),(644,94,0,82,1),(645,96,0,82,4),(646,112,0,82,1),(649,94,0,83,1),(650,96,0,83,4),(651,112,0,83,1),(654,94,0,84,1),(655,96,0,84,4),(656,112,0,84,1),(659,94,0,85,1),(660,96,0,85,4),(661,112,0,85,1),(664,94,0,86,1),(665,96,0,86,4),(666,112,0,86,1),(669,94,0,87,1),(670,96,0,87,4),(671,112,0,87,1),(674,94,0,88,1),(675,96,0,88,4),(676,112,0,88,1),(679,94,0,89,1),(680,96,0,89,4),(681,112,0,89,1),(684,94,0,90,1),(685,96,0,90,4),(686,112,0,90,1),(689,94,0,91,1),(690,96,0,91,4),(691,112,0,91,1),(694,94,0,92,1),(695,96,0,92,4),(696,112,0,92,1),(699,94,0,93,1),(700,96,0,93,4),(701,112,0,93,1),(704,94,0,94,1),(705,96,0,94,4),(706,112,0,94,1),(709,94,0,95,1),(710,96,0,95,4),(711,112,0,95,1),(714,94,0,96,1),(715,96,0,96,4),(716,112,0,96,1),(719,94,0,97,1),(720,96,0,97,4),(721,112,0,97,1),(724,94,0,98,1),(725,96,0,98,4),(726,112,0,98,1),(729,94,0,99,1),(730,96,0,99,4),(731,112,0,99,1),(734,94,0,100,1),(735,96,0,100,4),(736,112,0,100,1),(739,94,0,101,1),(740,96,0,101,4),(741,112,0,101,1),(744,94,0,102,1),(745,96,0,102,4),(746,112,0,102,1),(749,94,0,103,1),(750,96,0,103,4),(751,112,0,103,1),(754,94,0,104,1),(755,96,0,104,4),(756,112,0,104,1),(759,94,0,105,1),(760,96,0,105,4),(761,112,0,105,1),(764,94,0,106,1),(765,96,0,106,4),(766,112,0,106,1),(769,94,0,107,1),(770,96,0,107,4),(771,112,0,107,1),(774,94,0,108,1),(775,96,0,108,4),(776,112,0,108,1),(779,94,0,109,1),(780,96,0,109,4),(781,112,0,109,1),(784,94,0,110,1),(785,96,0,110,4),(786,112,0,110,1),(789,94,0,111,1),(790,96,0,111,4),(791,112,0,111,1),(794,94,0,112,1),(795,96,0,112,4),(796,112,0,112,1),(799,94,0,113,1),(800,96,0,113,4),(801,112,0,113,1),(804,94,0,114,1),(805,96,0,114,4),(806,112,0,114,1),(809,94,0,115,1),(810,96,0,115,4),(811,112,0,115,1),(814,94,0,116,1),(815,96,0,116,4),(816,112,0,116,1),(819,94,0,117,1),(820,96,0,117,4),(821,112,0,117,1),(824,94,0,118,1),(825,96,0,118,4),(826,112,0,118,1),(829,94,0,119,1),(830,96,0,119,4),(831,112,0,119,1),(834,94,0,120,1),(835,96,0,120,4),(836,112,0,120,1),(839,94,0,121,1),(840,96,0,121,4),(841,112,0,121,1),(844,94,0,122,1),(845,96,0,122,4),(846,112,0,122,1),(849,94,0,123,1),(850,96,0,123,4),(851,112,0,123,1),(854,94,0,124,1),(855,96,0,124,4),(856,112,0,124,1),(859,94,0,125,1),(860,96,0,125,4),(861,112,0,125,1),(864,94,0,126,1),(865,96,0,126,4),(866,112,0,126,1),(869,94,0,127,1),(870,96,0,127,4),(871,112,0,127,1),(874,94,0,128,1),(875,96,0,128,4),(876,112,0,128,1),(879,94,0,129,1),(880,96,0,129,4),(881,112,0,129,1),(884,94,0,130,1),(885,96,0,130,4),(886,112,0,130,1),(889,94,0,131,1),(890,96,0,131,4),(891,112,0,131,1),(894,94,0,132,1),(895,96,0,132,4),(896,112,0,132,1),(899,94,0,133,1),(900,96,0,133,4),(901,112,0,133,1),(904,94,0,134,1),(905,96,0,134,4),(906,112,0,134,1),(909,94,0,135,1),(910,96,0,135,4),(911,112,0,135,1),(914,94,0,136,1),(915,96,0,136,4),(916,112,0,136,1),(919,94,0,137,1),(920,96,0,137,4),(921,112,0,137,1),(924,94,0,138,1),(925,96,0,138,4),(926,112,0,138,1),(929,94,0,139,1),(930,96,0,139,4),(931,112,0,139,1),(934,94,0,140,1),(935,96,0,140,4),(936,112,0,140,1),(939,94,0,141,1),(940,96,0,141,4),(941,112,0,141,1),(944,94,0,142,1),(945,96,0,142,4),(946,112,0,142,1),(949,94,0,143,1),(950,96,0,143,4),(951,112,0,143,1),(954,94,0,144,1),(955,96,0,144,4),(956,112,0,144,1),(959,94,0,145,1),(960,96,0,145,4),(961,112,0,145,1),(964,94,0,146,1),(965,96,0,146,4),(966,112,0,146,1),(969,94,0,147,1),(970,96,0,147,4),(971,112,0,147,1),(974,94,0,148,1),(975,96,0,148,4),(976,112,0,148,1),(979,94,0,149,1),(980,96,0,149,4),(981,112,0,149,1),(984,94,0,150,1),(985,96,0,150,4),(986,112,0,150,1),(989,94,0,151,1),(990,96,0,151,4),(991,112,0,151,1),(994,94,0,152,1),(995,96,0,152,4),(996,112,0,152,1),(999,94,0,153,1),(1000,96,0,153,4),(1001,112,0,153,1),(1004,94,0,154,1),(1005,96,0,154,4),(1006,112,0,154,1),(1009,94,0,155,1),(1010,96,0,155,4),(1011,112,0,155,1),(1014,94,0,156,1),(1015,96,0,156,4),(1016,112,0,156,1),(1019,94,0,157,1),(1020,96,0,157,4),(1021,112,0,157,1),(1024,94,0,158,1),(1025,96,0,158,4),(1026,112,0,158,1),(1029,94,0,159,1),(1030,96,0,159,4),(1031,112,0,159,1),(1034,94,0,160,1),(1035,96,0,160,4),(1036,112,0,160,1),(1039,94,0,161,1),(1040,96,0,161,4),(1041,112,0,161,1),(1044,94,0,162,1),(1045,96,0,162,4),(1046,112,0,162,1),(1049,94,0,163,1),(1050,96,0,163,4),(1051,112,0,163,1),(1054,94,0,164,1),(1055,96,0,164,4),(1056,112,0,164,1),(1059,94,0,165,1),(1060,96,0,165,4),(1061,112,0,165,1),(1064,94,0,166,1),(1065,96,0,166,4),(1066,112,0,166,1),(1069,94,0,167,1),(1070,96,0,167,4),(1071,112,0,167,1),(1074,94,0,168,1),(1075,96,0,168,4),(1076,112,0,168,1),(1079,94,0,169,1),(1080,96,0,169,4),(1081,112,0,169,1),(1084,94,0,170,1),(1085,96,0,170,4),(1086,112,0,170,1),(1089,94,0,171,1),(1090,96,0,171,4),(1091,112,0,171,1),(1094,94,0,172,1),(1095,96,0,172,4),(1096,112,0,172,1),(1099,94,0,173,1),(1100,96,0,173,4),(1101,112,0,173,1),(1104,94,0,174,1),(1105,96,0,174,4),(1106,112,0,174,1),(1109,94,0,175,1),(1110,96,0,175,4),(1111,112,0,175,1),(1114,94,0,176,1),(1115,96,0,176,4),(1116,112,0,176,1),(1119,94,0,177,1),(1120,96,0,177,4),(1121,112,0,177,1),(1124,94,0,178,1),(1125,96,0,178,4),(1126,112,0,178,1),(1129,94,0,179,1),(1130,96,0,179,4),(1131,112,0,179,1),(1134,94,0,180,1),(1135,96,0,180,4),(1136,112,0,180,1),(1139,94,0,181,1),(1140,96,0,181,4),(1141,112,0,181,1),(1144,94,0,182,1),(1145,96,0,182,4),(1146,112,0,182,1),(1149,94,0,183,1),(1150,96,0,183,4),(1151,112,0,183,1),(1154,94,0,184,1),(1155,96,0,184,4),(1156,112,0,184,1),(1159,94,0,185,1),(1160,96,0,185,4),(1161,112,0,185,1),(1164,94,0,186,1),(1165,96,0,186,4),(1166,112,0,186,1),(1169,94,0,187,1),(1170,96,0,187,4),(1171,112,0,187,1),(1174,94,0,188,1),(1175,96,0,188,4),(1176,112,0,188,1),(1179,94,0,189,1),(1180,96,0,189,4),(1181,112,0,189,1),(1184,94,0,190,1),(1185,96,0,190,4),(1186,112,0,190,1),(1189,94,0,191,1),(1190,96,0,191,4),(1191,112,0,191,1),(1194,94,0,192,1),(1195,96,0,192,4),(1196,112,0,192,1),(1199,94,0,193,1),(1200,96,0,193,4),(1201,112,0,193,1),(1204,94,0,194,1),(1205,96,0,194,4),(1206,112,0,194,1),(1209,94,0,195,1),(1210,96,0,195,4),(1211,112,0,195,1),(1214,94,0,196,1),(1215,96,0,196,4),(1216,112,0,196,1),(1219,94,0,197,1),(1220,96,0,197,4),(1221,112,0,197,1),(1224,94,0,198,1),(1225,96,0,198,4),(1226,112,0,198,1),(1229,94,0,199,1),(1230,96,0,199,4),(1231,112,0,199,1),(1234,94,0,200,1),(1235,96,0,200,4),(1236,112,0,200,1),(1239,94,0,201,1),(1240,96,0,201,4),(1241,112,0,201,1),(1244,94,0,202,1),(1245,96,0,202,4),(1246,112,0,202,1),(1249,94,0,203,1),(1250,96,0,203,4),(1251,112,0,203,1),(1254,94,0,204,1),(1255,96,0,204,4),(1256,112,0,204,1),(1259,94,0,205,1),(1260,96,0,205,4),(1261,112,0,205,1),(1264,94,0,206,1),(1265,96,0,206,4),(1266,112,0,206,1),(1269,94,0,207,1),(1270,96,0,207,4),(1271,112,0,207,1),(1274,94,0,208,1),(1275,96,0,208,4),(1276,112,0,208,1),(1279,94,0,209,1),(1280,96,0,209,4),(1281,112,0,209,1),(1284,94,0,210,1),(1285,96,0,210,4),(1286,112,0,210,1),(1289,94,0,211,1),(1290,96,0,211,4),(1291,112,0,211,1),(1294,94,0,212,1),(1295,96,0,212,4),(1296,112,0,212,1),(1299,94,0,213,1),(1300,96,0,213,4),(1301,112,0,213,1),(1304,94,0,214,1),(1305,96,0,214,4),(1306,112,0,214,1),(1309,94,0,215,1),(1310,96,0,215,4),(1311,112,0,215,1),(1314,94,0,216,1),(1315,96,0,216,4),(1316,112,0,216,1),(1319,94,0,217,1),(1320,96,0,217,4),(1321,112,0,217,1),(1324,94,0,218,1),(1325,96,0,218,4),(1326,112,0,218,1),(1329,94,0,219,1),(1330,96,0,219,4),(1331,112,0,219,1),(1334,94,0,220,1),(1335,96,0,220,4),(1336,112,0,220,1),(1339,94,0,221,1),(1340,96,0,221,4),(1341,112,0,221,1),(1344,94,0,222,1),(1345,96,0,222,4),(1346,112,0,222,1),(1349,94,0,223,1),(1350,96,0,223,4),(1351,112,0,223,1),(1354,94,0,224,1),(1355,96,0,224,4),(1356,112,0,224,1),(1359,94,0,225,1),(1360,96,0,225,4),(1361,112,0,225,1),(1364,94,0,226,1),(1365,96,0,226,4),(1366,112,0,226,1),(1369,94,0,227,1),(1370,96,0,227,4),(1371,112,0,227,1),(1374,94,0,228,1),(1375,96,0,228,4),(1376,112,0,228,1),(1379,94,0,229,1),(1380,96,0,229,4),(1381,112,0,229,1),(1384,94,0,230,1),(1385,96,0,230,4),(1386,112,0,230,1),(1389,94,0,231,1),(1390,96,0,231,4),(1391,112,0,231,1),(1394,94,0,232,1),(1395,96,0,232,4),(1396,112,0,232,1),(1399,94,0,233,1),(1400,96,0,233,4),(1401,112,0,233,1),(1404,94,0,234,1),(1405,96,0,234,4),(1406,112,0,234,1),(1409,94,0,235,1),(1410,96,0,235,4),(1411,112,0,235,1),(1414,94,0,236,1),(1415,96,0,236,4),(1416,112,0,236,1),(1419,94,0,237,1),(1420,96,0,237,4),(1421,112,0,237,1),(1424,94,0,238,1),(1425,96,0,238,4),(1426,112,0,238,1),(1429,94,0,239,1),(1430,96,0,239,4),(1431,112,0,239,1),(1434,94,0,240,1),(1435,96,0,240,4),(1436,112,0,240,1),(1439,94,0,241,1),(1440,96,0,241,4),(1441,112,0,241,1),(1444,94,0,242,1),(1445,96,0,242,4),(1446,112,0,242,1),(1449,94,0,243,1),(1450,96,0,243,4),(1451,112,0,243,1),(1454,94,0,244,1),(1455,96,0,244,4),(1456,112,0,244,1),(1459,94,0,245,1),(1460,96,0,245,4),(1461,112,0,245,1),(1464,94,0,246,1),(1465,96,0,246,4),(1466,112,0,246,1),(1469,94,0,247,1),(1470,96,0,247,4),(1471,112,0,247,1),(1474,94,0,248,1),(1475,96,0,248,4),(1476,112,0,248,1),(1479,94,0,249,1),(1480,96,0,249,4),(1481,112,0,249,1),(1484,94,0,250,1),(1485,96,0,250,4),(1486,112,0,250,1),(1489,94,0,251,1),(1490,96,0,251,4),(1491,112,0,251,1),(1494,94,0,252,1),(1495,96,0,252,4),(1496,112,0,252,1),(1499,94,0,253,1),(1500,96,0,253,4),(1501,112,0,253,1),(1504,94,0,254,1),(1505,96,0,254,4),(1506,112,0,254,1),(1509,94,0,255,1),(1510,96,0,255,4),(1511,112,0,255,1),(1514,94,0,256,1),(1515,96,0,256,4),(1516,112,0,256,1),(1519,94,0,257,1),(1520,96,0,257,4),(1521,112,0,257,1),(1524,94,0,258,1),(1525,96,0,258,4),(1526,112,0,258,1),(1529,94,0,259,1),(1530,96,0,259,4),(1531,112,0,259,1),(1534,94,0,260,1),(1535,96,0,260,4),(1536,112,0,260,1),(1539,94,0,261,1),(1540,96,0,261,4),(1541,112,0,261,1),(1544,94,0,262,1),(1545,96,0,262,4),(1546,112,0,262,1),(1549,94,0,263,1),(1550,96,0,263,4),(1551,112,0,263,1),(1554,94,0,264,1),(1555,96,0,264,4),(1556,112,0,264,1),(1559,94,0,265,1),(1560,96,0,265,4),(1561,112,0,265,1),(1564,94,0,266,1),(1565,96,0,266,4),(1566,112,0,266,1),(1569,94,0,267,1),(1570,96,0,267,4),(1571,112,0,267,1),(1574,94,0,268,1),(1575,96,0,268,4),(1576,112,0,268,1),(1579,94,0,269,1),(1580,96,0,269,4),(1581,112,0,269,1),(1584,94,0,270,1),(1585,96,0,270,4),(1586,112,0,270,1),(1589,94,0,271,1),(1590,96,0,271,4),(1591,112,0,271,1),(1594,94,0,272,1),(1595,96,0,272,4),(1596,112,0,272,1),(1599,94,0,273,1),(1600,96,0,273,4),(1601,112,0,273,1),(1604,94,0,274,1),(1605,96,0,274,4),(1606,112,0,274,1),(1609,94,0,275,1),(1610,96,0,275,4),(1611,112,0,275,1),(1614,94,0,276,1),(1615,96,0,276,4),(1616,112,0,276,1),(1619,94,0,277,1),(1620,96,0,277,4),(1621,112,0,277,1),(1624,94,0,278,1),(1625,96,0,278,4),(1626,112,0,278,1),(1629,94,0,279,1),(1630,96,0,279,4),(1631,112,0,279,1),(1634,94,0,280,1),(1635,96,0,280,4),(1636,112,0,280,1),(1639,94,0,281,1),(1640,96,0,281,4),(1641,112,0,281,1),(1644,94,0,282,1),(1645,96,0,282,4),(1646,112,0,282,1),(1649,94,0,283,1),(1650,96,0,283,4),(1651,112,0,283,1),(1654,94,0,284,1),(1655,96,0,284,4),(1656,112,0,284,1),(1659,94,0,285,1),(1660,96,0,285,4),(1661,112,0,285,1),(1664,94,0,286,1),(1665,96,0,286,4),(1666,112,0,286,1),(1669,94,0,287,1),(1670,96,0,287,4),(1671,112,0,287,1),(1674,94,0,288,1),(1675,96,0,288,4),(1676,112,0,288,1),(1679,94,0,289,1),(1680,96,0,289,4),(1681,112,0,289,1),(1684,94,0,290,1),(1685,96,0,290,4),(1686,112,0,290,1),(1689,94,0,291,1),(1690,96,0,291,4),(1691,112,0,291,1),(1694,94,0,292,1),(1695,96,0,292,4),(1696,112,0,292,1),(1699,94,0,293,1),(1700,96,0,293,4),(1701,112,0,293,1),(1704,94,0,294,1),(1705,96,0,294,4),(1706,112,0,294,1),(1709,94,0,295,1),(1710,96,0,295,4),(1711,112,0,295,1),(1714,94,0,296,1),(1715,96,0,296,4),(1716,112,0,296,1),(1719,94,0,297,1),(1720,96,0,297,4),(1721,112,0,297,1),(1724,94,0,298,1),(1725,96,0,298,4),(1726,112,0,298,1),(1729,94,0,299,1),(1730,96,0,299,4),(1731,112,0,299,1),(1734,94,0,300,1),(1735,96,0,300,4),(1736,112,0,300,1),(1739,94,0,301,1),(1740,96,0,301,4),(1741,112,0,301,1),(1744,94,0,302,1),(1745,96,0,302,4),(1746,112,0,302,1),(1749,94,0,303,1),(1750,96,0,303,4),(1751,112,0,303,1),(1754,94,0,304,1),(1755,96,0,304,4),(1756,112,0,304,1),(1759,94,0,305,1),(1760,96,0,305,4),(1761,112,0,305,1),(1764,94,0,306,1),(1765,96,0,306,4),(1766,112,0,306,1),(1769,94,0,307,1),(1770,96,0,307,4),(1771,112,0,307,1),(1774,94,0,308,1),(1775,96,0,308,4),(1776,112,0,308,1),(1779,94,0,309,1),(1780,96,0,309,4),(1781,112,0,309,1),(1784,94,0,310,1),(1785,96,0,310,4),(1786,112,0,310,1),(1789,94,0,311,1),(1790,96,0,311,4),(1791,112,0,311,1),(1794,94,0,312,1),(1795,96,0,312,4),(1796,112,0,312,1),(1799,94,0,313,1),(1800,96,0,313,4),(1801,112,0,313,1),(2092,129,0,71,2),(2094,129,0,72,2),(2096,129,0,73,2),(2098,129,0,74,2),(2100,129,0,75,2),(2102,129,0,76,2),(2104,129,0,77,2),(2106,129,0,78,2),(2108,129,0,79,2),(2110,129,0,80,2),(2112,129,0,81,2),(2114,129,0,82,2),(2116,129,0,83,2),(2118,129,0,84,2),(2120,129,0,85,2),(2122,129,0,86,2),(2124,129,0,87,2),(2126,129,0,88,2),(2128,129,0,89,2),(2130,129,0,90,2),(2132,129,0,91,2),(2134,129,0,92,2),(2136,129,0,93,2),(2138,129,0,94,2),(2140,129,0,95,2),(2142,129,0,96,2),(2144,129,0,97,2),(2146,129,0,98,2),(2148,129,0,99,2),(2150,129,0,100,2),(2152,129,0,101,2),(2154,129,0,102,2),(2156,129,0,103,2),(2158,129,0,104,2),(2160,129,0,105,2),(2162,129,0,106,2),(2164,129,0,107,2),(2166,129,0,108,2),(2168,129,0,109,2),(2170,129,0,110,2),(2172,129,0,111,2),(2174,129,0,112,2),(2176,129,0,113,2),(2178,129,0,114,2),(2180,129,0,115,2),(2182,129,0,116,2),(2184,129,0,117,2),(2186,129,0,118,2),(2188,129,0,119,2),(2190,129,0,120,2),(2192,129,0,121,2),(2194,129,0,122,2),(2196,129,0,123,2),(2198,129,0,124,2),(2200,129,0,125,2),(2202,129,0,126,2),(2204,129,0,127,2),(2206,129,0,128,2),(2208,129,0,129,2),(2210,129,0,130,2),(2212,129,0,131,2),(2214,129,0,132,2),(2216,129,0,133,2),(2218,129,0,134,2),(2220,129,0,135,2),(2222,129,0,136,2),(2224,129,0,137,2),(2226,129,0,138,2),(2228,129,0,139,2),(2230,129,0,140,2),(2232,129,0,141,2),(2234,129,0,142,2),(2236,129,0,143,2),(2238,129,0,144,2),(2240,129,0,145,2),(2242,129,0,146,2),(2244,129,0,147,2),(2246,129,0,148,2),(2248,129,0,149,2),(2250,129,0,150,2),(2252,129,0,151,2),(2254,129,0,152,2),(2256,129,0,153,2),(2258,129,0,154,2),(2260,129,0,155,2),(2262,129,0,156,2),(2264,129,0,157,2),(2266,129,0,158,2),(2268,129,0,159,2),(2270,129,0,160,2),(2272,129,0,161,2),(2274,129,0,162,2),(2276,129,0,163,2),(2278,129,0,164,2),(2280,129,0,165,2),(2282,129,0,166,2),(2284,129,0,167,2),(2286,129,0,168,2),(2288,129,0,169,2),(2290,129,0,170,2),(2292,129,0,171,2),(2294,129,0,172,2),(2296,129,0,173,2),(2298,129,0,174,2),(2300,129,0,175,2),(2302,129,0,176,2),(2304,129,0,177,2),(2306,129,0,178,2),(2308,129,0,179,2),(2310,129,0,180,2),(2312,129,0,181,2),(2314,129,0,182,2),(2316,129,0,183,2),(2318,129,0,184,2),(2320,129,0,185,2),(2322,129,0,186,2),(2324,129,0,187,2),(2326,129,0,188,2),(2328,129,0,189,2),(2330,129,0,190,2),(2332,129,0,191,2),(2334,129,0,192,2),(2336,129,0,193,2),(2338,129,0,194,2),(2340,129,0,195,2),(2342,129,0,196,2),(2344,129,0,197,2),(2346,129,0,198,2),(2348,129,0,199,2),(2350,129,0,200,2),(2352,129,0,201,2),(2354,129,0,202,2),(2356,129,0,203,2),(2358,129,0,204,2),(2360,129,0,205,2),(2362,129,0,206,2),(2364,129,0,207,2),(2366,129,0,208,2),(2368,129,0,209,2),(2370,129,0,210,2),(2372,129,0,211,2),(2374,129,0,212,2),(2376,129,0,213,2),(2378,129,0,214,2),(2380,129,0,215,2),(2382,129,0,216,2),(2384,129,0,217,2),(2386,129,0,218,2),(2388,129,0,219,2),(2390,129,0,220,2),(2392,129,0,221,2),(2394,129,0,222,2),(2396,129,0,223,2);
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_entity_media_gallery`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_entity_media_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_entity_media_gallery` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  `media_type` varchar(32) NOT NULL DEFAULT 'image' COMMENT 'Media entry type',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility status',
  PRIMARY KEY (`value_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_entity_media_gallery`
--

LOCK TABLES `grocery_bag_catalog_product_entity_media_gallery` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_media_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_media_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_entity_media_gallery_value`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_entity_media_gallery_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_entity_media_gallery_value` (
  `value_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Value ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Disabled',
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Record Id',
  PRIMARY KEY (`record_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_ENTITY_ID` (`entity_id`),
  KEY `GROCERY_BAG_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_VALUE_ID` (`value_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_STORE_ID_GROCERY_BAG_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_VAL_ID_CAT_PRD_ENTT_MDA_GLR_VAL_ID` FOREIGN KEY (`value_id`) REFERENCES `grocery_bag_catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Value Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_entity_media_gallery_value`
--

LOCK TABLES `grocery_bag_catalog_product_entity_media_gallery_value` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_media_gallery_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_media_gallery_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_entity_media_gallery_value_to_entity`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_entity_media_gallery_value_to_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_entity_media_gallery_value_to_entity` (
  `value_id` int(10) unsigned NOT NULL COMMENT 'Value media Entry ID',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Product entity ID',
  UNIQUE KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_VAL_ID_ENTT_ID` (`value_id`,`entity_id`),
  KEY `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` (`entity_id`),
  CONSTRAINT `CAT_PRD_ENTT_MDA_GLR_VAL_TO_ENTT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A6C6C8FAA386736921D3A7C4B50B1185` FOREIGN KEY (`value_id`) REFERENCES `grocery_bag_catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Media value to Product entity table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_entity_media_gallery_value_to_entity`
--

LOCK TABLES `grocery_bag_catalog_product_entity_media_gallery_value_to_entity` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_media_gallery_value_to_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_media_gallery_value_to_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_entity_media_gallery_value_video`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_entity_media_gallery_value_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_entity_media_gallery_value_video` (
  `value_id` int(10) unsigned NOT NULL COMMENT 'Media Entity ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `provider` varchar(32) DEFAULT NULL COMMENT 'Video provider ID',
  `url` text COMMENT 'Video URL',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `description` text COMMENT 'Page Meta Description',
  `metadata` text COMMENT 'Video meta data',
  UNIQUE KEY `CAT_PRD_ENTT_MDA_GLR_VAL_VIDEO_VAL_ID_STORE_ID` (`value_id`,`store_id`),
  KEY `FK_71D68A485B92B39AD1E7ED1372D2DA0B` (`store_id`),
  CONSTRAINT `FK_6FDF205946906B0E653E60AA769899F8` FOREIGN KEY (`value_id`) REFERENCES `grocery_bag_catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_71D68A485B92B39AD1E7ED1372D2DA0B` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Video Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_entity_media_gallery_value_video`
--

LOCK TABLES `grocery_bag_catalog_product_entity_media_gallery_value_video` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_media_gallery_value_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_media_gallery_value_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_entity_text`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TEXT_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Text Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_entity_text`
--

LOCK TABLES `grocery_bag_catalog_product_entity_text` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_entity_tier_price`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_entity_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'QTY',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_E8AB433B9ACB00343ABB312AD2FAB087` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `grocery_bag_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_entity_tier_price`
--

LOCK TABLES `grocery_bag_catalog_product_entity_tier_price` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_entity_varchar`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_ENTT_VCHR_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=943 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_entity_varchar`
--

LOCK TABLES `grocery_bag_catalog_product_entity_varchar` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_varchar` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_product_entity_varchar` VALUES (79,70,0,26,'Enfamil a+ stage 2 milk powder tin 800g'),(80,103,0,26,'container2'),(82,70,0,27,'Enfagrow a+ growing milk vani 800g'),(83,103,0,27,'container2'),(85,70,0,28,'Enfagrow a+4 tin 800g'),(86,103,0,28,'container2'),(88,70,0,29,'Enfamil a+2 milk powder 400g'),(89,103,0,29,'container2'),(91,70,0,30,'Anchor pediapro 2-5 year child. 1kg'),(92,103,0,30,'container2'),(94,70,0,31,'Enfagrow a+ growing milk vani 400g'),(95,103,0,31,'container2'),(97,70,0,32,'Nan stage 2 h.a. milk powder 400g'),(98,103,0,32,'container2'),(100,70,0,33,'Enfagrow a+4 tin 400g'),(101,103,0,33,'container2'),(103,70,0,34,'Sma gold 3 milk powder tin 400g'),(104,103,0,34,'container2'),(106,70,0,35,'Cow/gate premium 400g'),(107,103,0,35,'container2'),(109,70,0,36,'Nan stage 3 milk powder tin 400g'),(110,103,0,36,'container2'),(112,70,0,37,'Sma gold 1 milk powder tin 400g'),(113,103,0,37,'container2'),(115,70,0,38,'Nestle cerelac mixed fruit 300g'),(116,103,0,38,'container2'),(118,70,0,39,'Nestle cerelac dhal+veget.+rice 300g'),(119,103,0,39,'container2'),(121,70,0,40,'Nestle cerelac vegetable & rice 300g'),(122,103,0,40,'container2'),(124,70,0,41,'Nestle cerelac wheat apple 300g'),(125,103,0,41,'container2'),(127,70,0,42,'Nestle cerelac red rice baby meal 300g'),(128,103,0,42,'container2'),(130,70,0,43,'Nestle nestum fruits cereal 240g'),(131,103,0,43,'container2'),(133,70,0,44,'Nestle green gram cereal 240g'),(134,103,0,44,'container2'),(136,70,0,45,'Heinz baby dessert pear&ban. 4+ 170g'),(137,103,0,45,'container2'),(139,70,0,46,'Heinz baby custard vanila 6+ 110g'),(140,103,0,46,'container2'),(142,70,0,47,'Heinz baby custard str.&ban. 6+ 110g'),(143,103,0,47,'container2'),(145,70,0,48,'Heinz baby custard caramel 6+ 120g'),(146,103,0,48,'container2'),(148,70,0,49,'Heinz baby yoghurt fruit sa. 6+ 110g'),(149,103,0,49,'container2'),(151,70,0,50,'Heinz baby gel apple&bla.cu. 6+ 110g'),(152,103,0,50,'container2'),(154,70,0,51,'Heinz baby dessert pear&ban. 4+ 110g'),(155,103,0,51,'container2'),(157,70,0,52,'Bellybees baby f. papaya & man. 150g'),(158,103,0,52,'container2'),(160,70,0,53,'Bellybees babyfood mango 150g'),(161,103,0,53,'container2'),(163,70,0,54,'Cow/gate mushr.&chi. with nood. 250g'),(164,103,0,54,'container2'),(166,70,0,55,'Cow/gate chicken&tasty veg pot 200g'),(167,103,0,55,'container2'),(169,70,0,56,'Cow/gate baby f.rice pudding 125g'),(170,103,0,56,'container2'),(172,70,0,57,'Heinz baby meal pum.&sw. co. 4+ 110g'),(173,103,0,57,'container2'),(175,70,0,58,'Heinz farleys rusk banana 150g'),(176,103,0,58,'container2'),(178,70,0,59,'Heinz farleys rusk orange 150g'),(179,103,0,59,'container2'),(181,70,0,60,'Heinz farleys rusk original 150g'),(182,103,0,60,'container2'),(184,70,0,61,'Heinz farleys rusk apple 60g'),(185,103,0,61,'container2'),(187,70,0,62,'Munchee baby rusk 100g'),(188,103,0,62,'container2'),(190,70,0,63,'Little lion golden cow rusk 110g'),(191,103,0,63,'container2'),(193,70,0,64,'Munchee baby rusk 60g'),(194,103,0,64,'container2'),(196,70,0,65,'Little lion g/cow rusk original 70g'),(197,103,0,65,'container2'),(199,70,0,66,'Little lion g/cow rusk banana 70g'),(200,103,0,66,'container2'),(202,70,0,67,'Kids joy large bowl+fork+spoon a1301'),(203,103,0,67,'container2'),(205,70,0,68,'Kids joy spill proof cup a807'),(206,103,0,68,'container2'),(208,70,0,69,'Kids joy nipple+bottle brush a1405'),(209,103,0,69,'container2'),(211,70,0,70,'Farlin gum soother rubber bf141'),(212,103,0,70,'container2'),(214,70,0,71,'Drypers drypants large diapers 36s'),(215,103,0,71,'container2'),(217,70,0,72,'Soft love baby diapers xl 54s'),(218,103,0,72,'container2'),(220,70,0,73,'Soft love bany diapers large 54s'),(221,103,0,73,'container2'),(223,70,0,74,'Soft love baby diapers medium 54s'),(224,103,0,74,'container2'),(226,70,0,75,'Drypers wee wee dry xl 36s'),(227,103,0,75,'container2'),(229,70,0,76,'Drypers drypants medium diapers 24s'),(230,103,0,76,'container2'),(232,70,0,77,'Pampers baby diapers large 32s'),(233,103,0,77,'container2'),(235,70,0,78,'Pampers diaper medium 34s'),(236,103,0,78,'container2'),(238,70,0,79,'Drypers wee wee dry xxl 16s'),(239,103,0,79,'container2'),(241,70,0,80,'Soft love baby diapers medium 12s'),(242,103,0,80,'container2'),(244,70,0,81,'Soft love baby diapers large 11s'),(245,103,0,81,'container2'),(247,70,0,82,'Soft love baby diapers xl 10s'),(248,103,0,82,'container2'),(250,70,0,83,'J & j baby skincare wipes 80s'),(251,103,0,83,'container2'),(253,70,0,84,'Farlin wet wipes refill ant rash 85s'),(254,103,0,84,'container2'),(256,70,0,85,'Baby cheramy nappy wash powder nappy 1kg'),(257,103,0,85,'container2'),(259,70,0,86,'Cute baby baby wipes 80s'),(260,103,0,86,'container2'),(262,70,0,87,'Aquawipe baby wipes 40s'),(263,103,0,87,'container2'),(265,70,0,88,'Teepol kids dishwash odourless 500ml'),(266,103,0,88,'container2'),(268,70,0,89,'J&j baby butterfly care pack'),(269,103,0,89,'container2'),(271,70,0,90,'J&j baby duck care pack'),(272,103,0,90,'container2'),(274,70,0,91,'J & j baby lotio.alo/vit e 500ml mal'),(275,103,0,91,'container2'),(277,70,0,92,'J&j baby soft pink cream 100g'),(278,103,0,92,'container2'),(280,70,0,93,'J&j baby avocado hair oil 200ml'),(281,103,0,93,'container2'),(283,70,0,94,'J & j baby shampoo soft&shiny 200ml'),(284,103,0,94,'container2'),(286,70,0,95,'J & j baby lotion alo/vit e 200ml'),(287,103,0,95,'container2'),(289,70,0,96,'J & j baby bath milk + rice 200ml'),(290,103,0,96,'container2'),(292,70,0,97,'J&j baby regular bath 200ml'),(293,103,0,97,'container2'),(295,70,0,98,'J & j baby bath peach vi e 200ml mal'),(296,103,0,98,'container2'),(298,70,0,99,'Baby cher.cologne 100ml buy 2&1 free'),(299,103,0,99,'container2'),(301,70,0,100,'J & j baby lotion 200ml (ind)'),(302,103,0,100,'container2'),(304,70,0,101,'Little prin.sh/gel jade garden 250ml'),(305,103,0,101,'container2'),(307,70,0,102,'Little prin.sh/gel rose petal 250ml'),(308,103,0,102,'container2'),(310,70,0,103,'Shai safe eyebrow razor 3s'),(311,103,0,103,'container2'),(313,70,0,104,'Dorco shai safe eyebrow razor'),(314,103,0,104,'container2'),(316,70,0,105,'Godrej aer twist car fragrance fresh'),(317,103,0,105,'container2'),(319,70,0,106,'Godrej aer twist car fragrance cool'),(320,103,0,106,'container2'),(322,70,0,107,'Godrej aer twist car fragrance petal'),(323,103,0,107,'container2'),(325,70,0,108,'Ambipur car a/f str.pack lav/spa 7ml'),(326,103,0,108,'container2'),(328,70,0,109,'Ambipur car air/f str.pack aqua 7ml'),(329,103,0,109,'container2'),(331,70,0,110,'Godrej aer click car fragrance fresh'),(332,103,0,110,'container2'),(334,70,0,111,'Godrej aer click car fragrance cool'),(335,103,0,111,'container2'),(337,70,0,112,'Godrej aer click musk 9ml'),(338,103,0,112,'container2'),(340,70,0,113,'Glade air freshener sport cool water 7ml'),(341,103,0,113,'container2'),(343,70,0,114,'Glade a/fresh. sport trop/fresh 7ml'),(344,103,0,114,'container2'),(346,70,0,115,'Mini poppy car air freshener 10ml'),(347,103,0,115,'container2'),(349,70,0,116,'Ntc cleaning cloth pva chamois'),(350,103,0,116,'container2'),(352,70,0,117,'Mal car wash mop complete'),(353,103,0,117,'container2'),(355,70,0,118,'Str tire shine 500ml'),(356,103,0,118,'container2'),(358,70,0,119,'Wonder wipe microfiber cloth car'),(359,103,0,119,'container2'),(361,70,0,120,'Britol car interior cleaner 475ml'),(362,103,0,120,'container2'),(364,70,0,121,'Str carwax liquid 225ml'),(365,103,0,121,'container2'),(367,70,0,122,'Str carpet upholstery hightech 500ml'),(368,103,0,122,'container2'),(370,70,0,123,'Str polish dash board 118ml'),(371,103,0,123,'container2'),(373,70,0,124,'Dash car wash 800ml'),(374,103,0,124,'container2'),(376,70,0,125,'Dash original shine 200ml'),(377,103,0,125,'container2'),(379,70,0,126,'Britol leather care liquid 300ml'),(380,103,0,126,'container2'),(382,70,0,127,'Britol car wash 500ml'),(383,103,0,127,'container2'),(385,70,0,128,'Str radiator coolant engine 1l'),(386,103,0,128,'container2'),(388,70,0,129,'Airwick a/fre.aerosol vel/rose 249ml'),(389,103,0,129,'container2'),(391,70,0,130,'Airwick liquid spray lavender 475ml'),(392,103,0,130,'container2'),(394,70,0,131,'Airwick liquid spray jasmine 475ml'),(395,103,0,131,'container2'),(397,70,0,132,'Airwick liquid spray eng/rose 475ml'),(398,103,0,132,'container2'),(400,70,0,133,'Glade a/f touch+f.wild lavender 12ml'),(401,103,0,133,'container2'),(403,70,0,134,'K choice a/fresh spray jasmine 475ml'),(404,103,0,134,'container2'),(406,70,0,135,'Mal broom with stick xl'),(407,103,0,135,'container2'),(409,70,0,136,'Mal mop with plastic handle'),(410,103,0,136,'container2'),(412,70,0,137,'Kitchen eazy dish wand 60g'),(413,103,0,137,'container2'),(415,70,0,138,'Mal floor wiper small'),(416,103,0,138,'container2'),(418,70,0,139,'Mal dust pan set large'),(419,103,0,139,'container2'),(421,70,0,140,'Mal ekal broom'),(422,103,0,140,'container2'),(424,70,0,141,'H&s broom with stick hb001'),(425,103,0,141,'container2'),(427,70,0,142,'Mal floor brush with handle'),(428,103,0,142,'container2'),(430,70,0,143,'Mal scavenger broom'),(431,103,0,143,'container2'),(433,70,0,144,'Ravi pot brush da004blpv'),(434,103,0,144,'container2'),(436,70,0,145,'Ravi multi purpose scrub sc025dpv'),(437,103,0,145,'container2'),(439,70,0,146,'H & s cloth pegs w/bottle 20s'),(440,103,0,146,'container2'),(442,70,0,147,'Vim dishwash liquid anti bacterial 500ml'),(443,103,0,147,'container2'),(445,70,0,148,'Vim dishwash liquid 500ml'),(446,103,0,148,'container2'),(448,70,0,149,'Teepol dish wash gel lime 500ml'),(449,103,0,149,'container2'),(451,70,0,150,'Teepol dishwash liquid gel orange 500ml'),(452,103,0,150,'container2'),(454,70,0,151,'Dash gliz dish wash lime liquid 500ml'),(455,103,0,151,'container2'),(457,70,0,152,'K choice dish wash 500ml'),(458,103,0,152,'container2'),(460,70,0,153,'Britol tip scouring powder 600g'),(461,103,0,153,'container2'),(463,70,0,154,'Vim dish wash powder dubble action 650g'),(464,103,0,154,'container2'),(466,70,0,155,'K choice dishwash powder 650g'),(467,103,0,155,'container2'),(469,70,0,156,'Britol dishwash bar 200g'),(470,103,0,156,'container2'),(472,70,0,157,'K choice dish wash bar 200g'),(473,103,0,157,'container2'),(475,70,0,158,'Britol dishwash bar 100g'),(476,103,0,158,'container2'),(478,70,0,159,'Dettol liquid large 500ml'),(479,103,0,159,'container2'),(481,70,0,160,'Lysol citrus 950ml'),(482,103,0,160,'container2'),(484,70,0,161,'Lysol floral 950ml'),(485,103,0,161,'container2'),(487,70,0,162,'Mr muscle kitchen cleaner 500ml'),(488,103,0,162,'container2'),(490,70,0,163,'Lysol citrus 500ml'),(491,103,0,163,'container2'),(493,70,0,164,'Lysol floral 500ml'),(494,103,0,164,'container2'),(496,70,0,165,'Lysol disinfectant lavender 500ml'),(497,103,0,165,'container2'),(499,70,0,166,'Lysol pine all purpose clean 500ml'),(500,103,0,166,'container2'),(502,70,0,167,'Lankem fenol 750ml'),(503,103,0,167,'container2'),(505,70,0,168,'Dash cream cleanser 500ml'),(506,103,0,168,'container2'),(508,70,0,169,'Colin glass household cleaner 500ml'),(509,103,0,169,'container2'),(511,70,0,170,'K choice glass cleaner 500ml'),(512,103,0,170,'container2'),(514,70,0,171,'Mr muscle fl/cleaner flor.per. 500ml'),(515,103,0,171,'container2'),(517,70,0,172,'Dash tile cleaner 500ml'),(518,103,0,172,'container2'),(520,70,0,173,'K choice tile cleanr 500ml'),(521,103,0,173,'container2'),(523,70,0,174,'Kiwi dranex 375g'),(524,103,0,174,'container2'),(526,70,0,175,'Harpic fresh pine 750ml'),(527,103,0,175,'container2'),(529,70,0,176,'Harpic fresh floral 750ml'),(530,103,0,176,'container2'),(532,70,0,177,'Harpic fresh pine 500ml'),(533,103,0,177,'container2'),(535,70,0,178,'Harpic fresh floral 500ml'),(536,103,0,178,'container2'),(538,70,0,179,'Kiwi kleenflush super active 500ml'),(539,103,0,179,'container2'),(541,70,0,180,'K choice t/bowl cleaner floral 500ml'),(542,103,0,180,'container2'),(544,70,0,181,'K choice toilet bowl cleaner power 500ml'),(545,103,0,181,'container2'),(547,70,0,182,'Acon party favors paper cups pink 6s'),(548,103,0,182,'container2'),(550,70,0,183,'K choice plastic cups 12s'),(551,103,0,183,'container2'),(553,70,0,184,'Acon disposable spoons 50s'),(554,103,0,184,'container2'),(556,70,0,185,'Safepac knife 25 s'),(557,103,0,185,'container2'),(559,70,0,186,'Acon party favors spoons 12s'),(560,103,0,186,'container2'),(562,70,0,187,'K choice straws 25s'),(563,103,0,187,'container2'),(565,70,0,188,'Safepac 7 inches plate sup 25s'),(566,103,0,188,'container2'),(568,70,0,189,'Pranjapanee medi.t/picks holder 100s'),(569,103,0,189,'container2'),(571,70,0,190,'Flora disney paper plates 10s'),(572,103,0,190,'container2'),(574,70,0,191,'Pranjapanee medi.t/picks refill 100s'),(575,103,0,191,'container2'),(577,70,0,192,'Flora wooden tooth picks 500s'),(578,103,0,192,'container2'),(580,70,0,193,'Pranjapanee cinnamon toothpicks 40s'),(581,103,0,193,'container2'),(583,70,0,194,'Flora barbecue sticks 6 100s'),(584,103,0,194,'container2'),(586,70,0,195,'Flora tooth picks plastic jar 200s'),(587,103,0,195,'container2'),(589,70,0,196,'K choice paper plates 7inch 25s'),(590,103,0,196,'container2'),(592,70,0,197,'Flora wooden tooth picks 100s'),(593,103,0,197,'container2'),(595,70,0,198,'Cardinal floor polish brown 750g'),(596,103,0,198,'container2'),(598,70,0,199,'Mansion wax white 600g'),(599,103,0,199,'container2'),(601,70,0,200,'Cardinal red floor polish 800g'),(602,103,0,200,'container2'),(604,70,0,201,'K choice garbage bag yellow xl 10s'),(605,103,0,201,'container2'),(607,70,0,202,'K choice garbage bag blue xl 10s'),(608,103,0,202,'container2'),(610,70,0,203,'K choice garbage bag xl 20x8x36 10s'),(611,103,0,203,'container2'),(613,70,0,204,'Acon party disposable glove 100s'),(614,103,0,204,'container2'),(616,70,0,205,'Rusiru gloves double side dot'),(617,103,0,205,'container2'),(619,70,0,206,'Oxypura face mask city medium'),(620,103,0,206,'container2'),(622,70,0,207,'Oxypura face mask city large'),(623,103,0,207,'container2'),(625,70,0,208,'Ikleen  lint roller 60 sheet'),(626,103,0,208,'container2'),(628,70,0,209,'Ikleen lint roller 20 sheet'),(629,103,0,209,'container2'),(631,70,0,210,'Ikleen refill 60s economy pack'),(632,103,0,210,'container2'),(634,70,0,211,'Kiwi shoe shine brush'),(635,103,0,211,'container2'),(637,70,0,212,'Kiwi shoe shine sponge neutral'),(638,103,0,212,'container2'),(640,70,0,213,'Kiwi shoe shine sponge black'),(641,103,0,213,'container2'),(643,70,0,214,'Kiwi shoe polish black 75ml'),(644,103,0,214,'container2'),(646,70,0,215,'Kiwi shoe polish neutral 75ml'),(647,103,0,215,'container2'),(649,70,0,216,'Kiwi casual shoe pollish brown 75ml'),(650,103,0,216,'container2'),(652,70,0,217,'Silver shine sponge black 6ml'),(653,103,0,217,'container2'),(655,70,0,218,'Kiwi shoe polish black 36g'),(656,103,0,218,'container2'),(658,70,0,219,'Kiwi shoe whitener  120g'),(659,103,0,219,'container2'),(661,70,0,220,'Quality shine furniture polish 450ml'),(662,103,0,220,'container2'),(664,70,0,221,'Brasso medium 200ml'),(665,103,0,221,'container2'),(667,70,0,222,'Cleanapp m/purpo. cleaning wipe roll'),(668,103,0,222,'container2'),(670,70,0,223,'Wonder wipe microfiber cloth general'),(671,103,0,223,'container2'),(673,70,0,224,'Comfort f/cond.ultra pure baby 800ml'),(674,103,0,224,'container2'),(676,70,0,225,'Comfort fabric cond. anti bac. 800ml'),(677,103,0,225,'container2'),(679,70,0,226,'Tide de.powder jasmine & rose 2kg'),(680,103,0,226,'container2'),(682,70,0,227,'Safematic liquid detergent 1l'),(683,103,0,227,'container2'),(685,70,0,228,'Surf excel matic w/p front load 1kg'),(686,103,0,228,'container2'),(688,70,0,229,'Bubble compact detergent powder 1kg'),(689,103,0,229,'container2'),(691,70,0,230,'Surf excel matic washing powder 1kg'),(692,103,0,230,'container2'),(694,70,0,231,'Tide detergent powder jasmin rose 1kg'),(695,103,0,231,'container2'),(697,70,0,232,'Surf excel w/powder x tra clean 1kg'),(698,103,0,232,'container2'),(700,70,0,233,'Rin washing powder 1kg'),(701,103,0,233,'container2'),(703,70,0,234,'Surf excel matic washing powder 500g'),(704,103,0,234,'container2'),(706,70,0,235,'Bubble compact detergent powder 500g'),(707,103,0,235,'container2'),(709,70,0,236,'Tide de.powder jasmine & rose 500g'),(710,103,0,236,'container2'),(712,70,0,237,'Surf excel w/powder x tra clean 500g'),(713,103,0,237,'container2'),(715,70,0,238,'Pierrot sensitive mouthwash 500ml'),(716,103,0,238,'container2'),(718,70,0,239,'Pierrot junior mouthwash 500ml'),(719,103,0,239,'container2'),(721,70,0,240,'Pierrot anti plaque mouth wash 500ml'),(722,103,0,240,'container2'),(724,70,0,241,'Listerine fresh burst mouth wash 250ml'),(725,103,0,241,'container2'),(727,70,0,242,'Listerine original mouthwash 250ml'),(728,103,0,242,'container2'),(730,70,0,243,'Fresh breath mouthwash spray 100ml'),(731,103,0,243,'container2'),(733,70,0,244,'Kool n fresh mouth wash 250ml'),(734,103,0,244,'container2'),(736,70,0,245,'Clogard mouth wash 200ml'),(737,103,0,245,'container2'),(739,70,0,246,'Listerine cool mint mouth wash 80ml'),(740,103,0,246,'container2'),(742,70,0,247,'Listerine fresh burst mouth wash 80ml'),(743,103,0,247,'container2'),(745,70,0,248,'Listerine original mouthwash 80ml'),(746,103,0,248,'container2'),(748,70,0,249,'Pierrot strawberry dental gel 50ml'),(749,103,0,249,'container2'),(751,70,0,250,'Colgate total mint toothpaste 140g'),(752,103,0,250,'container2'),(754,70,0,251,'Sensodyne rapid relief toothpaste 80g'),(755,103,0,251,'container2'),(757,70,0,252,'Sensodyne tp. total/multi care 100g'),(758,103,0,252,'container2'),(760,70,0,253,'Sensodyne tooth paste cool gel 100g'),(761,103,0,253,'container2'),(763,70,0,254,'Sensodyne fresh mint toothpaste 100g'),(764,103,0,254,'container2'),(766,70,0,255,'Colgate max fresh toothpaste red 150g'),(767,103,0,255,'container2'),(769,70,0,256,'Colgate max fresh toothpaste green 150g'),(770,103,0,256,'container2'),(772,70,0,257,'Follow me kids toothpaste 50g'),(773,103,0,257,'container2'),(775,70,0,258,'Kodomo strawberry tooth paste 45g'),(776,103,0,258,'container2'),(778,70,0,259,'Kodomo mixed fruit tooth paste 45g'),(779,103,0,259,'container2'),(781,70,0,260,'Sensodyne rapid relief toothpaste 40g'),(782,103,0,260,'container2'),(784,70,0,261,'Pierrot sensitive toothbrush extra soft'),(785,103,0,261,'container2'),(787,70,0,262,'Pierrotenergy toothbrush medium'),(788,103,0,262,'container2'),(790,70,0,263,'Pierrot baby toothbrush'),(791,103,0,263,'container2'),(793,70,0,264,'Pierrot gusy toothbrush'),(794,103,0,264,'container2'),(796,70,0,265,'Pierrot energy soft toothbrush'),(797,103,0,265,'container2'),(799,70,0,266,'Pierrot monster toothbrush suave soft'),(800,103,0,266,'container2'),(802,70,0,267,'Denta comfort toothbrush double pack'),(803,103,0,267,'container2'),(805,70,0,268,'Denta comfort tooth brush medium'),(806,103,0,268,'container2'),(808,70,0,269,'Clogard smart plus toothbrush'),(809,103,0,269,'container2'),(811,70,0,270,'Signal expert toothbrush'),(812,103,0,270,'container2'),(814,70,0,271,'Clogard chooty tooth brush'),(815,103,0,271,'container2'),(817,70,0,272,'Clogard smart toothbrush'),(818,103,0,272,'container2'),(820,70,0,273,'Aquawipe hand wipes antibacterial'),(821,103,0,273,'container2'),(823,70,0,274,'Flora facial tissues 200s 2 ply'),(824,103,0,274,'container2'),(826,70,0,275,'Flora facial tissues 160s'),(827,103,0,275,'container2'),(829,70,0,276,'Flora hygienic wet wipes 10s'),(830,103,0,276,'container2'),(832,70,0,277,'K choice facial tissues 160s'),(833,103,0,277,'container2'),(835,70,0,278,'Flora handkerchi. tissue 2ply v/pack'),(836,103,0,278,'container2'),(838,70,0,279,'Flora facial tissues 100s'),(839,103,0,279,'container2'),(841,70,0,280,'K choice facial tissues 100s'),(842,103,0,280,'container2'),(844,70,0,281,'K choice tall tissue box color 80s'),(845,103,0,281,'container2'),(847,70,0,282,'Flora facial tissues 50s'),(848,103,0,282,'container2'),(850,70,0,283,'Flora handkerchief tissues 1'),(851,103,0,283,'container2'),(853,70,0,284,'K choice pocket facial tissues 15s'),(854,103,0,284,'container2'),(856,70,0,285,'Nimex kitch/towel off/whi.2s'),(857,103,0,285,'container2'),(859,70,0,286,'Flora kitchen towels twin'),(860,103,0,286,'container2'),(862,70,0,287,'Flora hand towel multi fold 200s'),(863,103,0,287,'container2'),(865,70,0,288,'Nimex paper/ serviette 1ply 100'),(866,103,0,288,'container2'),(868,70,0,289,'Flora toilet rolls 10s'),(869,103,0,289,'container2'),(871,70,0,290,'K choice toilet rolls 10s'),(872,103,0,290,'container2'),(874,70,0,291,'Flora toilet rolls 6 pack'),(875,103,0,291,'container2'),(877,70,0,292,'Flora toilet rolls jumbo 4s'),(878,103,0,292,'container2'),(880,70,0,293,'K choice toilet rolls 4s'),(881,103,0,293,'container2'),(883,70,0,294,'Nimex toilet rolls 2s'),(884,103,0,294,'container2'),(886,70,0,295,'Flora toilet roll twin pack'),(887,103,0,295,'container2'),(889,70,0,296,'K choice toilet rolls 2s'),(890,103,0,296,'container2'),(892,70,0,297,'Nimex toilet roll single'),(893,103,0,297,'container2'),(895,70,0,298,'Flora toilet rolls single'),(896,103,0,298,'container2'),(898,70,0,299,'Flora toilet roll embosse 3 ply'),(899,103,0,299,'container2'),(901,70,0,300,'K choice toilet rolls 1s'),(902,103,0,300,'container2'),(904,70,0,301,'K choice balloons red 9in 25s'),(905,103,0,301,'container2'),(907,70,0,302,'K choice balloons assorted 9in 25s'),(908,103,0,302,'container2'),(910,70,0,303,'Acon party b day candle set star'),(911,103,0,303,'container2'),(913,70,0,304,'Acon party b day candle set letter'),(914,103,0,304,'container2'),(916,70,0,305,'Acon snow spray party 3oz'),(917,103,0,305,'container2'),(919,70,0,306,'Acon party favors glow light stick'),(920,103,0,306,'container2'),(922,70,0,307,'Acon p/favours bday banner asst'),(923,103,0,307,'container2'),(925,70,0,308,'Aztec gold sparklers junior 10s'),(926,103,0,308,'container2'),(928,70,0,309,'Green house paper ribbon gold & silver'),(929,103,0,309,'container2'),(931,70,0,310,'Green house p/ribbon asso. 3 colour'),(932,103,0,310,'container2'),(934,70,0,311,'Acon party favors crape strips 30s'),(935,103,0,311,'container2'),(937,70,0,312,'Actifit adult diaper large 10s'),(938,103,0,312,'container2'),(940,70,0,313,'Actifit adult diaper medium 10s'),(941,103,0,313,'container2');
/*!40000 ALTER TABLE `grocery_bag_catalog_product_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_eav`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_eav`
--

LOCK TABLES `grocery_bag_catalog_product_index_eav` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_eav` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_eav_decimal`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_eav_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_eav_decimal`
--

LOCK TABLES `grocery_bag_catalog_product_index_eav_decimal` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_eav_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_eav_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_eav_decimal_idx`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_eav_decimal_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_eav_decimal_idx`
--

LOCK TABLES `grocery_bag_catalog_product_index_eav_decimal_idx` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_eav_decimal_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_eav_decimal_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_eav_decimal_tmp`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_eav_decimal_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_eav_decimal_tmp`
--

LOCK TABLES `grocery_bag_catalog_product_index_eav_decimal_tmp` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_eav_decimal_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_eav_decimal_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_eav_idx`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_eav_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_eav_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_eav_idx`
--

LOCK TABLES `grocery_bag_catalog_product_index_eav_idx` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_eav_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_eav_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_eav_tmp`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_eav_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_eav_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  KEY `CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_eav_tmp`
--

LOCK TABLES `grocery_bag_catalog_product_index_eav_tmp` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_eav_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_eav_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`),
  CONSTRAINT `CATALOG_PRODUCT_INDEX_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_IDX_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `grocery_bag_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_IDX_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price`
--

LOCK TABLES `grocery_bag_catalog_product_index_price` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_product_index_price` VALUES (26,0,1,2,2750.0000,2750.0000,2750.0000,2750.0000,NULL),(26,1,1,2,2750.0000,2750.0000,2750.0000,2750.0000,NULL),(26,2,1,2,2750.0000,2750.0000,2750.0000,2750.0000,NULL),(26,3,1,2,2750.0000,2750.0000,2750.0000,2750.0000,NULL),(27,0,1,2,2700.0000,2700.0000,2700.0000,2700.0000,NULL),(27,1,1,2,2700.0000,2700.0000,2700.0000,2700.0000,NULL),(27,2,1,2,2700.0000,2700.0000,2700.0000,2700.0000,NULL),(27,3,1,2,2700.0000,2700.0000,2700.0000,2700.0000,NULL),(28,0,1,2,2500.0000,2500.0000,2500.0000,2500.0000,NULL),(28,1,1,2,2500.0000,2500.0000,2500.0000,2500.0000,NULL),(28,2,1,2,2500.0000,2500.0000,2500.0000,2500.0000,NULL),(28,3,1,2,2500.0000,2500.0000,2500.0000,2500.0000,NULL),(29,0,1,2,1480.0000,1480.0000,1480.0000,1480.0000,NULL),(29,1,1,2,1480.0000,1480.0000,1480.0000,1480.0000,NULL),(29,2,1,2,1480.0000,1480.0000,1480.0000,1480.0000,NULL),(29,3,1,2,1480.0000,1480.0000,1480.0000,1480.0000,NULL),(30,0,1,2,1450.0000,1450.0000,1450.0000,1450.0000,NULL),(30,1,1,2,1450.0000,1450.0000,1450.0000,1450.0000,NULL),(30,2,1,2,1450.0000,1450.0000,1450.0000,1450.0000,NULL),(30,3,1,2,1450.0000,1450.0000,1450.0000,1450.0000,NULL),(31,0,1,2,1430.0000,1430.0000,1430.0000,1430.0000,NULL),(31,1,1,2,1430.0000,1430.0000,1430.0000,1430.0000,NULL),(31,2,1,2,1430.0000,1430.0000,1430.0000,1430.0000,NULL),(31,3,1,2,1430.0000,1430.0000,1430.0000,1430.0000,NULL),(32,0,1,2,1400.0000,1400.0000,1400.0000,1400.0000,NULL),(32,1,1,2,1400.0000,1400.0000,1400.0000,1400.0000,NULL),(32,2,1,2,1400.0000,1400.0000,1400.0000,1400.0000,NULL),(32,3,1,2,1400.0000,1400.0000,1400.0000,1400.0000,NULL),(33,0,1,2,1330.0000,1330.0000,1330.0000,1330.0000,NULL),(33,1,1,2,1330.0000,1330.0000,1330.0000,1330.0000,NULL),(33,2,1,2,1330.0000,1330.0000,1330.0000,1330.0000,NULL),(33,3,1,2,1330.0000,1330.0000,1330.0000,1330.0000,NULL),(34,0,1,2,1200.0000,1200.0000,1200.0000,1200.0000,NULL),(34,1,1,2,1200.0000,1200.0000,1200.0000,1200.0000,NULL),(34,2,1,2,1200.0000,1200.0000,1200.0000,1200.0000,NULL),(34,3,1,2,1200.0000,1200.0000,1200.0000,1200.0000,NULL),(35,0,1,2,1180.0000,1180.0000,1180.0000,1180.0000,NULL),(35,1,1,2,1180.0000,1180.0000,1180.0000,1180.0000,NULL),(35,2,1,2,1180.0000,1180.0000,1180.0000,1180.0000,NULL),(35,3,1,2,1180.0000,1180.0000,1180.0000,1180.0000,NULL),(36,0,1,2,1175.0000,1175.0000,1175.0000,1175.0000,NULL),(36,1,1,2,1175.0000,1175.0000,1175.0000,1175.0000,NULL),(36,2,1,2,1175.0000,1175.0000,1175.0000,1175.0000,NULL),(36,3,1,2,1175.0000,1175.0000,1175.0000,1175.0000,NULL),(37,0,1,2,1150.0000,1150.0000,1150.0000,1150.0000,NULL),(37,1,1,2,1150.0000,1150.0000,1150.0000,1150.0000,NULL),(37,2,1,2,1150.0000,1150.0000,1150.0000,1150.0000,NULL),(37,3,1,2,1150.0000,1150.0000,1150.0000,1150.0000,NULL),(38,0,1,2,400.0000,400.0000,400.0000,400.0000,NULL),(38,1,1,2,400.0000,400.0000,400.0000,400.0000,NULL),(38,2,1,2,400.0000,400.0000,400.0000,400.0000,NULL),(38,3,1,2,400.0000,400.0000,400.0000,400.0000,NULL),(39,0,1,2,390.0000,390.0000,390.0000,390.0000,NULL),(39,1,1,2,390.0000,390.0000,390.0000,390.0000,NULL),(39,2,1,2,390.0000,390.0000,390.0000,390.0000,NULL),(39,3,1,2,390.0000,390.0000,390.0000,390.0000,NULL),(40,0,1,2,380.0000,380.0000,380.0000,380.0000,NULL),(40,1,1,2,380.0000,380.0000,380.0000,380.0000,NULL),(40,2,1,2,380.0000,380.0000,380.0000,380.0000,NULL),(40,3,1,2,380.0000,380.0000,380.0000,380.0000,NULL),(41,0,1,2,375.0000,375.0000,375.0000,375.0000,NULL),(41,1,1,2,375.0000,375.0000,375.0000,375.0000,NULL),(41,2,1,2,375.0000,375.0000,375.0000,375.0000,NULL),(41,3,1,2,375.0000,375.0000,375.0000,375.0000,NULL),(42,0,1,2,375.0000,375.0000,375.0000,375.0000,NULL),(42,1,1,2,375.0000,375.0000,375.0000,375.0000,NULL),(42,2,1,2,375.0000,375.0000,375.0000,375.0000,NULL),(42,3,1,2,375.0000,375.0000,375.0000,375.0000,NULL),(43,0,1,2,370.0000,370.0000,370.0000,370.0000,NULL),(43,1,1,2,370.0000,370.0000,370.0000,370.0000,NULL),(43,2,1,2,370.0000,370.0000,370.0000,370.0000,NULL),(43,3,1,2,370.0000,370.0000,370.0000,370.0000,NULL),(44,0,1,2,325.0000,325.0000,325.0000,325.0000,NULL),(44,1,1,2,325.0000,325.0000,325.0000,325.0000,NULL),(44,2,1,2,325.0000,325.0000,325.0000,325.0000,NULL),(44,3,1,2,325.0000,325.0000,325.0000,325.0000,NULL),(45,0,1,2,490.0000,490.0000,490.0000,490.0000,NULL),(45,1,1,2,490.0000,490.0000,490.0000,490.0000,NULL),(45,2,1,2,490.0000,490.0000,490.0000,490.0000,NULL),(45,3,1,2,490.0000,490.0000,490.0000,490.0000,NULL),(46,0,1,2,350.0000,350.0000,350.0000,350.0000,NULL),(46,1,1,2,350.0000,350.0000,350.0000,350.0000,NULL),(46,2,1,2,350.0000,350.0000,350.0000,350.0000,NULL),(46,3,1,2,350.0000,350.0000,350.0000,350.0000,NULL),(47,0,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(47,1,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(47,2,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(47,3,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(48,0,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(48,1,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(48,2,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(48,3,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(49,0,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(49,1,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(49,2,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(49,3,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(50,0,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(50,1,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(50,2,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(50,3,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(51,0,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(51,1,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(51,2,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(51,3,1,2,340.0000,340.0000,340.0000,340.0000,NULL),(52,0,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(52,1,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(52,2,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(52,3,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(53,0,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(53,1,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(53,2,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(53,3,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(54,0,1,2,720.0000,720.0000,720.0000,720.0000,NULL),(54,1,1,2,720.0000,720.0000,720.0000,720.0000,NULL),(54,2,1,2,720.0000,720.0000,720.0000,720.0000,NULL),(54,3,1,2,720.0000,720.0000,720.0000,720.0000,NULL),(55,0,1,2,575.0000,575.0000,575.0000,575.0000,NULL),(55,1,1,2,575.0000,575.0000,575.0000,575.0000,NULL),(55,2,1,2,575.0000,575.0000,575.0000,575.0000,NULL),(55,3,1,2,575.0000,575.0000,575.0000,575.0000,NULL),(56,0,1,2,430.0000,430.0000,430.0000,430.0000,NULL),(56,1,1,2,430.0000,430.0000,430.0000,430.0000,NULL),(56,2,1,2,430.0000,430.0000,430.0000,430.0000,NULL),(56,3,1,2,430.0000,430.0000,430.0000,430.0000,NULL),(57,0,1,2,350.0000,350.0000,350.0000,350.0000,NULL),(57,1,1,2,350.0000,350.0000,350.0000,350.0000,NULL),(57,2,1,2,350.0000,350.0000,350.0000,350.0000,NULL),(57,3,1,2,350.0000,350.0000,350.0000,350.0000,NULL),(58,0,1,2,535.0000,535.0000,535.0000,535.0000,NULL),(58,1,1,2,535.0000,535.0000,535.0000,535.0000,NULL),(58,2,1,2,535.0000,535.0000,535.0000,535.0000,NULL),(58,3,1,2,535.0000,535.0000,535.0000,535.0000,NULL),(59,0,1,2,535.0000,535.0000,535.0000,535.0000,NULL),(59,1,1,2,535.0000,535.0000,535.0000,535.0000,NULL),(59,2,1,2,535.0000,535.0000,535.0000,535.0000,NULL),(59,3,1,2,535.0000,535.0000,535.0000,535.0000,NULL),(60,0,1,2,520.0000,520.0000,520.0000,520.0000,NULL),(60,1,1,2,520.0000,520.0000,520.0000,520.0000,NULL),(60,2,1,2,520.0000,520.0000,520.0000,520.0000,NULL),(60,3,1,2,520.0000,520.0000,520.0000,520.0000,NULL),(61,0,1,2,210.0000,210.0000,210.0000,210.0000,NULL),(61,1,1,2,210.0000,210.0000,210.0000,210.0000,NULL),(61,2,1,2,210.0000,210.0000,210.0000,210.0000,NULL),(61,3,1,2,210.0000,210.0000,210.0000,210.0000,NULL),(62,0,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(62,1,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(62,2,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(62,3,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(63,0,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(63,1,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(63,2,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(63,3,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(64,0,1,2,100.0000,100.0000,100.0000,100.0000,NULL),(64,1,1,2,100.0000,100.0000,100.0000,100.0000,NULL),(64,2,1,2,100.0000,100.0000,100.0000,100.0000,NULL),(64,3,1,2,100.0000,100.0000,100.0000,100.0000,NULL),(65,0,1,2,100.0000,100.0000,100.0000,100.0000,NULL),(65,1,1,2,100.0000,100.0000,100.0000,100.0000,NULL),(65,2,1,2,100.0000,100.0000,100.0000,100.0000,NULL),(65,3,1,2,100.0000,100.0000,100.0000,100.0000,NULL),(66,0,1,2,100.0000,100.0000,100.0000,100.0000,NULL),(66,1,1,2,100.0000,100.0000,100.0000,100.0000,NULL),(66,2,1,2,100.0000,100.0000,100.0000,100.0000,NULL),(66,3,1,2,100.0000,100.0000,100.0000,100.0000,NULL),(67,0,1,2,575.0000,575.0000,575.0000,575.0000,NULL),(67,1,1,2,575.0000,575.0000,575.0000,575.0000,NULL),(67,2,1,2,575.0000,575.0000,575.0000,575.0000,NULL),(67,3,1,2,575.0000,575.0000,575.0000,575.0000,NULL),(68,0,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(68,1,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(68,2,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(68,3,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(69,0,1,2,425.0000,425.0000,425.0000,425.0000,NULL),(69,1,1,2,425.0000,425.0000,425.0000,425.0000,NULL),(69,2,1,2,425.0000,425.0000,425.0000,425.0000,NULL),(69,3,1,2,425.0000,425.0000,425.0000,425.0000,NULL),(70,0,1,2,415.0000,415.0000,415.0000,415.0000,NULL),(70,1,1,2,415.0000,415.0000,415.0000,415.0000,NULL),(70,2,1,2,415.0000,415.0000,415.0000,415.0000,NULL),(70,3,1,2,415.0000,415.0000,415.0000,415.0000,NULL),(71,0,1,2,2970.0000,2970.0000,2970.0000,2970.0000,NULL),(71,1,1,2,2970.0000,2970.0000,2970.0000,2970.0000,NULL),(71,2,1,2,2970.0000,2970.0000,2970.0000,2970.0000,NULL),(71,3,1,2,2970.0000,2970.0000,2970.0000,2970.0000,NULL),(72,0,1,2,2515.0000,2515.0000,2515.0000,2515.0000,NULL),(72,1,1,2,2515.0000,2515.0000,2515.0000,2515.0000,NULL),(72,2,1,2,2515.0000,2515.0000,2515.0000,2515.0000,NULL),(72,3,1,2,2515.0000,2515.0000,2515.0000,2515.0000,NULL),(73,0,1,2,2465.0000,2465.0000,2465.0000,2465.0000,NULL),(73,1,1,2,2465.0000,2465.0000,2465.0000,2465.0000,NULL),(73,2,1,2,2465.0000,2465.0000,2465.0000,2465.0000,NULL),(73,3,1,2,2465.0000,2465.0000,2465.0000,2465.0000,NULL),(74,0,1,2,2465.0000,2465.0000,2465.0000,2465.0000,NULL),(74,1,1,2,2465.0000,2465.0000,2465.0000,2465.0000,NULL),(74,2,1,2,2465.0000,2465.0000,2465.0000,2465.0000,NULL),(74,3,1,2,2465.0000,2465.0000,2465.0000,2465.0000,NULL),(75,0,1,2,2400.0000,2400.0000,2400.0000,2400.0000,NULL),(75,1,1,2,2400.0000,2400.0000,2400.0000,2400.0000,NULL),(75,2,1,2,2400.0000,2400.0000,2400.0000,2400.0000,NULL),(75,3,1,2,2400.0000,2400.0000,2400.0000,2400.0000,NULL),(76,0,1,2,1810.0000,1810.0000,1810.0000,1810.0000,NULL),(76,1,1,2,1810.0000,1810.0000,1810.0000,1810.0000,NULL),(76,2,1,2,1810.0000,1810.0000,1810.0000,1810.0000,NULL),(76,3,1,2,1810.0000,1810.0000,1810.0000,1810.0000,NULL),(77,0,1,2,1660.0000,1660.0000,1660.0000,1660.0000,NULL),(77,1,1,2,1660.0000,1660.0000,1660.0000,1660.0000,NULL),(77,2,1,2,1660.0000,1660.0000,1660.0000,1660.0000,NULL),(77,3,1,2,1660.0000,1660.0000,1660.0000,1660.0000,NULL),(78,0,1,2,1660.0000,1660.0000,1660.0000,1660.0000,NULL),(78,1,1,2,1660.0000,1660.0000,1660.0000,1660.0000,NULL),(78,2,1,2,1660.0000,1660.0000,1660.0000,1660.0000,NULL),(78,3,1,2,1660.0000,1660.0000,1660.0000,1660.0000,NULL),(79,0,1,2,1260.0000,1260.0000,1260.0000,1260.0000,NULL),(79,1,1,2,1260.0000,1260.0000,1260.0000,1260.0000,NULL),(79,2,1,2,1260.0000,1260.0000,1260.0000,1260.0000,NULL),(79,3,1,2,1260.0000,1260.0000,1260.0000,1260.0000,NULL),(80,0,1,2,575.0000,575.0000,575.0000,575.0000,NULL),(80,1,1,2,575.0000,575.0000,575.0000,575.0000,NULL),(80,2,1,2,575.0000,575.0000,575.0000,575.0000,NULL),(80,3,1,2,575.0000,575.0000,575.0000,575.0000,NULL),(81,0,1,2,525.0000,525.0000,525.0000,525.0000,NULL),(81,1,1,2,525.0000,525.0000,525.0000,525.0000,NULL),(81,2,1,2,525.0000,525.0000,525.0000,525.0000,NULL),(81,3,1,2,525.0000,525.0000,525.0000,525.0000,NULL),(82,0,1,2,490.0000,490.0000,490.0000,490.0000,NULL),(82,1,1,2,490.0000,490.0000,490.0000,490.0000,NULL),(82,2,1,2,490.0000,490.0000,490.0000,490.0000,NULL),(82,3,1,2,490.0000,490.0000,490.0000,490.0000,NULL),(83,0,1,2,1150.0000,1150.0000,1150.0000,1150.0000,NULL),(83,1,1,2,1150.0000,1150.0000,1150.0000,1150.0000,NULL),(83,2,1,2,1150.0000,1150.0000,1150.0000,1150.0000,NULL),(83,3,1,2,1150.0000,1150.0000,1150.0000,1150.0000,NULL),(84,0,1,2,900.0000,900.0000,900.0000,900.0000,NULL),(84,1,1,2,900.0000,900.0000,900.0000,900.0000,NULL),(84,2,1,2,900.0000,900.0000,900.0000,900.0000,NULL),(84,3,1,2,900.0000,900.0000,900.0000,900.0000,NULL),(85,0,1,2,445.0000,445.0000,445.0000,445.0000,NULL),(85,1,1,2,445.0000,445.0000,445.0000,445.0000,NULL),(85,2,1,2,445.0000,445.0000,445.0000,445.0000,NULL),(85,3,1,2,445.0000,445.0000,445.0000,445.0000,NULL),(86,0,1,2,420.0000,420.0000,420.0000,420.0000,NULL),(86,1,1,2,420.0000,420.0000,420.0000,420.0000,NULL),(86,2,1,2,420.0000,420.0000,420.0000,420.0000,NULL),(86,3,1,2,420.0000,420.0000,420.0000,420.0000,NULL),(87,0,1,2,390.0000,390.0000,390.0000,390.0000,NULL),(87,1,1,2,390.0000,390.0000,390.0000,390.0000,NULL),(87,2,1,2,390.0000,390.0000,390.0000,390.0000,NULL),(87,3,1,2,390.0000,390.0000,390.0000,390.0000,NULL),(88,0,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(88,1,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(88,2,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(88,3,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(89,0,1,2,1250.0000,1250.0000,1250.0000,1250.0000,NULL),(89,1,1,2,1250.0000,1250.0000,1250.0000,1250.0000,NULL),(89,2,1,2,1250.0000,1250.0000,1250.0000,1250.0000,NULL),(89,3,1,2,1250.0000,1250.0000,1250.0000,1250.0000,NULL),(90,0,1,2,1250.0000,1250.0000,1250.0000,1250.0000,NULL),(90,1,1,2,1250.0000,1250.0000,1250.0000,1250.0000,NULL),(90,2,1,2,1250.0000,1250.0000,1250.0000,1250.0000,NULL),(90,3,1,2,1250.0000,1250.0000,1250.0000,1250.0000,NULL),(91,0,1,2,1100.0000,1100.0000,1100.0000,1100.0000,NULL),(91,1,1,2,1100.0000,1100.0000,1100.0000,1100.0000,NULL),(91,2,1,2,1100.0000,1100.0000,1100.0000,1100.0000,NULL),(91,3,1,2,1100.0000,1100.0000,1100.0000,1100.0000,NULL),(92,0,1,2,650.0000,650.0000,650.0000,650.0000,NULL),(92,1,1,2,650.0000,650.0000,650.0000,650.0000,NULL),(92,2,1,2,650.0000,650.0000,650.0000,650.0000,NULL),(92,3,1,2,650.0000,650.0000,650.0000,650.0000,NULL),(93,0,1,2,550.0000,550.0000,550.0000,550.0000,NULL),(93,1,1,2,550.0000,550.0000,550.0000,550.0000,NULL),(93,2,1,2,550.0000,550.0000,550.0000,550.0000,NULL),(93,3,1,2,550.0000,550.0000,550.0000,550.0000,NULL),(94,0,1,2,525.0000,525.0000,525.0000,525.0000,NULL),(94,1,1,2,525.0000,525.0000,525.0000,525.0000,NULL),(94,2,1,2,525.0000,525.0000,525.0000,525.0000,NULL),(94,3,1,2,525.0000,525.0000,525.0000,525.0000,NULL),(95,0,1,2,475.0000,475.0000,475.0000,475.0000,NULL),(95,1,1,2,475.0000,475.0000,475.0000,475.0000,NULL),(95,2,1,2,475.0000,475.0000,475.0000,475.0000,NULL),(95,3,1,2,475.0000,475.0000,475.0000,475.0000,NULL),(96,0,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(96,1,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(96,2,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(96,3,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(97,0,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(97,1,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(97,2,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(97,3,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(98,0,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(98,1,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(98,2,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(98,3,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(99,0,1,2,440.0000,440.0000,440.0000,440.0000,NULL),(99,1,1,2,440.0000,440.0000,440.0000,440.0000,NULL),(99,2,1,2,440.0000,440.0000,440.0000,440.0000,NULL),(99,3,1,2,440.0000,440.0000,440.0000,440.0000,NULL),(100,0,1,2,400.0000,400.0000,400.0000,400.0000,NULL),(100,1,1,2,400.0000,400.0000,400.0000,400.0000,NULL),(100,2,1,2,400.0000,400.0000,400.0000,400.0000,NULL),(100,3,1,2,400.0000,400.0000,400.0000,400.0000,NULL),(101,0,1,2,395.0000,395.0000,395.0000,395.0000,NULL),(101,1,1,2,395.0000,395.0000,395.0000,395.0000,NULL),(101,2,1,2,395.0000,395.0000,395.0000,395.0000,NULL),(101,3,1,2,395.0000,395.0000,395.0000,395.0000,NULL),(102,0,1,2,395.0000,395.0000,395.0000,395.0000,NULL),(102,1,1,2,395.0000,395.0000,395.0000,395.0000,NULL),(102,2,1,2,395.0000,395.0000,395.0000,395.0000,NULL),(102,3,1,2,395.0000,395.0000,395.0000,395.0000,NULL),(103,0,1,2,300.0000,300.0000,300.0000,300.0000,NULL),(103,1,1,2,300.0000,300.0000,300.0000,300.0000,NULL),(103,2,1,2,300.0000,300.0000,300.0000,300.0000,NULL),(103,3,1,2,300.0000,300.0000,300.0000,300.0000,NULL),(104,0,1,2,120.0000,120.0000,120.0000,120.0000,NULL),(104,1,1,2,120.0000,120.0000,120.0000,120.0000,NULL),(104,2,1,2,120.0000,120.0000,120.0000,120.0000,NULL),(104,3,1,2,120.0000,120.0000,120.0000,120.0000,NULL),(105,0,1,2,885.0000,885.0000,885.0000,885.0000,NULL),(105,1,1,2,885.0000,885.0000,885.0000,885.0000,NULL),(105,2,1,2,885.0000,885.0000,885.0000,885.0000,NULL),(105,3,1,2,885.0000,885.0000,885.0000,885.0000,NULL),(106,0,1,2,885.0000,885.0000,885.0000,885.0000,NULL),(106,1,1,2,885.0000,885.0000,885.0000,885.0000,NULL),(106,2,1,2,885.0000,885.0000,885.0000,885.0000,NULL),(106,3,1,2,885.0000,885.0000,885.0000,885.0000,NULL),(107,0,1,2,885.0000,885.0000,885.0000,885.0000,NULL),(107,1,1,2,885.0000,885.0000,885.0000,885.0000,NULL),(107,2,1,2,885.0000,885.0000,885.0000,885.0000,NULL),(107,3,1,2,885.0000,885.0000,885.0000,885.0000,NULL),(108,0,1,2,620.0000,620.0000,620.0000,620.0000,NULL),(108,1,1,2,620.0000,620.0000,620.0000,620.0000,NULL),(108,2,1,2,620.0000,620.0000,620.0000,620.0000,NULL),(108,3,1,2,620.0000,620.0000,620.0000,620.0000,NULL),(109,0,1,2,620.0000,620.0000,620.0000,620.0000,NULL),(109,1,1,2,620.0000,620.0000,620.0000,620.0000,NULL),(109,2,1,2,620.0000,620.0000,620.0000,620.0000,NULL),(109,3,1,2,620.0000,620.0000,620.0000,620.0000,NULL),(110,0,1,2,610.0000,610.0000,610.0000,610.0000,NULL),(110,1,1,2,610.0000,610.0000,610.0000,610.0000,NULL),(110,2,1,2,610.0000,610.0000,610.0000,610.0000,NULL),(110,3,1,2,610.0000,610.0000,610.0000,610.0000,NULL),(111,0,1,2,610.0000,610.0000,610.0000,610.0000,NULL),(111,1,1,2,610.0000,610.0000,610.0000,610.0000,NULL),(111,2,1,2,610.0000,610.0000,610.0000,610.0000,NULL),(111,3,1,2,610.0000,610.0000,610.0000,610.0000,NULL),(112,0,1,2,610.0000,610.0000,610.0000,610.0000,NULL),(112,1,1,2,610.0000,610.0000,610.0000,610.0000,NULL),(112,2,1,2,610.0000,610.0000,610.0000,610.0000,NULL),(112,3,1,2,610.0000,610.0000,610.0000,610.0000,NULL),(113,0,1,2,550.0000,550.0000,550.0000,550.0000,NULL),(113,1,1,2,550.0000,550.0000,550.0000,550.0000,NULL),(113,2,1,2,550.0000,550.0000,550.0000,550.0000,NULL),(113,3,1,2,550.0000,550.0000,550.0000,550.0000,NULL),(114,0,1,2,550.0000,550.0000,550.0000,550.0000,NULL),(114,1,1,2,550.0000,550.0000,550.0000,550.0000,NULL),(114,2,1,2,550.0000,550.0000,550.0000,550.0000,NULL),(114,3,1,2,550.0000,550.0000,550.0000,550.0000,NULL),(115,0,1,2,550.0000,550.0000,550.0000,550.0000,NULL),(115,1,1,2,550.0000,550.0000,550.0000,550.0000,NULL),(115,2,1,2,550.0000,550.0000,550.0000,550.0000,NULL),(115,3,1,2,550.0000,550.0000,550.0000,550.0000,NULL),(116,0,1,2,650.0000,650.0000,650.0000,650.0000,NULL),(116,1,1,2,650.0000,650.0000,650.0000,650.0000,NULL),(116,2,1,2,650.0000,650.0000,650.0000,650.0000,NULL),(116,3,1,2,650.0000,650.0000,650.0000,650.0000,NULL),(117,0,1,2,600.0000,600.0000,600.0000,600.0000,NULL),(117,1,1,2,600.0000,600.0000,600.0000,600.0000,NULL),(117,2,1,2,600.0000,600.0000,600.0000,600.0000,NULL),(117,3,1,2,600.0000,600.0000,600.0000,600.0000,NULL),(118,0,1,2,525.0000,525.0000,525.0000,525.0000,NULL),(118,1,1,2,525.0000,525.0000,525.0000,525.0000,NULL),(118,2,1,2,525.0000,525.0000,525.0000,525.0000,NULL),(118,3,1,2,525.0000,525.0000,525.0000,525.0000,NULL),(119,0,1,2,330.0000,330.0000,330.0000,330.0000,NULL),(119,1,1,2,330.0000,330.0000,330.0000,330.0000,NULL),(119,2,1,2,330.0000,330.0000,330.0000,330.0000,NULL),(119,3,1,2,330.0000,330.0000,330.0000,330.0000,NULL),(120,0,1,2,310.0000,310.0000,310.0000,310.0000,NULL),(120,1,1,2,310.0000,310.0000,310.0000,310.0000,NULL),(120,2,1,2,310.0000,310.0000,310.0000,310.0000,NULL),(120,3,1,2,310.0000,310.0000,310.0000,310.0000,NULL),(121,0,1,2,300.0000,300.0000,300.0000,300.0000,NULL),(121,1,1,2,300.0000,300.0000,300.0000,300.0000,NULL),(121,2,1,2,300.0000,300.0000,300.0000,300.0000,NULL),(121,3,1,2,300.0000,300.0000,300.0000,300.0000,NULL),(122,0,1,2,275.0000,275.0000,275.0000,275.0000,NULL),(122,1,1,2,275.0000,275.0000,275.0000,275.0000,NULL),(122,2,1,2,275.0000,275.0000,275.0000,275.0000,NULL),(122,3,1,2,275.0000,275.0000,275.0000,275.0000,NULL),(123,0,1,2,265.0000,265.0000,265.0000,265.0000,NULL),(123,1,1,2,265.0000,265.0000,265.0000,265.0000,NULL),(123,2,1,2,265.0000,265.0000,265.0000,265.0000,NULL),(123,3,1,2,265.0000,265.0000,265.0000,265.0000,NULL),(124,0,1,2,235.0000,235.0000,235.0000,235.0000,NULL),(124,1,1,2,235.0000,235.0000,235.0000,235.0000,NULL),(124,2,1,2,235.0000,235.0000,235.0000,235.0000,NULL),(124,3,1,2,235.0000,235.0000,235.0000,235.0000,NULL),(125,0,1,2,225.0000,225.0000,225.0000,225.0000,NULL),(125,1,1,2,225.0000,225.0000,225.0000,225.0000,NULL),(125,2,1,2,225.0000,225.0000,225.0000,225.0000,NULL),(125,3,1,2,225.0000,225.0000,225.0000,225.0000,NULL),(126,0,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(126,1,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(126,2,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(126,3,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(127,0,1,2,160.0000,160.0000,160.0000,160.0000,NULL),(127,1,1,2,160.0000,160.0000,160.0000,160.0000,NULL),(127,2,1,2,160.0000,160.0000,160.0000,160.0000,NULL),(127,3,1,2,160.0000,160.0000,160.0000,160.0000,NULL),(128,0,1,2,370.0000,370.0000,370.0000,370.0000,NULL),(128,1,1,2,370.0000,370.0000,370.0000,370.0000,NULL),(128,2,1,2,370.0000,370.0000,370.0000,370.0000,NULL),(128,3,1,2,370.0000,370.0000,370.0000,370.0000,NULL),(129,0,1,2,575.0000,575.0000,575.0000,575.0000,NULL),(129,1,1,2,575.0000,575.0000,575.0000,575.0000,NULL),(129,2,1,2,575.0000,575.0000,575.0000,575.0000,NULL),(129,3,1,2,575.0000,575.0000,575.0000,575.0000,NULL),(130,0,1,2,310.0000,310.0000,310.0000,310.0000,NULL),(130,1,1,2,310.0000,310.0000,310.0000,310.0000,NULL),(130,2,1,2,310.0000,310.0000,310.0000,310.0000,NULL),(130,3,1,2,310.0000,310.0000,310.0000,310.0000,NULL),(131,0,1,2,310.0000,310.0000,310.0000,310.0000,NULL),(131,1,1,2,310.0000,310.0000,310.0000,310.0000,NULL),(131,2,1,2,310.0000,310.0000,310.0000,310.0000,NULL),(131,3,1,2,310.0000,310.0000,310.0000,310.0000,NULL),(132,0,1,2,310.0000,310.0000,310.0000,310.0000,NULL),(132,1,1,2,310.0000,310.0000,310.0000,310.0000,NULL),(132,2,1,2,310.0000,310.0000,310.0000,310.0000,NULL),(132,3,1,2,310.0000,310.0000,310.0000,310.0000,NULL),(133,0,1,2,275.0000,275.0000,275.0000,275.0000,NULL),(133,1,1,2,275.0000,275.0000,275.0000,275.0000,NULL),(133,2,1,2,275.0000,275.0000,275.0000,275.0000,NULL),(133,3,1,2,275.0000,275.0000,275.0000,275.0000,NULL),(134,0,1,2,275.0000,275.0000,275.0000,275.0000,NULL),(134,1,1,2,275.0000,275.0000,275.0000,275.0000,NULL),(134,2,1,2,275.0000,275.0000,275.0000,275.0000,NULL),(134,3,1,2,275.0000,275.0000,275.0000,275.0000,NULL),(135,0,1,2,390.0000,390.0000,390.0000,390.0000,NULL),(135,1,1,2,390.0000,390.0000,390.0000,390.0000,NULL),(135,2,1,2,390.0000,390.0000,390.0000,390.0000,NULL),(135,3,1,2,390.0000,390.0000,390.0000,390.0000,NULL),(136,0,1,2,365.0000,365.0000,365.0000,365.0000,NULL),(136,1,1,2,365.0000,365.0000,365.0000,365.0000,NULL),(136,2,1,2,365.0000,365.0000,365.0000,365.0000,NULL),(136,3,1,2,365.0000,365.0000,365.0000,365.0000,NULL),(137,0,1,2,345.0000,345.0000,345.0000,345.0000,NULL),(137,1,1,2,345.0000,345.0000,345.0000,345.0000,NULL),(137,2,1,2,345.0000,345.0000,345.0000,345.0000,NULL),(137,3,1,2,345.0000,345.0000,345.0000,345.0000,NULL),(138,0,1,2,322.0000,322.0000,322.0000,322.0000,NULL),(138,1,1,2,322.0000,322.0000,322.0000,322.0000,NULL),(138,2,1,2,322.0000,322.0000,322.0000,322.0000,NULL),(138,3,1,2,322.0000,322.0000,322.0000,322.0000,NULL),(139,0,1,2,315.0000,315.0000,315.0000,315.0000,NULL),(139,1,1,2,315.0000,315.0000,315.0000,315.0000,NULL),(139,2,1,2,315.0000,315.0000,315.0000,315.0000,NULL),(139,3,1,2,315.0000,315.0000,315.0000,315.0000,NULL),(140,0,1,2,313.0000,313.0000,313.0000,313.0000,NULL),(140,1,1,2,313.0000,313.0000,313.0000,313.0000,NULL),(140,2,1,2,313.0000,313.0000,313.0000,313.0000,NULL),(140,3,1,2,313.0000,313.0000,313.0000,313.0000,NULL),(141,0,1,2,308.0000,308.0000,308.0000,308.0000,NULL),(141,1,1,2,308.0000,308.0000,308.0000,308.0000,NULL),(141,2,1,2,308.0000,308.0000,308.0000,308.0000,NULL),(141,3,1,2,308.0000,308.0000,308.0000,308.0000,NULL),(142,0,1,2,292.0000,292.0000,292.0000,292.0000,NULL),(142,1,1,2,292.0000,292.0000,292.0000,292.0000,NULL),(142,2,1,2,292.0000,292.0000,292.0000,292.0000,NULL),(142,3,1,2,292.0000,292.0000,292.0000,292.0000,NULL),(143,0,1,2,284.0000,284.0000,284.0000,284.0000,NULL),(143,1,1,2,284.0000,284.0000,284.0000,284.0000,NULL),(143,2,1,2,284.0000,284.0000,284.0000,284.0000,NULL),(143,3,1,2,284.0000,284.0000,284.0000,284.0000,NULL),(144,0,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(144,1,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(144,2,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(144,3,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(145,0,1,2,235.0000,235.0000,235.0000,235.0000,NULL),(145,1,1,2,235.0000,235.0000,235.0000,235.0000,NULL),(145,2,1,2,235.0000,235.0000,235.0000,235.0000,NULL),(145,3,1,2,235.0000,235.0000,235.0000,235.0000,NULL),(146,0,1,2,232.0000,232.0000,232.0000,232.0000,NULL),(146,1,1,2,232.0000,232.0000,232.0000,232.0000,NULL),(146,2,1,2,232.0000,232.0000,232.0000,232.0000,NULL),(146,3,1,2,232.0000,232.0000,232.0000,232.0000,NULL),(147,0,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(147,1,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(147,2,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(147,3,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(148,0,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(148,1,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(148,2,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(148,3,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(149,0,1,2,145.0000,145.0000,145.0000,145.0000,NULL),(149,1,1,2,145.0000,145.0000,145.0000,145.0000,NULL),(149,2,1,2,145.0000,145.0000,145.0000,145.0000,NULL),(149,3,1,2,145.0000,145.0000,145.0000,145.0000,NULL),(150,0,1,2,145.0000,145.0000,145.0000,145.0000,NULL),(150,1,1,2,145.0000,145.0000,145.0000,145.0000,NULL),(150,2,1,2,145.0000,145.0000,145.0000,145.0000,NULL),(150,3,1,2,145.0000,145.0000,145.0000,145.0000,NULL),(151,0,1,2,135.0000,135.0000,135.0000,135.0000,NULL),(151,1,1,2,135.0000,135.0000,135.0000,135.0000,NULL),(151,2,1,2,135.0000,135.0000,135.0000,135.0000,NULL),(151,3,1,2,135.0000,135.0000,135.0000,135.0000,NULL),(152,0,1,2,110.0000,110.0000,110.0000,110.0000,NULL),(152,1,1,2,110.0000,110.0000,110.0000,110.0000,NULL),(152,2,1,2,110.0000,110.0000,110.0000,110.0000,NULL),(152,3,1,2,110.0000,110.0000,110.0000,110.0000,NULL),(153,0,1,2,82.0000,82.0000,82.0000,82.0000,NULL),(153,1,1,2,82.0000,82.0000,82.0000,82.0000,NULL),(153,2,1,2,82.0000,82.0000,82.0000,82.0000,NULL),(153,3,1,2,82.0000,82.0000,82.0000,82.0000,NULL),(154,0,1,2,82.0000,82.0000,82.0000,82.0000,NULL),(154,1,1,2,82.0000,82.0000,82.0000,82.0000,NULL),(154,2,1,2,82.0000,82.0000,82.0000,82.0000,NULL),(154,3,1,2,82.0000,82.0000,82.0000,82.0000,NULL),(155,0,1,2,78.0000,78.0000,78.0000,78.0000,NULL),(155,1,1,2,78.0000,78.0000,78.0000,78.0000,NULL),(155,2,1,2,78.0000,78.0000,78.0000,78.0000,NULL),(155,3,1,2,78.0000,78.0000,78.0000,78.0000,NULL),(156,0,1,2,35.0000,35.0000,35.0000,35.0000,NULL),(156,1,1,2,35.0000,35.0000,35.0000,35.0000,NULL),(156,2,1,2,35.0000,35.0000,35.0000,35.0000,NULL),(156,3,1,2,35.0000,35.0000,35.0000,35.0000,NULL),(157,0,1,2,33.0000,33.0000,33.0000,33.0000,NULL),(157,1,1,2,33.0000,33.0000,33.0000,33.0000,NULL),(157,2,1,2,33.0000,33.0000,33.0000,33.0000,NULL),(157,3,1,2,33.0000,33.0000,33.0000,33.0000,NULL),(158,0,1,2,20.0000,20.0000,20.0000,20.0000,NULL),(158,1,1,2,20.0000,20.0000,20.0000,20.0000,NULL),(158,2,1,2,20.0000,20.0000,20.0000,20.0000,NULL),(158,3,1,2,20.0000,20.0000,20.0000,20.0000,NULL),(159,0,1,2,515.0000,515.0000,515.0000,515.0000,NULL),(159,1,1,2,515.0000,515.0000,515.0000,515.0000,NULL),(159,2,1,2,515.0000,515.0000,515.0000,515.0000,NULL),(159,3,1,2,515.0000,515.0000,515.0000,515.0000,NULL),(160,0,1,2,320.0000,320.0000,320.0000,320.0000,NULL),(160,1,1,2,320.0000,320.0000,320.0000,320.0000,NULL),(160,2,1,2,320.0000,320.0000,320.0000,320.0000,NULL),(160,3,1,2,320.0000,320.0000,320.0000,320.0000,NULL),(161,0,1,2,320.0000,320.0000,320.0000,320.0000,NULL),(161,1,1,2,320.0000,320.0000,320.0000,320.0000,NULL),(161,2,1,2,320.0000,320.0000,320.0000,320.0000,NULL),(161,3,1,2,320.0000,320.0000,320.0000,320.0000,NULL),(162,0,1,2,290.0000,290.0000,290.0000,290.0000,NULL),(162,1,1,2,290.0000,290.0000,290.0000,290.0000,NULL),(162,2,1,2,290.0000,290.0000,290.0000,290.0000,NULL),(162,3,1,2,290.0000,290.0000,290.0000,290.0000,NULL),(163,0,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(163,1,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(163,2,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(163,3,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(164,0,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(164,1,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(164,2,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(164,3,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(165,0,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(165,1,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(165,2,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(165,3,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(166,0,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(166,1,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(166,2,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(166,3,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(167,0,1,2,155.0000,155.0000,155.0000,155.0000,NULL),(167,1,1,2,155.0000,155.0000,155.0000,155.0000,NULL),(167,2,1,2,155.0000,155.0000,155.0000,155.0000,NULL),(167,3,1,2,155.0000,155.0000,155.0000,155.0000,NULL),(168,0,1,2,155.0000,155.0000,155.0000,155.0000,NULL),(168,1,1,2,155.0000,155.0000,155.0000,155.0000,NULL),(168,2,1,2,155.0000,155.0000,155.0000,155.0000,NULL),(168,3,1,2,155.0000,155.0000,155.0000,155.0000,NULL),(169,0,1,2,220.0000,220.0000,220.0000,220.0000,NULL),(169,1,1,2,220.0000,220.0000,220.0000,220.0000,NULL),(169,2,1,2,220.0000,220.0000,220.0000,220.0000,NULL),(169,3,1,2,220.0000,220.0000,220.0000,220.0000,NULL),(170,0,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(170,1,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(170,2,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(170,3,1,2,185.0000,185.0000,185.0000,185.0000,NULL),(171,0,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(171,1,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(171,2,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(171,3,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(172,0,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(172,1,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(172,2,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(172,3,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(173,0,1,2,160.0000,160.0000,160.0000,160.0000,NULL),(173,1,1,2,160.0000,160.0000,160.0000,160.0000,NULL),(173,2,1,2,160.0000,160.0000,160.0000,160.0000,NULL),(173,3,1,2,160.0000,160.0000,160.0000,160.0000,NULL),(174,0,1,2,300.0000,300.0000,300.0000,300.0000,NULL),(174,1,1,2,300.0000,300.0000,300.0000,300.0000,NULL),(174,2,1,2,300.0000,300.0000,300.0000,300.0000,NULL),(174,3,1,2,300.0000,300.0000,300.0000,300.0000,NULL),(175,0,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(175,1,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(175,2,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(175,3,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(176,0,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(176,1,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(176,2,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(176,3,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(177,0,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(177,1,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(177,2,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(177,3,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(178,0,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(178,1,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(178,2,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(178,3,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(179,0,1,2,160.0000,160.0000,160.0000,160.0000,NULL),(179,1,1,2,160.0000,160.0000,160.0000,160.0000,NULL),(179,2,1,2,160.0000,160.0000,160.0000,160.0000,NULL),(179,3,1,2,160.0000,160.0000,160.0000,160.0000,NULL),(180,0,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(180,1,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(180,2,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(180,3,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(181,0,1,2,145.0000,145.0000,145.0000,145.0000,NULL),(181,1,1,2,145.0000,145.0000,145.0000,145.0000,NULL),(181,2,1,2,145.0000,145.0000,145.0000,145.0000,NULL),(181,3,1,2,145.0000,145.0000,145.0000,145.0000,NULL),(182,0,1,2,168.0000,168.0000,168.0000,168.0000,NULL),(182,1,1,2,168.0000,168.0000,168.0000,168.0000,NULL),(182,2,1,2,168.0000,168.0000,168.0000,168.0000,NULL),(182,3,1,2,168.0000,168.0000,168.0000,168.0000,NULL),(183,0,1,2,45.0000,45.0000,45.0000,45.0000,NULL),(183,1,1,2,45.0000,45.0000,45.0000,45.0000,NULL),(183,2,1,2,45.0000,45.0000,45.0000,45.0000,NULL),(183,3,1,2,45.0000,45.0000,45.0000,45.0000,NULL),(184,0,1,2,270.0000,270.0000,270.0000,270.0000,NULL),(184,1,1,2,270.0000,270.0000,270.0000,270.0000,NULL),(184,2,1,2,270.0000,270.0000,270.0000,270.0000,NULL),(184,3,1,2,270.0000,270.0000,270.0000,270.0000,NULL),(185,0,1,2,132.0000,132.0000,132.0000,132.0000,NULL),(185,1,1,2,132.0000,132.0000,132.0000,132.0000,NULL),(185,2,1,2,132.0000,132.0000,132.0000,132.0000,NULL),(185,3,1,2,132.0000,132.0000,132.0000,132.0000,NULL),(186,0,1,2,92.0000,92.0000,92.0000,92.0000,NULL),(186,1,1,2,92.0000,92.0000,92.0000,92.0000,NULL),(186,2,1,2,92.0000,92.0000,92.0000,92.0000,NULL),(186,3,1,2,92.0000,92.0000,92.0000,92.0000,NULL),(187,0,1,2,45.0000,45.0000,45.0000,45.0000,NULL),(187,1,1,2,45.0000,45.0000,45.0000,45.0000,NULL),(187,2,1,2,45.0000,45.0000,45.0000,45.0000,NULL),(187,3,1,2,45.0000,45.0000,45.0000,45.0000,NULL),(188,0,1,2,510.0000,510.0000,510.0000,510.0000,NULL),(188,1,1,2,510.0000,510.0000,510.0000,510.0000,NULL),(188,2,1,2,510.0000,510.0000,510.0000,510.0000,NULL),(188,3,1,2,510.0000,510.0000,510.0000,510.0000,NULL),(189,0,1,2,315.0000,315.0000,315.0000,315.0000,NULL),(189,1,1,2,315.0000,315.0000,315.0000,315.0000,NULL),(189,2,1,2,315.0000,315.0000,315.0000,315.0000,NULL),(189,3,1,2,315.0000,315.0000,315.0000,315.0000,NULL),(190,0,1,2,130.0000,130.0000,130.0000,130.0000,NULL),(190,1,1,2,130.0000,130.0000,130.0000,130.0000,NULL),(190,2,1,2,130.0000,130.0000,130.0000,130.0000,NULL),(190,3,1,2,130.0000,130.0000,130.0000,130.0000,NULL),(191,0,1,2,125.0000,125.0000,125.0000,125.0000,NULL),(191,1,1,2,125.0000,125.0000,125.0000,125.0000,NULL),(191,2,1,2,125.0000,125.0000,125.0000,125.0000,NULL),(191,3,1,2,125.0000,125.0000,125.0000,125.0000,NULL),(192,0,1,2,90.0000,90.0000,90.0000,90.0000,NULL),(192,1,1,2,90.0000,90.0000,90.0000,90.0000,NULL),(192,2,1,2,90.0000,90.0000,90.0000,90.0000,NULL),(192,3,1,2,90.0000,90.0000,90.0000,90.0000,NULL),(193,0,1,2,75.0000,75.0000,75.0000,75.0000,NULL),(193,1,1,2,75.0000,75.0000,75.0000,75.0000,NULL),(193,2,1,2,75.0000,75.0000,75.0000,75.0000,NULL),(193,3,1,2,75.0000,75.0000,75.0000,75.0000,NULL),(194,0,1,2,75.0000,75.0000,75.0000,75.0000,NULL),(194,1,1,2,75.0000,75.0000,75.0000,75.0000,NULL),(194,2,1,2,75.0000,75.0000,75.0000,75.0000,NULL),(194,3,1,2,75.0000,75.0000,75.0000,75.0000,NULL),(195,0,1,2,65.0000,65.0000,65.0000,65.0000,NULL),(195,1,1,2,65.0000,65.0000,65.0000,65.0000,NULL),(195,2,1,2,65.0000,65.0000,65.0000,65.0000,NULL),(195,3,1,2,65.0000,65.0000,65.0000,65.0000,NULL),(196,0,1,2,52.0000,52.0000,52.0000,52.0000,NULL),(196,1,1,2,52.0000,52.0000,52.0000,52.0000,NULL),(196,2,1,2,52.0000,52.0000,52.0000,52.0000,NULL),(196,3,1,2,52.0000,52.0000,52.0000,52.0000,NULL),(197,0,1,2,22.0000,22.0000,22.0000,22.0000,NULL),(197,1,1,2,22.0000,22.0000,22.0000,22.0000,NULL),(197,2,1,2,22.0000,22.0000,22.0000,22.0000,NULL),(197,3,1,2,22.0000,22.0000,22.0000,22.0000,NULL),(198,0,1,2,680.0000,680.0000,680.0000,680.0000,NULL),(198,1,1,2,680.0000,680.0000,680.0000,680.0000,NULL),(198,2,1,2,680.0000,680.0000,680.0000,680.0000,NULL),(198,3,1,2,680.0000,680.0000,680.0000,680.0000,NULL),(199,0,1,2,680.0000,680.0000,680.0000,680.0000,NULL),(199,1,1,2,680.0000,680.0000,680.0000,680.0000,NULL),(199,2,1,2,680.0000,680.0000,680.0000,680.0000,NULL),(199,3,1,2,680.0000,680.0000,680.0000,680.0000,NULL),(200,0,1,2,680.0000,680.0000,680.0000,680.0000,NULL),(200,1,1,2,680.0000,680.0000,680.0000,680.0000,NULL),(200,2,1,2,680.0000,680.0000,680.0000,680.0000,NULL),(200,3,1,2,680.0000,680.0000,680.0000,680.0000,NULL),(201,0,1,2,158.0000,158.0000,158.0000,158.0000,NULL),(201,1,1,2,158.0000,158.0000,158.0000,158.0000,NULL),(201,2,1,2,158.0000,158.0000,158.0000,158.0000,NULL),(201,3,1,2,158.0000,158.0000,158.0000,158.0000,NULL),(202,0,1,2,158.0000,158.0000,158.0000,158.0000,NULL),(202,1,1,2,158.0000,158.0000,158.0000,158.0000,NULL),(202,2,1,2,158.0000,158.0000,158.0000,158.0000,NULL),(202,3,1,2,158.0000,158.0000,158.0000,158.0000,NULL),(203,0,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(203,1,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(203,2,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(203,3,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(204,0,1,2,201.0000,201.0000,201.0000,201.0000,NULL),(204,1,1,2,201.0000,201.0000,201.0000,201.0000,NULL),(204,2,1,2,201.0000,201.0000,201.0000,201.0000,NULL),(204,3,1,2,201.0000,201.0000,201.0000,201.0000,NULL),(205,0,1,2,200.0000,200.0000,200.0000,200.0000,NULL),(205,1,1,2,200.0000,200.0000,200.0000,200.0000,NULL),(205,2,1,2,200.0000,200.0000,200.0000,200.0000,NULL),(205,3,1,2,200.0000,200.0000,200.0000,200.0000,NULL),(206,0,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(206,1,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(206,2,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(206,3,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(207,0,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(207,1,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(207,2,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(207,3,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(208,0,1,2,430.0000,430.0000,430.0000,430.0000,NULL),(208,1,1,2,430.0000,430.0000,430.0000,430.0000,NULL),(208,2,1,2,430.0000,430.0000,430.0000,430.0000,NULL),(208,3,1,2,430.0000,430.0000,430.0000,430.0000,NULL),(209,0,1,2,320.0000,320.0000,320.0000,320.0000,NULL),(209,1,1,2,320.0000,320.0000,320.0000,320.0000,NULL),(209,2,1,2,320.0000,320.0000,320.0000,320.0000,NULL),(209,3,1,2,320.0000,320.0000,320.0000,320.0000,NULL),(210,0,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(210,1,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(210,2,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(210,3,1,2,250.0000,250.0000,250.0000,250.0000,NULL),(211,0,1,2,199.0000,199.0000,199.0000,199.0000,NULL),(211,1,1,2,199.0000,199.0000,199.0000,199.0000,NULL),(211,2,1,2,199.0000,199.0000,199.0000,199.0000,NULL),(211,3,1,2,199.0000,199.0000,199.0000,199.0000,NULL),(212,0,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(212,1,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(212,2,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(212,3,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(213,0,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(213,1,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(213,2,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(213,3,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(214,0,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(214,1,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(214,2,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(214,3,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(215,0,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(215,1,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(215,2,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(215,3,1,2,170.0000,170.0000,170.0000,170.0000,NULL),(216,0,1,2,160.0000,160.0000,160.0000,160.0000,NULL),(216,1,1,2,160.0000,160.0000,160.0000,160.0000,NULL),(216,2,1,2,160.0000,160.0000,160.0000,160.0000,NULL),(216,3,1,2,160.0000,160.0000,160.0000,160.0000,NULL),(217,0,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(217,1,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(217,2,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(217,3,1,2,150.0000,150.0000,150.0000,150.0000,NULL),(218,0,1,2,90.0000,90.0000,90.0000,90.0000,NULL),(218,1,1,2,90.0000,90.0000,90.0000,90.0000,NULL),(218,2,1,2,90.0000,90.0000,90.0000,90.0000,NULL),(218,3,1,2,90.0000,90.0000,90.0000,90.0000,NULL),(219,0,1,2,60.0000,60.0000,60.0000,60.0000,NULL),(219,1,1,2,60.0000,60.0000,60.0000,60.0000,NULL),(219,2,1,2,60.0000,60.0000,60.0000,60.0000,NULL),(219,3,1,2,60.0000,60.0000,60.0000,60.0000,NULL),(220,0,1,2,720.0000,720.0000,720.0000,720.0000,NULL),(220,1,1,2,720.0000,720.0000,720.0000,720.0000,NULL),(220,2,1,2,720.0000,720.0000,720.0000,720.0000,NULL),(220,3,1,2,720.0000,720.0000,720.0000,720.0000,NULL),(221,0,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(221,1,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(221,2,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(221,3,1,2,175.0000,175.0000,175.0000,175.0000,NULL),(222,0,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(222,1,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(222,2,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(222,3,1,2,450.0000,450.0000,450.0000,450.0000,NULL),(223,0,1,2,330.0000,330.0000,330.0000,330.0000,NULL),(223,1,1,2,330.0000,330.0000,330.0000,330.0000,NULL),(223,2,1,2,330.0000,330.0000,330.0000,330.0000,NULL),(223,3,1,2,330.0000,330.0000,330.0000,330.0000,NULL),(224,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(224,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(224,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(224,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(225,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(225,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(225,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(225,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(226,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(226,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(226,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(226,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(227,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(227,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(227,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(227,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(228,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(228,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(228,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(228,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(229,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(229,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(229,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(229,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(230,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(230,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(230,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(230,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(231,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(231,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(231,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(231,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(232,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(232,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(232,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(232,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(233,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(233,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(233,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(233,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(234,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(234,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(234,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(234,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(235,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(235,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(235,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(235,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(236,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(236,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(236,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(236,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(237,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(237,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(237,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(237,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(238,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(238,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(238,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(238,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(239,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(239,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(239,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(239,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(240,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(240,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(240,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(240,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(241,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(241,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(241,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(241,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(242,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(242,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(242,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(242,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(243,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(243,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(243,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(243,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(244,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(244,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(244,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(244,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(245,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(245,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(245,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(245,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(246,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(246,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(246,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(246,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(247,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(247,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(247,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(247,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(248,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(248,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(248,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(248,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(249,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(249,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(249,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(249,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(250,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(250,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(250,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(250,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(251,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(251,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(251,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(251,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(252,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(252,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(252,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(252,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(253,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(253,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(253,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(253,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(254,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(254,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(254,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(254,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(255,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(255,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(255,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(255,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(256,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(256,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(256,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(256,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(257,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(257,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(257,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(257,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(258,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(258,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(258,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(258,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(259,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(259,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(259,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(259,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(260,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(260,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(260,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(260,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(261,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(261,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(261,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(261,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(262,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(262,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(262,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(262,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(263,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(263,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(263,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(263,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(264,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(264,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(264,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(264,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(265,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(265,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(265,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(265,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(266,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(266,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(266,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(266,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(267,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(267,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(267,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(267,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(268,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(268,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(268,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(268,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(269,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(269,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(269,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(269,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(270,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(270,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(270,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(270,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(271,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(271,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(271,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(271,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(272,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(272,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(272,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(272,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(273,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(273,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(273,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(273,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(274,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(274,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(274,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(274,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(275,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(275,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(275,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(275,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(276,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(276,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(276,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(276,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(277,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(277,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(277,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(277,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(278,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(278,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(278,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(278,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(279,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(279,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(279,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(279,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(280,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(280,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(280,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(280,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(281,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(281,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(281,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(281,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(282,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(282,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(282,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(282,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(283,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(283,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(283,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(283,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(284,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(284,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(284,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(284,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(285,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(285,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(285,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(285,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(286,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(286,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(286,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(286,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(287,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(287,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(287,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(287,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(288,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(288,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(288,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(288,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(289,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(289,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(289,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(289,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(290,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(290,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(290,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(290,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(291,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(291,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(291,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(291,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(292,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(292,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(292,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(292,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(293,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(293,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(293,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(293,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(294,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(294,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(294,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(294,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(295,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(295,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(295,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(295,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(296,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(296,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(296,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(296,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(297,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(297,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(297,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(297,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(298,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(298,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(298,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(298,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(299,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(299,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(299,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(299,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(300,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(300,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(300,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(300,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(301,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(301,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(301,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(301,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(302,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(302,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(302,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(302,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(303,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(303,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(303,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(303,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(304,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(304,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(304,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(304,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(305,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(305,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(305,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(305,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(306,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(306,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(306,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(306,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(307,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(307,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(307,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(307,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(308,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(308,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(308,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(308,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(309,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(309,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(309,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(309,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(310,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(310,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(310,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(310,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(311,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(311,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(311,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(311,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(312,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(312,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(312,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(312,3,1,NULL,NULL,NULL,NULL,NULL,NULL),(313,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(313,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(313,2,1,NULL,NULL,NULL,NULL,NULL,NULL),(313,3,1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_bundle_idx`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_bundle_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_bundle_idx`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_bundle_idx` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_bundle_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_bundle_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_bundle_opt_idx`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_bundle_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_bundle_opt_idx`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_bundle_opt_idx` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_bundle_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_bundle_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_bundle_opt_tmp`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_bundle_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_bundle_opt_tmp`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_bundle_opt_tmp` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_bundle_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_bundle_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_bundle_sel_idx`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_bundle_sel_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_bundle_sel_idx`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_bundle_sel_idx` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_bundle_sel_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_bundle_sel_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_bundle_sel_tmp`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_bundle_sel_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_bundle_sel_tmp`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_bundle_sel_tmp` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_bundle_sel_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_bundle_sel_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_bundle_tmp`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_bundle_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_bundle_tmp`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_bundle_tmp` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_bundle_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_bundle_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_cfg_opt_agr_idx`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_cfg_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_cfg_opt_agr_idx`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_cfg_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_cfg_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_cfg_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_cfg_opt_agr_tmp`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_cfg_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_cfg_opt_agr_tmp`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_cfg_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_cfg_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_cfg_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_cfg_opt_idx`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_cfg_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_cfg_opt_idx`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_cfg_opt_idx` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_cfg_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_cfg_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_cfg_opt_tmp`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_cfg_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_cfg_opt_tmp`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_cfg_opt_tmp` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_cfg_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_cfg_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_downlod_idx`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_downlod_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Indexer Table for price of downloadable products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_downlod_idx`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_downlod_idx` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_downlod_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_downlod_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_downlod_tmp`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_downlod_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Temporary Indexer Table for price of downloadable products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_downlod_tmp`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_downlod_tmp` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_downlod_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_downlod_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_final_idx`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_final_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_final_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_final_idx`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_final_idx` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_final_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_final_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_final_tmp`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_final_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_final_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_final_tmp`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_final_tmp` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_final_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_final_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_idx`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_idx`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_idx` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_opt_agr_idx`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_opt_agr_idx`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_opt_agr_tmp`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_opt_agr_tmp`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_opt_idx`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_opt_idx`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_opt_idx` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_opt_tmp`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_opt_tmp`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_opt_tmp` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_price_tmp`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_price_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_price_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_TMP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_TMP_WEBSITE_ID` (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_PRICE_TMP_MIN_PRICE` (`min_price`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_price_tmp`
--

LOCK TABLES `grocery_bag_catalog_product_index_price_tmp` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_tmp` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_product_index_price_tmp` VALUES (223,0,1,2,330.0000,330.0000,330.0000,330.0000,NULL),(223,1,1,2,330.0000,330.0000,330.0000,330.0000,NULL),(223,2,1,2,330.0000,330.0000,330.0000,330.0000,NULL),(223,3,1,2,330.0000,330.0000,330.0000,330.0000,NULL);
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_price_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_tier_price`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_tier_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `grocery_bag_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_ENTT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_IDX_TIER_PRICE_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_tier_price`
--

LOCK TABLES `grocery_bag_catalog_product_index_tier_price` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_index_website`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_index_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_index_website` (
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT '1' COMMENT 'Rate',
  PRIMARY KEY (`website_id`),
  KEY `CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`),
  CONSTRAINT `CAT_PRD_IDX_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Website Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_index_website`
--

LOCK TABLES `grocery_bag_catalog_product_index_website` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_website` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_product_index_website` VALUES (1,'2015-10-16',1);
/*!40000 ALTER TABLE `grocery_bag_catalog_product_index_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_link`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `linked_product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Linked Product ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CATALOG_PRODUCT_LINK_LINK_TYPE_ID_PRODUCT_ID_LINKED_PRODUCT_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  KEY `CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`),
  CONSTRAINT `CATALOG_PRODUCT_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_LNK_LNKED_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`linked_product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_LNK_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `grocery_bag_catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Product Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_link`
--

LOCK TABLES `grocery_bag_catalog_product_link` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_link_attribute`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_link_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) DEFAULT NULL COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) DEFAULT NULL COMMENT 'Data Type',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_LNK_TYPE_ID_CAT_PRD_LNK_TYPE_LNK_TYPE_ID` FOREIGN KEY (`link_type_id`) REFERENCES `grocery_bag_catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_link_attribute`
--

LOCK TABLES `grocery_bag_catalog_product_link_attribute` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_link_attribute` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_product_link_attribute` VALUES (1,1,'position','int'),(2,4,'position','int'),(3,5,'position','int'),(4,3,'position','int'),(5,3,'qty','decimal');
/*!40000 ALTER TABLE `grocery_bag_catalog_product_link_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_link_attribute_decimal`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_link_attribute_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_link_attribute_decimal` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_DEC_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `grocery_bag_catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AB2EFA9A14F7BCF1D5400056203D14B6` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `grocery_bag_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Decimal Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_link_attribute_decimal`
--

LOCK TABLES `grocery_bag_catalog_product_link_attribute_decimal` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_link_attribute_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_link_attribute_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_link_attribute_int`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_link_attribute_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_link_attribute_int` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_INT_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `grocery_bag_catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D6D878F8BA2A4282F8DDED7E6E3DE35C` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `grocery_bag_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Integer Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_link_attribute_int`
--

LOCK TABLES `grocery_bag_catalog_product_link_attribute_int` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_link_attribute_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_link_attribute_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_link_attribute_varchar`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_link_attribute_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_link_attribute_varchar` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`),
  CONSTRAINT `CAT_PRD_LNK_ATTR_VCHR_LNK_ID_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `grocery_bag_catalog_product_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_DEE9C4DA61CFCC01DFCF50F0D79CEA51` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `grocery_bag_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Varchar Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_link_attribute_varchar`
--

LOCK TABLES `grocery_bag_catalog_product_link_attribute_varchar` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_link_attribute_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_link_attribute_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_link_type`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_link_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_link_type` (
  `link_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Type Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_link_type`
--

LOCK TABLES `grocery_bag_catalog_product_link_type` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_link_type` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_product_link_type` VALUES (1,'relation'),(3,'super'),(4,'up_sell'),(5,'cross_sell');
/*!40000 ALTER TABLE `grocery_bag_catalog_product_link_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_option`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `is_require` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int(10) unsigned DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `CAT_PRD_OPT_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_option`
--

LOCK TABLES `grocery_bag_catalog_product_option` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_option_price`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_option_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_OPT_PRICE_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `grocery_bag_catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_option_price`
--

LOCK TABLES `grocery_bag_catalog_product_option_price` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_option_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_option_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_option_title`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_option_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_OPT_TTL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `grocery_bag_catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_option_title`
--

LOCK TABLES `grocery_bag_catalog_product_option_title` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_option_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_option_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_option_type_price`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_option_type_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B523E3378E8602F376CC415825576B7F` FOREIGN KEY (`option_type_id`) REFERENCES `grocery_bag_catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_option_type_price`
--

LOCK TABLES `grocery_bag_catalog_product_option_type_price` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_option_type_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_option_type_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_option_type_title`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_option_type_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C085B9CF2C2A302E8043FDEA1937D6A2` FOREIGN KEY (`option_type_id`) REFERENCES `grocery_bag_catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_option_type_title`
--

LOCK TABLES `grocery_bag_catalog_product_option_type_title` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_option_type_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_option_type_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_option_type_value`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_option_type_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_type_id`),
  KEY `CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`),
  CONSTRAINT `CAT_PRD_OPT_TYPE_VAL_OPT_ID_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `grocery_bag_catalog_product_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Value Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_option_type_value`
--

LOCK TABLES `grocery_bag_catalog_product_option_type_value` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_option_type_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_option_type_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_relation`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_relation` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`),
  CONSTRAINT `CAT_PRD_RELATION_CHILD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`child_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_RELATION_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Relation Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_relation`
--

LOCK TABLES `grocery_bag_catalog_product_relation` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_super_attribute`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_super_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`product_super_attribute_id`),
  UNIQUE KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID_ATTRIBUTE_ID` (`product_id`,`attribute_id`),
  CONSTRAINT `CAT_PRD_SPR_ATTR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_super_attribute`
--

LOCK TABLES `grocery_bag_catalog_product_super_attribute` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_super_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_super_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_super_attribute_label`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_super_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `use_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  KEY `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_309442281DF7784210ED82B2CC51E5D5` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `grocery_bag_catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Label Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_super_attribute_label`
--

LOCK TABLES `grocery_bag_catalog_product_super_attribute_label` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_super_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_super_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_super_link`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_super_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  KEY `CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`),
  CONSTRAINT `CAT_PRD_SPR_LNK_PARENT_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_SPR_LNK_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Link Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_super_link`
--

LOCK TABLES `grocery_bag_catalog_product_super_link` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_super_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_super_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_product_website`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_product_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CATALOG_PRODUCT_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_PRD_WS_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Website Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_product_website`
--

LOCK TABLES `grocery_bag_catalog_product_website` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_product_website` DISABLE KEYS */;
INSERT INTO `grocery_bag_catalog_product_website` VALUES (26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(198,1),(199,1),(200,1),(201,1),(202,1),(203,1),(204,1),(205,1),(206,1),(207,1),(208,1),(209,1),(210,1),(211,1),(212,1),(213,1),(214,1),(215,1),(216,1),(217,1),(218,1),(219,1),(220,1),(221,1),(222,1),(223,1),(224,1),(225,1),(226,1),(227,1),(228,1),(229,1),(230,1),(231,1),(232,1),(233,1),(234,1),(235,1),(236,1),(237,1),(238,1),(239,1),(240,1),(241,1),(242,1),(243,1),(244,1),(245,1),(246,1),(247,1),(248,1),(249,1),(250,1),(251,1),(252,1),(253,1),(254,1),(255,1),(256,1),(257,1),(258,1),(259,1),(260,1),(261,1),(262,1),(263,1),(264,1),(265,1),(266,1),(267,1),(268,1),(269,1),(270,1),(271,1),(272,1),(273,1),(274,1),(275,1),(276,1),(277,1),(278,1),(279,1),(280,1),(281,1),(282,1),(283,1),(284,1),(285,1),(286,1),(287,1),(288,1),(289,1),(290,1),(291,1),(292,1),(293,1),(294,1),(295,1),(296,1),(297,1),(298,1),(299,1),(300,1),(301,1),(302,1),(303,1),(304,1),(305,1),(306,1),(307,1),(308,1),(309,1),(310,1),(311,1),(312,1),(313,1);
/*!40000 ALTER TABLE `grocery_bag_catalog_product_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalog_url_rewrite_product_category`
--

DROP TABLE IF EXISTS `grocery_bag_catalog_url_rewrite_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalog_url_rewrite_product_category` (
  `url_rewrite_id` int(10) unsigned NOT NULL COMMENT 'url_rewrite_id',
  `category_id` int(10) unsigned NOT NULL COMMENT 'category_id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'product_id',
  KEY `CATALOG_URL_REWRITE_PRODUCT_CATEGORY_CATEGORY_ID_PRODUCT_ID` (`category_id`,`product_id`),
  KEY `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` (`product_id`),
  KEY `FK_BB79E64705D7F17FE181F23144528FC8` (`url_rewrite_id`),
  CONSTRAINT `CAT_URL_REWRITE_PRD_CTGR_CTGR_ID_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `grocery_bag_catalog_category_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CAT_URL_REWRITE_PRD_CTGR_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BB79E64705D7F17FE181F23144528FC8` FOREIGN KEY (`url_rewrite_id`) REFERENCES `grocery_bag_url_rewrite` (`url_rewrite_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='url_rewrite_relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalog_url_rewrite_product_category`
--

LOCK TABLES `grocery_bag_catalog_url_rewrite_product_category` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalog_url_rewrite_product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalog_url_rewrite_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_cataloginventory_stock`
--

DROP TABLE IF EXISTS `grocery_bag_cataloginventory_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_cataloginventory_stock` (
  `stock_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Stock Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name',
  PRIMARY KEY (`stock_id`),
  KEY `GROCERY_BAG_CATALOGINVENTORY_STOCK_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_cataloginventory_stock`
--

LOCK TABLES `grocery_bag_cataloginventory_stock` WRITE;
/*!40000 ALTER TABLE `grocery_bag_cataloginventory_stock` DISABLE KEYS */;
INSERT INTO `grocery_bag_cataloginventory_stock` VALUES (1,0,'Default');
/*!40000 ALTER TABLE `grocery_bag_cataloginventory_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_cataloginventory_stock_item`
--

DROP TABLE IF EXISTS `grocery_bag_cataloginventory_stock_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `stock_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Id',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Min Qty',
  `use_config_min_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Qty Decimal',
  `backorders` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Backorders',
  `use_config_backorders` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_WEBSITE_ID` (`product_id`,`website_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_WEBSITE_ID` (`website_id`),
  KEY `CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`),
  CONSTRAINT `CATINV_STOCK_ITEM_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `CATINV_STOCK_ITEM_STOCK_ID_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `grocery_bag_cataloginventory_stock` (`stock_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_cataloginventory_stock_item`
--

LOCK TABLES `grocery_bag_cataloginventory_stock_item` WRITE;
/*!40000 ALTER TABLE `grocery_bag_cataloginventory_stock_item` DISABLE KEYS */;
INSERT INTO `grocery_bag_cataloginventory_stock_item` VALUES (26,26,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 09:59:27',NULL,1,0,1,0,1,0.0000,1,0,0,1),(27,27,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 09:59:29',NULL,1,0,1,0,1,0.0000,1,0,0,1),(28,28,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 09:59:31',NULL,1,0,1,0,1,0.0000,1,0,0,1),(29,29,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 09:59:34',NULL,1,0,1,0,1,0.0000,1,0,0,1),(30,30,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 09:59:36',NULL,1,0,1,0,1,0.0000,1,0,0,1),(31,31,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 09:59:39',NULL,1,0,1,0,1,0.0000,1,0,0,1),(32,32,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 09:59:42',NULL,1,0,1,0,1,0.0000,1,0,0,1),(33,33,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 09:59:44',NULL,1,0,1,0,1,0.0000,1,0,0,1),(34,34,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 09:59:46',NULL,1,0,1,0,1,0.0000,1,0,0,1),(35,35,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 09:59:48',NULL,1,0,1,0,1,0.0000,1,0,0,1),(36,36,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 09:59:51',NULL,1,0,1,0,1,0.0000,1,0,0,1),(37,37,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 09:59:53',NULL,1,0,1,0,1,0.0000,1,0,0,1),(38,38,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 11:08:46',NULL,1,0,1,0,1,0.0000,1,0,0,1),(39,39,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 11:04:27',NULL,1,0,1,0,1,0.0000,1,0,0,1),(40,40,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 11:04:35',NULL,1,0,1,0,1,0.0000,1,0,0,1),(41,41,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:11',NULL,1,0,1,0,1,0.0000,1,0,0,1),(42,42,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:13',NULL,1,0,1,0,1,0.0000,1,0,0,1),(43,43,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:15',NULL,1,0,1,0,1,0.0000,1,0,0,1),(44,44,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:17',NULL,1,0,1,0,1,0.0000,1,0,0,1),(45,45,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:20',NULL,1,0,1,0,1,0.0000,1,0,0,1),(46,46,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:22',NULL,1,0,1,0,1,0.0000,1,0,0,1),(47,47,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:24',NULL,1,0,1,0,1,0.0000,1,0,0,1),(48,48,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:26',NULL,1,0,1,0,1,0.0000,1,0,0,1),(49,49,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:28',NULL,1,0,1,0,1,0.0000,1,0,0,1),(50,50,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:30',NULL,1,0,1,0,1,0.0000,1,0,0,1),(51,51,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:32',NULL,1,0,1,0,1,0.0000,1,0,0,1),(52,52,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:34',NULL,1,0,1,0,1,0.0000,1,0,0,1),(53,53,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:36',NULL,1,0,1,0,1,0.0000,1,0,0,1),(54,54,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:38',NULL,1,0,1,0,1,0.0000,1,0,0,1),(55,55,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:40',NULL,1,0,1,0,1,0.0000,1,0,0,1),(56,56,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:42',NULL,1,0,1,0,1,0.0000,1,0,0,1),(57,57,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:44',NULL,1,0,1,0,1,0.0000,1,0,0,1),(58,58,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:47',NULL,1,0,1,0,1,0.0000,1,0,0,1),(59,59,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:49',NULL,1,0,1,0,1,0.0000,1,0,0,1),(60,60,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:50',NULL,1,0,1,0,1,0.0000,1,0,0,1),(61,61,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:52',NULL,1,0,1,0,1,0.0000,1,0,0,1),(62,62,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:54',NULL,1,0,1,0,1,0.0000,1,0,0,1),(63,63,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:56',NULL,1,0,1,0,1,0.0000,1,0,0,1),(64,64,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:53:58',NULL,1,0,1,0,1,0.0000,1,0,0,1),(65,65,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:00',NULL,1,0,1,0,1,0.0000,1,0,0,1),(66,66,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:02',NULL,1,0,1,0,1,0.0000,1,0,0,1),(67,67,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:05',NULL,1,0,1,0,1,0.0000,1,0,0,1),(68,68,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:07',NULL,1,0,1,0,1,0.0000,1,0,0,1),(69,69,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:09',NULL,1,0,1,0,1,0.0000,1,0,0,1),(70,70,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:11',NULL,1,0,1,0,1,0.0000,1,0,0,1),(71,71,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:14',NULL,1,0,1,0,1,0.0000,1,0,0,1),(72,72,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:15',NULL,1,0,1,0,1,0.0000,1,0,0,1),(73,73,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:17',NULL,1,0,1,0,1,0.0000,1,0,0,1),(74,74,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:19',NULL,1,0,1,0,1,0.0000,1,0,0,1),(75,75,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:21',NULL,1,0,1,0,1,0.0000,1,0,0,1),(76,76,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:23',NULL,1,0,1,0,1,0.0000,1,0,0,1),(77,77,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:25',NULL,1,0,1,0,1,0.0000,1,0,0,1),(78,78,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:27',NULL,1,0,1,0,1,0.0000,1,0,0,1),(79,79,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:29',NULL,1,0,1,0,1,0.0000,1,0,0,1),(80,80,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:31',NULL,1,0,1,0,1,0.0000,1,0,0,1),(81,81,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:34',NULL,1,0,1,0,1,0.0000,1,0,0,1),(82,82,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:36',NULL,1,0,1,0,1,0.0000,1,0,0,1),(83,83,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:38',NULL,1,0,1,0,1,0.0000,1,0,0,1),(84,84,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:40',NULL,1,0,1,0,1,0.0000,1,0,0,1),(85,85,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:42',NULL,1,0,1,0,1,0.0000,1,0,0,1),(86,86,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:44',NULL,1,0,1,0,1,0.0000,1,0,0,1),(87,87,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:46',NULL,1,0,1,0,1,0.0000,1,0,0,1),(88,88,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:48',NULL,1,0,1,0,1,0.0000,1,0,0,1),(89,89,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:51',NULL,1,0,1,0,1,0.0000,1,0,0,1),(90,90,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:53',NULL,1,0,1,0,1,0.0000,1,0,0,1),(91,91,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:56',NULL,1,0,1,0,1,0.0000,1,0,0,1),(92,92,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:54:58',NULL,1,0,1,0,1,0.0000,1,0,0,1),(93,93,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:00',NULL,1,0,1,0,1,0.0000,1,0,0,1),(94,94,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:03',NULL,1,0,1,0,1,0.0000,1,0,0,1),(95,95,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:05',NULL,1,0,1,0,1,0.0000,1,0,0,1),(96,96,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:08',NULL,1,0,1,0,1,0.0000,1,0,0,1),(97,97,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:10',NULL,1,0,1,0,1,0.0000,1,0,0,1),(98,98,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:12',NULL,1,0,1,0,1,0.0000,1,0,0,1),(99,99,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:15',NULL,1,0,1,0,1,0.0000,1,0,0,1),(100,100,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:17',NULL,1,0,1,0,1,0.0000,1,0,0,1),(101,101,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:19',NULL,1,0,1,0,1,0.0000,1,0,0,1),(102,102,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:21',NULL,1,0,1,0,1,0.0000,1,0,0,1),(103,103,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:24',NULL,1,0,1,0,1,0.0000,1,0,0,1),(104,104,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:26',NULL,1,0,1,0,1,0.0000,1,0,0,1),(105,105,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:29',NULL,1,0,1,0,1,0.0000,1,0,0,1),(106,106,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:31',NULL,1,0,1,0,1,0.0000,1,0,0,1),(107,107,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:33',NULL,1,0,1,0,1,0.0000,1,0,0,1),(108,108,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:35',NULL,1,0,1,0,1,0.0000,1,0,0,1),(109,109,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:55:37',NULL,1,0,1,0,1,0.0000,1,0,0,1),(110,110,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:48:15',NULL,1,0,1,0,1,0.0000,1,0,0,1),(111,111,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:48:19',NULL,1,0,1,0,1,0.0000,1,0,0,1),(112,112,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:48:23',NULL,1,0,1,0,1,0.0000,1,0,0,1),(113,113,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:48:27',NULL,1,0,1,0,1,0.0000,1,0,0,1),(114,114,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:48:31',NULL,1,0,1,0,1,0.0000,1,0,0,1),(115,115,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:48:35',NULL,1,0,1,0,1,0.0000,1,0,0,1),(116,116,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:48:41',NULL,1,0,1,0,1,0.0000,1,0,0,1),(117,117,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:48:45',NULL,1,0,1,0,1,0.0000,1,0,0,1),(118,118,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:48:49',NULL,1,0,1,0,1,0.0000,1,0,0,1),(119,119,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:48:52',NULL,1,0,1,0,1,0.0000,1,0,0,1),(120,120,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:48:57',NULL,1,0,1,0,1,0.0000,1,0,0,1),(121,121,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:00',NULL,1,0,1,0,1,0.0000,1,0,0,1),(122,122,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:03',NULL,1,0,1,0,1,0.0000,1,0,0,1),(123,123,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:06',NULL,1,0,1,0,1,0.0000,1,0,0,1),(124,124,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:08',NULL,1,0,1,0,1,0.0000,1,0,0,1),(125,125,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:10',NULL,1,0,1,0,1,0.0000,1,0,0,1),(126,126,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:13',NULL,1,0,1,0,1,0.0000,1,0,0,1),(127,127,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:15',NULL,1,0,1,0,1,0.0000,1,0,0,1),(128,128,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:18',NULL,1,0,1,0,1,0.0000,1,0,0,1),(129,129,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:21',NULL,1,0,1,0,1,0.0000,1,0,0,1),(130,130,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:23',NULL,1,0,1,0,1,0.0000,1,0,0,1),(131,131,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:24',NULL,1,0,1,0,1,0.0000,1,0,0,1),(132,132,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:26',NULL,1,0,1,0,1,0.0000,1,0,0,1),(133,133,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:28',NULL,1,0,1,0,1,0.0000,1,0,0,1),(134,134,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:30',NULL,1,0,1,0,1,0.0000,1,0,0,1),(135,135,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:33',NULL,1,0,1,0,1,0.0000,1,0,0,1),(136,136,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:35',NULL,1,0,1,0,1,0.0000,1,0,0,1),(137,137,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:37',NULL,1,0,1,0,1,0.0000,1,0,0,1),(138,138,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:39',NULL,1,0,1,0,1,0.0000,1,0,0,1),(139,139,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:41',NULL,1,0,1,0,1,0.0000,1,0,0,1),(140,140,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:43',NULL,1,0,1,0,1,0.0000,1,0,0,1),(141,141,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:45',NULL,1,0,1,0,1,0.0000,1,0,0,1),(142,142,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:47',NULL,1,0,1,0,1,0.0000,1,0,0,1),(143,143,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:49',NULL,1,0,1,0,1,0.0000,1,0,0,1),(144,144,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:51',NULL,1,0,1,0,1,0.0000,1,0,0,1),(145,145,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:53',NULL,1,0,1,0,1,0.0000,1,0,0,1),(146,146,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:55',NULL,1,0,1,0,1,0.0000,1,0,0,1),(147,147,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:57',NULL,1,0,1,0,1,0.0000,1,0,0,1),(148,148,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:49:59',NULL,1,0,1,0,1,0.0000,1,0,0,1),(149,149,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:01',NULL,1,0,1,0,1,0.0000,1,0,0,1),(150,150,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:03',NULL,1,0,1,0,1,0.0000,1,0,0,1),(151,151,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:05',NULL,1,0,1,0,1,0.0000,1,0,0,1),(152,152,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:07',NULL,1,0,1,0,1,0.0000,1,0,0,1),(153,153,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:09',NULL,1,0,1,0,1,0.0000,1,0,0,1),(154,154,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:11',NULL,1,0,1,0,1,0.0000,1,0,0,1),(155,155,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:13',NULL,1,0,1,0,1,0.0000,1,0,0,1),(156,156,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:15',NULL,1,0,1,0,1,0.0000,1,0,0,1),(157,157,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:17',NULL,1,0,1,0,1,0.0000,1,0,0,1),(158,158,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:19',NULL,1,0,1,0,1,0.0000,1,0,0,1),(159,159,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:21',NULL,1,0,1,0,1,0.0000,1,0,0,1),(160,160,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:23',NULL,1,0,1,0,1,0.0000,1,0,0,1),(161,161,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:25',NULL,1,0,1,0,1,0.0000,1,0,0,1),(162,162,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:27',NULL,1,0,1,0,1,0.0000,1,0,0,1),(163,163,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:29',NULL,1,0,1,0,1,0.0000,1,0,0,1),(164,164,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:31',NULL,1,0,1,0,1,0.0000,1,0,0,1),(165,165,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:33',NULL,1,0,1,0,1,0.0000,1,0,0,1),(166,166,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:35',NULL,1,0,1,0,1,0.0000,1,0,0,1),(167,167,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:37',NULL,1,0,1,0,1,0.0000,1,0,0,1),(168,168,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:39',NULL,1,0,1,0,1,0.0000,1,0,0,1),(169,169,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:41',NULL,1,0,1,0,1,0.0000,1,0,0,1),(170,170,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:43',NULL,1,0,1,0,1,0.0000,1,0,0,1),(171,171,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:45',NULL,1,0,1,0,1,0.0000,1,0,0,1),(172,172,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:47',NULL,1,0,1,0,1,0.0000,1,0,0,1),(173,173,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:49',NULL,1,0,1,0,1,0.0000,1,0,0,1),(174,174,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:51',NULL,1,0,1,0,1,0.0000,1,0,0,1),(175,175,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:53',NULL,1,0,1,0,1,0.0000,1,0,0,1),(176,176,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:55',NULL,1,0,1,0,1,0.0000,1,0,0,1),(177,177,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:57',NULL,1,0,1,0,1,0.0000,1,0,0,1),(178,178,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:50:59',NULL,1,0,1,0,1,0.0000,1,0,0,1),(179,179,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:01',NULL,1,0,1,0,1,0.0000,1,0,0,1),(180,180,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:03',NULL,1,0,1,0,1,0.0000,1,0,0,1),(181,181,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:05',NULL,1,0,1,0,1,0.0000,1,0,0,1),(182,182,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:08',NULL,1,0,1,0,1,0.0000,1,0,0,1),(183,183,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:10',NULL,1,0,1,0,1,0.0000,1,0,0,1),(184,184,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:12',NULL,1,0,1,0,1,0.0000,1,0,0,1),(185,185,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:14',NULL,1,0,1,0,1,0.0000,1,0,0,1),(186,186,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:16',NULL,1,0,1,0,1,0.0000,1,0,0,1),(187,187,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:18',NULL,1,0,1,0,1,0.0000,1,0,0,1),(188,188,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:21',NULL,1,0,1,0,1,0.0000,1,0,0,1),(189,189,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:23',NULL,1,0,1,0,1,0.0000,1,0,0,1),(190,190,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:25',NULL,1,0,1,0,1,0.0000,1,0,0,1),(191,191,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:27',NULL,1,0,1,0,1,0.0000,1,0,0,1),(192,192,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:29',NULL,1,0,1,0,1,0.0000,1,0,0,1),(193,193,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:31',NULL,1,0,1,0,1,0.0000,1,0,0,1),(194,194,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:33',NULL,1,0,1,0,1,0.0000,1,0,0,1),(195,195,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:35',NULL,1,0,1,0,1,0.0000,1,0,0,1),(196,196,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:36',NULL,1,0,1,0,1,0.0000,1,0,0,1),(197,197,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:38',NULL,1,0,1,0,1,0.0000,1,0,0,1),(198,198,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:41',NULL,1,0,1,0,1,0.0000,1,0,0,1),(199,199,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:43',NULL,1,0,1,0,1,0.0000,1,0,0,1),(200,200,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:45',NULL,1,0,1,0,1,0.0000,1,0,0,1),(201,201,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:48',NULL,1,0,1,0,1,0.0000,1,0,0,1),(202,202,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:50',NULL,1,0,1,0,1,0.0000,1,0,0,1),(203,203,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:52',NULL,1,0,1,0,1,0.0000,1,0,0,1),(204,204,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:54',NULL,1,0,1,0,1,0.0000,1,0,0,1),(205,205,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:56',NULL,1,0,1,0,1,0.0000,1,0,0,1),(206,206,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:51:59',NULL,1,0,1,0,1,0.0000,1,0,0,1),(207,207,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:01',NULL,1,0,1,0,1,0.0000,1,0,0,1),(208,208,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:03',NULL,1,0,1,0,1,0.0000,1,0,0,1),(209,209,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:05',NULL,1,0,1,0,1,0.0000,1,0,0,1),(210,210,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:07',NULL,1,0,1,0,1,0.0000,1,0,0,1),(211,211,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:10',NULL,1,0,1,0,1,0.0000,1,0,0,1),(212,212,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:12',NULL,1,0,1,0,1,0.0000,1,0,0,1),(213,213,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:14',NULL,1,0,1,0,1,0.0000,1,0,0,1),(214,214,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:16',NULL,1,0,1,0,1,0.0000,1,0,0,1),(215,215,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:18',NULL,1,0,1,0,1,0.0000,1,0,0,1),(216,216,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:19',NULL,1,0,1,0,1,0.0000,1,0,0,1),(217,217,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:21',NULL,1,0,1,0,1,0.0000,1,0,0,1),(218,218,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:23',NULL,1,0,1,0,1,0.0000,1,0,0,1),(219,219,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:26',NULL,1,0,1,0,1,0.0000,1,0,0,1),(220,220,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:29',NULL,1,0,1,0,1,0.0000,1,0,0,1),(221,221,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:31',NULL,1,0,1,0,1,0.0000,1,0,0,1),(222,222,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:34',NULL,1,0,1,0,1,0.0000,1,0,0,1),(223,223,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2015-10-16 10:52:36',NULL,1,0,1,0,1,0.0000,1,0,0,1),(224,224,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(225,225,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(226,226,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(227,227,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(228,228,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(229,229,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(230,230,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(231,231,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(232,232,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(233,233,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(234,234,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(235,235,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(236,236,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(237,237,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(238,238,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(239,239,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(240,240,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(241,241,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(242,242,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(243,243,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(244,244,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(245,245,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(246,246,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(247,247,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(248,248,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(249,249,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(250,250,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(251,251,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(252,252,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(253,253,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(254,254,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(255,255,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(256,256,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(257,257,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(258,258,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(259,259,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(260,260,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(261,261,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(262,262,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(263,263,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(264,264,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(265,265,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(266,266,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(267,267,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(268,268,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(269,269,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(270,270,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(271,271,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(272,272,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(273,273,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(274,274,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(275,275,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(276,276,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(277,277,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(278,278,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(279,279,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(280,280,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(281,281,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(282,282,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(283,283,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(284,284,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(285,285,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(286,286,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(287,287,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(288,288,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(289,289,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(290,290,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(291,291,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(292,292,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(293,293,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(294,294,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(295,295,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(296,296,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(297,297,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(298,298,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(299,299,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(300,300,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(301,301,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(302,302,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(303,303,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(304,304,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(305,305,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(306,306,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(307,307,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(308,308,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(309,309,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(310,310,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(311,311,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(312,312,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1),(313,313,1,NULL,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,NULL,NULL,1,0,1,0,1,0.0000,1,0,0,1);
/*!40000 ALTER TABLE `grocery_bag_cataloginventory_stock_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_cataloginventory_stock_status`
--

DROP TABLE IF EXISTS `grocery_bag_cataloginventory_stock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_cataloginventory_stock_status` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_cataloginventory_stock_status`
--

LOCK TABLES `grocery_bag_cataloginventory_stock_status` WRITE;
/*!40000 ALTER TABLE `grocery_bag_cataloginventory_stock_status` DISABLE KEYS */;
INSERT INTO `grocery_bag_cataloginventory_stock_status` VALUES (1,1,1,0.0000,0),(2,1,1,0.0000,0),(3,1,1,0.0000,0),(4,1,1,0.0000,0),(5,1,1,0.0000,0),(6,1,1,0.0000,0),(7,1,1,0.0000,0),(8,1,1,0.0000,0),(9,1,1,0.0000,0),(10,1,1,0.0000,0),(11,1,1,0.0000,0),(12,1,1,0.0000,0),(13,1,1,0.0000,0),(14,1,1,0.0000,0),(15,1,1,0.0000,0),(16,1,1,0.0000,0),(17,1,1,0.0000,0),(18,1,1,0.0000,0),(19,1,1,0.0000,0),(20,1,1,0.0000,0),(21,1,1,0.0000,0),(22,1,1,0.0000,0),(23,1,1,0.0000,0),(24,1,1,0.0000,0),(25,1,1,0.0000,0),(26,1,1,0.0000,0),(27,1,1,0.0000,0),(28,1,1,0.0000,0),(29,1,1,0.0000,0),(30,1,1,0.0000,0),(31,1,1,0.0000,0),(32,1,1,0.0000,0),(33,1,1,0.0000,0),(34,1,1,0.0000,0),(35,1,1,0.0000,0),(36,1,1,0.0000,0),(37,1,1,0.0000,0),(38,1,1,0.0000,0),(39,1,1,0.0000,0),(40,1,1,0.0000,0),(41,1,1,0.0000,0),(42,1,1,0.0000,0),(43,1,1,0.0000,0),(44,1,1,0.0000,0),(45,1,1,0.0000,0),(46,1,1,0.0000,0),(47,1,1,0.0000,0),(48,1,1,0.0000,0),(49,1,1,0.0000,0),(50,1,1,0.0000,0),(51,1,1,0.0000,0),(52,1,1,0.0000,0),(53,1,1,0.0000,0),(54,1,1,0.0000,0),(55,1,1,0.0000,0),(56,1,1,0.0000,0),(57,1,1,0.0000,0),(58,1,1,0.0000,0),(59,1,1,0.0000,0),(60,1,1,0.0000,0),(61,1,1,0.0000,0),(62,1,1,0.0000,0),(63,1,1,0.0000,0),(64,1,1,0.0000,0),(65,1,1,0.0000,0),(66,1,1,0.0000,0),(67,1,1,0.0000,0),(68,1,1,0.0000,0),(69,1,1,0.0000,0),(70,1,1,0.0000,0),(71,1,1,0.0000,0),(72,1,1,0.0000,0),(73,1,1,0.0000,0),(74,1,1,0.0000,0),(75,1,1,0.0000,0),(76,1,1,0.0000,0),(77,1,1,0.0000,0),(78,1,1,0.0000,0),(79,1,1,0.0000,0),(80,1,1,0.0000,0),(81,1,1,0.0000,0),(82,1,1,0.0000,0),(83,1,1,0.0000,0),(84,1,1,0.0000,0),(85,1,1,0.0000,0),(86,1,1,0.0000,0),(87,1,1,0.0000,0),(88,1,1,0.0000,0),(89,1,1,0.0000,0),(90,1,1,0.0000,0),(91,1,1,0.0000,0),(92,1,1,0.0000,0),(93,1,1,0.0000,0),(94,1,1,0.0000,0),(95,1,1,0.0000,0),(96,1,1,0.0000,0),(97,1,1,0.0000,0),(98,1,1,0.0000,0),(99,1,1,0.0000,0),(100,1,1,0.0000,0),(101,1,1,0.0000,0),(102,1,1,0.0000,0),(103,1,1,0.0000,0),(104,1,1,0.0000,0),(105,1,1,0.0000,0),(106,1,1,0.0000,0),(107,1,1,0.0000,0),(108,1,1,0.0000,0),(109,1,1,0.0000,0),(110,1,1,0.0000,0),(111,1,1,0.0000,0),(112,1,1,0.0000,0),(113,1,1,0.0000,0),(114,1,1,0.0000,0),(115,1,1,0.0000,0),(116,1,1,0.0000,0),(117,1,1,0.0000,0),(118,1,1,0.0000,0),(119,1,1,0.0000,0),(120,1,1,0.0000,0),(121,1,1,0.0000,0),(122,1,1,0.0000,0),(123,1,1,0.0000,0),(124,1,1,0.0000,0),(125,1,1,0.0000,0),(126,1,1,0.0000,0),(127,1,1,0.0000,0),(128,1,1,0.0000,0),(129,1,1,0.0000,0),(130,1,1,0.0000,0),(131,1,1,0.0000,0),(132,1,1,0.0000,0),(133,1,1,0.0000,0),(134,1,1,0.0000,0),(135,1,1,0.0000,0),(136,1,1,0.0000,0),(137,1,1,0.0000,0),(138,1,1,0.0000,0),(139,1,1,0.0000,0),(140,1,1,0.0000,0),(141,1,1,0.0000,0),(142,1,1,0.0000,0),(143,1,1,0.0000,0),(144,1,1,0.0000,0),(145,1,1,0.0000,0),(146,1,1,0.0000,0),(147,1,1,0.0000,0),(148,1,1,0.0000,0),(149,1,1,0.0000,0),(150,1,1,0.0000,0),(151,1,1,0.0000,0),(152,1,1,0.0000,0),(153,1,1,0.0000,0),(154,1,1,0.0000,0),(155,1,1,0.0000,0),(156,1,1,0.0000,0),(157,1,1,0.0000,0),(158,1,1,0.0000,0),(159,1,1,0.0000,0),(160,1,1,0.0000,0),(161,1,1,0.0000,0),(162,1,1,0.0000,0),(163,1,1,0.0000,0),(164,1,1,0.0000,0),(165,1,1,0.0000,0),(166,1,1,0.0000,0),(167,1,1,0.0000,0),(168,1,1,0.0000,0),(169,1,1,0.0000,0),(170,1,1,0.0000,0),(171,1,1,0.0000,0),(172,1,1,0.0000,0),(173,1,1,0.0000,0),(174,1,1,0.0000,0),(175,1,1,0.0000,0),(176,1,1,0.0000,0),(177,1,1,0.0000,0),(178,1,1,0.0000,0),(179,1,1,0.0000,0),(180,1,1,0.0000,0),(181,1,1,0.0000,0),(182,1,1,0.0000,0),(183,1,1,0.0000,0),(184,1,1,0.0000,0),(185,1,1,0.0000,0),(186,1,1,0.0000,0),(187,1,1,0.0000,0),(188,1,1,0.0000,0),(189,1,1,0.0000,0),(190,1,1,0.0000,0),(191,1,1,0.0000,0),(192,1,1,0.0000,0),(193,1,1,0.0000,0),(194,1,1,0.0000,0),(195,1,1,0.0000,0),(196,1,1,0.0000,0),(197,1,1,0.0000,0),(198,1,1,0.0000,0),(199,1,1,0.0000,0),(200,1,1,0.0000,0),(201,1,1,0.0000,0),(202,1,1,0.0000,0),(203,1,1,0.0000,0),(204,1,1,0.0000,0),(205,1,1,0.0000,0),(206,1,1,0.0000,0),(207,1,1,0.0000,0),(208,1,1,0.0000,0),(209,1,1,0.0000,0),(210,1,1,0.0000,0),(211,1,1,0.0000,0),(212,1,1,0.0000,0),(213,1,1,0.0000,0),(214,1,1,0.0000,0),(215,1,1,0.0000,0),(216,1,1,0.0000,0),(217,1,1,0.0000,0),(218,1,1,0.0000,0),(219,1,1,0.0000,0),(220,1,1,0.0000,0),(221,1,1,0.0000,0),(222,1,1,0.0000,0),(223,1,1,0.0000,0),(224,1,1,0.0000,0),(225,1,1,0.0000,0),(226,1,1,0.0000,0),(227,1,1,0.0000,0),(228,1,1,0.0000,0),(229,1,1,0.0000,0),(230,1,1,0.0000,0),(231,1,1,0.0000,0),(232,1,1,0.0000,0),(233,1,1,0.0000,0),(234,1,1,0.0000,0),(235,1,1,0.0000,0),(236,1,1,0.0000,0),(237,1,1,0.0000,0),(238,1,1,0.0000,0),(239,1,1,0.0000,0),(240,1,1,0.0000,0),(241,1,1,0.0000,0),(242,1,1,0.0000,0),(243,1,1,0.0000,0),(244,1,1,0.0000,0),(245,1,1,0.0000,0),(246,1,1,0.0000,0),(247,1,1,0.0000,0),(248,1,1,0.0000,0),(249,1,1,0.0000,0),(250,1,1,0.0000,0),(251,1,1,0.0000,0),(252,1,1,0.0000,0),(253,1,1,0.0000,0),(254,1,1,0.0000,0),(255,1,1,0.0000,0),(256,1,1,0.0000,0),(257,1,1,0.0000,0),(258,1,1,0.0000,0),(259,1,1,0.0000,0),(260,1,1,0.0000,0),(261,1,1,0.0000,0),(262,1,1,0.0000,0),(263,1,1,0.0000,0),(264,1,1,0.0000,0),(265,1,1,0.0000,0),(266,1,1,0.0000,0),(267,1,1,0.0000,0),(268,1,1,0.0000,0),(269,1,1,0.0000,0),(270,1,1,0.0000,0),(271,1,1,0.0000,0),(272,1,1,0.0000,0),(273,1,1,0.0000,0),(274,1,1,0.0000,0),(275,1,1,0.0000,0),(276,1,1,0.0000,0),(277,1,1,0.0000,0),(278,1,1,0.0000,0),(279,1,1,0.0000,0),(280,1,1,0.0000,0),(281,1,1,0.0000,0),(282,1,1,0.0000,0),(283,1,1,0.0000,0),(284,1,1,0.0000,0),(285,1,1,0.0000,0),(286,1,1,0.0000,0),(287,1,1,0.0000,0),(288,1,1,0.0000,0),(289,1,1,0.0000,0),(290,1,1,0.0000,0),(291,1,1,0.0000,0),(292,1,1,0.0000,0),(293,1,1,0.0000,0),(294,1,1,0.0000,0),(295,1,1,0.0000,0),(296,1,1,0.0000,0),(297,1,1,0.0000,0),(298,1,1,0.0000,0),(299,1,1,0.0000,0),(300,1,1,0.0000,0),(301,1,1,0.0000,0),(302,1,1,0.0000,0),(303,1,1,0.0000,0),(304,1,1,0.0000,0),(305,1,1,0.0000,0),(306,1,1,0.0000,0),(307,1,1,0.0000,0),(308,1,1,0.0000,0),(309,1,1,0.0000,0),(310,1,1,0.0000,0),(311,1,1,0.0000,0),(312,1,1,0.0000,0),(313,1,1,0.0000,0);
/*!40000 ALTER TABLE `grocery_bag_cataloginventory_stock_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_cataloginventory_stock_status_idx`
--

DROP TABLE IF EXISTS `grocery_bag_cataloginventory_stock_status_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_cataloginventory_stock_status_idx` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_cataloginventory_stock_status_idx`
--

LOCK TABLES `grocery_bag_cataloginventory_stock_status_idx` WRITE;
/*!40000 ALTER TABLE `grocery_bag_cataloginventory_stock_status_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_cataloginventory_stock_status_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_cataloginventory_stock_status_tmp`
--

DROP TABLE IF EXISTS `grocery_bag_cataloginventory_stock_status_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_cataloginventory_stock_status_tmp` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  KEY `CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_cataloginventory_stock_status_tmp`
--

LOCK TABLES `grocery_bag_cataloginventory_stock_status_tmp` WRITE;
/*!40000 ALTER TABLE `grocery_bag_cataloginventory_stock_status_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_cataloginventory_stock_status_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalogrule`
--

DROP TABLE IF EXISTS `grocery_bag_catalogrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalogrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `sub_is_enable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Rule Enable For Subitems',
  `sub_simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action For Subitems',
  `sub_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount For Subitems',
  PRIMARY KEY (`rule_id`),
  KEY `CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalogrule`
--

LOCK TABLES `grocery_bag_catalogrule` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalogrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalogrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalogrule_customer_group`
--

DROP TABLE IF EXISTS `grocery_bag_catalogrule_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalogrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `CATALOGRULE_CUSTOMER_GROUP_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `grocery_bag_catalogrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `CATRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `grocery_bag_customer_group` (`customer_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Customer Groups Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalogrule_customer_group`
--

LOCK TABLES `grocery_bag_catalogrule_customer_group` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalogrule_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalogrule_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalogrule_group_website`
--

DROP TABLE IF EXISTS `grocery_bag_catalogrule_group_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalogrule_group_website` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CATALOGRULE_GROUP_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `grocery_bag_catalogrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE,
  CONSTRAINT `CATRULE_GROUP_WS_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `grocery_bag_customer_group` (`customer_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalogrule_group_website`
--

LOCK TABLES `grocery_bag_catalogrule_group_website` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalogrule_group_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalogrule_group_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalogrule_product`
--

DROP TABLE IF EXISTS `grocery_bag_catalogrule_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `sub_simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action For Subitems',
  `sub_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount For Subitems',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `IDX_EAA51B56FF092A0DCB795D1CEF812B7B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalogrule_product`
--

LOCK TABLES `grocery_bag_catalogrule_product` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalogrule_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalogrule_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalogrule_product_price`
--

DROP TABLE IF EXISTS `grocery_bag_catalogrule_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `CATRULE_PRD_PRICE_RULE_DATE_WS_ID_CSTR_GROUP_ID_PRD_ID` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalogrule_product_price`
--

LOCK TABLES `grocery_bag_catalogrule_product_price` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalogrule_product_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalogrule_product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalogrule_website`
--

DROP TABLE IF EXISTS `grocery_bag_catalogrule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalogrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CATALOGRULE_WEBSITE_RULE_ID_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `grocery_bag_catalogrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `CATALOGRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Websites Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalogrule_website`
--

LOCK TABLES `grocery_bag_catalogrule_website` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalogrule_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalogrule_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_catalogsearch_fulltext_scope1`
--

DROP TABLE IF EXISTS `grocery_bag_catalogsearch_fulltext_scope1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_catalogsearch_fulltext_scope1` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` int(10) unsigned NOT NULL COMMENT 'Attribute_id',
  `data_index` longtext COMMENT 'Data index',
  PRIMARY KEY (`entity_id`,`attribute_id`),
  FULLTEXT KEY `FTI_FULLTEXT_DATA_INDEX` (`data_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='grocery_bag_catalogsearch_fulltext_scope1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_catalogsearch_fulltext_scope1`
--

LOCK TABLES `grocery_bag_catalogsearch_fulltext_scope1` WRITE;
/*!40000 ALTER TABLE `grocery_bag_catalogsearch_fulltext_scope1` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_catalogsearch_fulltext_scope1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_checkout_agreement`
--

DROP TABLE IF EXISTS `grocery_bag_checkout_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text COMMENT 'Checkbox Text',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `is_html` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Html',
  `mode` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Applied mode',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_checkout_agreement`
--

LOCK TABLES `grocery_bag_checkout_agreement` WRITE;
/*!40000 ALTER TABLE `grocery_bag_checkout_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_checkout_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_checkout_agreement_store`
--

DROP TABLE IF EXISTS `grocery_bag_checkout_agreement_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`agreement_id`,`store_id`),
  KEY `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CHECKOUT_AGREEMENT_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `CHKT_AGRT_STORE_AGRT_ID_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `grocery_bag_checkout_agreement` (`agreement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_checkout_agreement_store`
--

LOCK TABLES `grocery_bag_checkout_agreement_store` WRITE;
/*!40000 ALTER TABLE `grocery_bag_checkout_agreement_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_checkout_agreement_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_cms_block`
--

DROP TABLE IF EXISTS `grocery_bag_cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_cms_block` (
  `block_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Block ID',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext COMMENT 'Block Content',
  `creation_time` timestamp NULL DEFAULT NULL COMMENT 'Block Creation Time',
  `update_time` timestamp NULL DEFAULT NULL COMMENT 'Block Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Block Active',
  PRIMARY KEY (`block_id`),
  FULLTEXT KEY `GROCERY_BAG_CMS_BLOCK_TITLE_IDENTIFIER_CONTENT` (`title`,`identifier`,`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_cms_block`
--

LOCK TABLES `grocery_bag_cms_block` WRITE;
/*!40000 ALTER TABLE `grocery_bag_cms_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_cms_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_cms_block_store`
--

DROP TABLE IF EXISTS `grocery_bag_cms_block_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_cms_block_store` (
  `block_id` smallint(6) NOT NULL COMMENT 'Block ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`block_id`,`store_id`),
  KEY `CMS_BLOCK_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CMS_BLOCK_STORE_BLOCK_ID_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `grocery_bag_cms_block` (`block_id`) ON DELETE CASCADE,
  CONSTRAINT `CMS_BLOCK_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block To Store Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_cms_block_store`
--

LOCK TABLES `grocery_bag_cms_block_store` WRITE;
/*!40000 ALTER TABLE `grocery_bag_cms_block_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_cms_block_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_cms_page`
--

DROP TABLE IF EXISTS `grocery_bag_cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_cms_page` (
  `page_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Page ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `page_layout` varchar(255) DEFAULT NULL COMMENT 'Page Layout',
  `meta_keywords` text COMMENT 'Page Meta Keywords',
  `meta_description` text COMMENT 'Page Meta Description',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext COMMENT 'Page Content',
  `creation_time` timestamp NULL DEFAULT NULL COMMENT 'Page Creation Time',
  `update_time` timestamp NULL DEFAULT NULL COMMENT 'Page Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Page Active',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Page Sort Order',
  `layout_update_xml` text COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text COMMENT 'Page Custom Layout Update Content',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date',
  PRIMARY KEY (`page_id`),
  KEY `CMS_PAGE_IDENTIFIER` (`identifier`),
  FULLTEXT KEY `FTI_797FF6B8153186E26B6D6CCA9078331B` (`title`,`meta_keywords`,`meta_description`,`identifier`,`content`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CMS Page Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_cms_page`
--

LOCK TABLES `grocery_bag_cms_page` WRITE;
/*!40000 ALTER TABLE `grocery_bag_cms_page` DISABLE KEYS */;
INSERT INTO `grocery_bag_cms_page` VALUES (1,'404 Not Found','2columns-right','Page keywords','Page description','no-route','Whoops, our bad...','<dl>\r\n<dt>The page you requested was not found, and we have a fine guess why.</dt>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li>If you typed the URL directly, please make sure the spelling is correct.</li>\r\n<li>If you clicked on a link to get here, the link is outdated.</li>\r\n</ul></dd>\r\n</dl>\r\n<dl>\r\n<dt>What can you do?</dt>\r\n<dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\r\n<dd>\r\n<ul class=\"disc\">\r\n<li><a href=\"#\" onclick=\"history.go(-1); return false;\">Go back</a> to the previous page.</li>\r\n<li>Use the search bar at the top of the page to search for your products.</li>\r\n<li>Follow these links to get you back on track!<br /><a href=\"{{store url=\"\"}}\">Store Home</a> <span class=\"separator\">|</span> <a href=\"{{store url=\"customer/account\"}}\">My Account</a></li></ul></dd></dl>\r\n','2015-10-15 07:03:48','2015-10-15 07:03:48',1,0,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Home page','1column',NULL,NULL,'home','Home Page','<p>CMS homepage content goes here.</p>\r\n','2015-10-15 07:03:48','2015-10-15 07:04:05',1,0,'<!--\n    <referenceContainer name=\"right\">\n        <action method=\"unsetChild\"><argument name=\"alias\" xsi:type=\"string\">right.reports.product.viewed</argument></action>\n        <action method=\"unsetChild\"><argument name=\"alias\" xsi:type=\"string\">right.reports.product.compared</argument></action>\n    </referenceContainer>-->',NULL,NULL,NULL,NULL,NULL),(3,'Enable Cookies','1column',NULL,NULL,'enable-cookies','What are Cookies?','<div class=\"enable-cookies cms-content\">\r\n<p>\"Cookies\" are little pieces of data we send when you visit our store. Cookies help us get to know you better and personalize your experience. Plus they help protect you and other shoppers from fraud.</p>\r\n<p style=\"margin-bottom: 20px;\">Set your browser to accept cookies so you can buy items, save items, and receive customized recommendations. Here’s how:</p>\r\n<ul>\r\n<li><a href=\"https://support.google.com/accounts/answer/61416?hl=en\" target=\"_blank\">Google Chrome</a></li>\r\n<li><a href=\"http://windows.microsoft.com/en-us/internet-explorer/delete-manage-cookies\" target=\"_blank\">Internet Explorer</a></li>\r\n<li><a href=\"http://support.apple.com/kb/PH19214\" target=\"_blank\">Safari</a></li>\r\n<li><a href=\"https://support.mozilla.org/en-US/kb/enable-and-disable-cookies-website-preferences\" target=\"_blank\">Mozilla/Firefox</a></li>\r\n</ul>\r\n</div>','2015-10-15 07:03:48','2015-10-15 07:03:48',1,0,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Privacy and Cookie Policy','1column',NULL,NULL,'privacy-policy-cookie-restriction-mode','Privacy and Cookie Policy','<div class=\"privacy-policy cms-content\">\n    <div class=\"message info\">\n        <span>\n            Please replace this text with you Privacy Policy.\n            Please add any additional cookies your website uses below (e.g. Google Analytics).\n        </span>\n    </div>\n    <p>\n        This privacy policy sets out how this website (hereafter \"the Store\") uses and protects any information that\n        you give the Store while using this website. The Store is committed to ensuring that your privacy is protected.\n        Should we ask you to provide certain information by which you can be identified when using this website, then\n        you can be assured that it will only be used in accordance with this privacy statement. The Store may change\n        this policy from time to time by updating this page. You should check this page from time to time to ensure\n        that you are happy with any changes.\n    </p>\n    <h2>What we collect</h2>\n    <p>We may collect the following information:</p>\n    <ul>\n        <li>name</li>\n        <li>contact information including email address</li>\n        <li>demographic information such as postcode, preferences and interests</li>\n        <li>other information relevant to customer surveys and/or offers</li>\n    </ul>\n    <p>\n        For the exhaustive list of cookies we collect see the <a href=\"#list\">List of cookies we collect</a> section.\n    </p>\n    <h2>What we do with the information we gather</h2>\n    <p>\n        We require this information to understand your needs and provide you with a better service,\n        and in particular for the following reasons:\n    </p>\n    <ul>\n        <li>Internal record keeping.</li>\n        <li>We may use the information to improve our products and services.</li>\n        <li>\n            We may periodically send promotional emails about new products, special offers or other information which we\n            think you may find interesting using the email address which you have provided.\n        </li>\n        <li>\n            From time to time, we may also use your information to contact you for market research purposes.\n            We may contact you by email, phone, fax or mail. We may use the information to customise the website\n            according to your interests.\n        </li>\n    </ul>\n    <h2>Security</h2>\n    <p>\n        We are committed to ensuring that your information is secure. In order to prevent unauthorised access or\n        disclosure, we have put in place suitable physical, electronic and managerial procedures to safeguard and\n        secure the information we collect online.\n    </p>\n    <h2>How we use cookies</h2>\n    <p>\n        A cookie is a small file which asks permission to be placed on your computer\'s hard drive.\n        Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n        a particular site. Cookies allow web applications to respond to you as an individual. The web application\n        can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n        your preferences.\n    </p>\n    <p>\n        We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page\n        traffic and improve our website in order to tailor it to customer needs. We only use this information for\n        statistical analysis purposes and then the data is removed from the system.\n    </p>\n    <p>\n        Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find\n        useful and which you do not. A cookie in no way gives us access to your computer or any information about you,\n        other than the data you choose to share with us. You can choose to accept or decline cookies.\n        Most web browsers automatically accept cookies, but you can usually modify your browser setting\n        to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n    </p>\n    <h2>Links to other websites</h2>\n    <p>\n        Our website may contain links to other websites of interest. However, once you have used these links\n        to leave our site, you should note that we do not have any control over that other website.\n        Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n        visiting such sites and such sites are not governed by this privacy statement.\n        You should exercise caution and look at the privacy statement applicable to the website in question.\n    </p>\n    <h2>Controlling your personal information</h2>\n    <p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n    <ul>\n        <li>\n            whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n            that you do not want the information to be used by anybody for direct marketing purposes\n        </li>\n        <li>\n            if you have previously agreed to us using your personal information for direct marketing purposes,\n            you may change your mind at any time by letting us know using our Contact Us information\n        </li>\n    </ul>\n    <p>\n        We will not sell, distribute or lease your personal information to third parties unless we have your permission\n        or are required by law to do so. We may use your personal information to send you promotional information\n        about third parties which we think you may find interesting if you tell us that you wish this to happen.\n    </p>\n    <p>\n        You may request details of personal information which we hold about you under the Data Protection Act 1998.\n        A small fee will be payable. If you would like a copy of the information held on you please email us this\n        request using our Contact Us information.\n    </p>\n    <p>\n        If you believe that any information we are holding on you is incorrect or incomplete,\n        please write to or email us as soon as possible, at the above address.\n        We will promptly correct any information found to be incorrect.\n    </p>\n    <h2><a name=\"list\"></a>List of cookies we collect</h2>\n    <p>The table below lists the cookies we collect and what information they store.</p>\n    <table class=\"data-table\">\n        <thead>\n            <tr>\n                <th>COOKIE name</th>\n                <th>COOKIE Description</th>\n            </tr>\n        </thead>\n        <tbody>\n            <tr>\n                <th>CART</th>\n                <td>The association with your shopping cart.</td>\n            </tr>\n            <tr>\n                <th>CATEGORY_INFO</th>\n                <td>Stores the category info on the page, that allows to display pages more quickly.</td>\n            </tr>\n            <tr>\n                <th>COMPARE</th>\n                <td>The items that you have in the Compare Products list.</td>\n            </tr>\n            <tr>\n                <th>CUSTOMER</th>\n                <td>An encrypted version of your customer id with the store.</td>\n            </tr>\n            <tr>\n                <th>CUSTOMER_AUTH</th>\n                <td>An indicator if you are currently logged into the store.</td>\n            </tr>\n            <tr>\n                <th>CUSTOMER_INFO</th>\n                <td>An encrypted version of the customer group you belong to.</td>\n            </tr>\n            <tr>\n                <th>CUSTOMER_SEGMENT_IDS</th>\n                <td>Stores the Customer Segment ID</td>\n            </tr>\n            <tr>\n                <th>EXTERNAL_NO_CACHE</th>\n                <td>A flag, which indicates whether caching is disabled or not.</td>\n            </tr>\n            <tr>\n                <th>FORM_KEY</th>\n                <td>Stores form key used by page cache functionality.</td>\n            </tr>\n            <tr>\n                <th>FRONTEND</th>\n                <td>Your session ID on the server.</td>\n            </tr>\n            <tr>\n                <th>GUEST-VIEW</th>\n                <td>Allows guests to edit their orders.</td>\n            </tr>\n            <tr>\n                <th>LAST_CATEGORY</th>\n                <td>The last category you visited.</td>\n            </tr>\n            <tr>\n                <th>LAST_PRODUCT</th>\n                <td>The most recent product you have viewed.</td>\n            </tr>\n            <tr>\n                <th>NEWMESSAGE</th>\n                <td>Indicates whether a new message has been received.</td>\n            </tr>\n            <tr>\n                <th>NO_CACHE</th>\n                <td>Indicates whether it is allowed to use cache.</td>\n            </tr>\n            <tr>\n                <th>PERSISTENT_SHOPPING_CART</th>\n                <td>A link to information about your cart and viewing history if you have asked the site.</td>\n            </tr>\n            <tr>\n                <th>RECENTLYCOMPARED</th>\n                <td>The items that you have recently compared.</td>\n            </tr>\n            <tr>\n                <th>STF</th>\n                <td>Information on products you have emailed to friends.</td>\n            </tr>\n            <tr>\n                <th>STORE</th>\n                <td>The store view or language you have selected.</td>\n            </tr>\n            <tr>\n                <th>USER_ALLOWED_SAVE_COOKIE</th>\n                <td>Indicates whether a customer allowed to use cookies.</td>\n            </tr>\n            <tr>\n                <th>VIEWED_PRODUCT_IDS</th>\n                <td>The products that you have recently viewed.</td>\n            </tr>\n            <tr>\n                <th>WISHLIST</th>\n                <td>An encrypted list of products added to your Wish List.</td>\n            </tr>\n            <tr>\n                <th>WISHLIST_CNT</th>\n                <td>The number of items in your Wish List.</td>\n            </tr>\n        </tbody>\n    </table>\n</div>','2015-10-15 07:03:48','2015-10-15 07:03:48',1,0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `grocery_bag_cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_cms_page_store`
--

DROP TABLE IF EXISTS `grocery_bag_cms_page_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_cms_page_store` (
  `page_id` smallint(6) NOT NULL COMMENT 'Page ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`page_id`,`store_id`),
  KEY `CMS_PAGE_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `CMS_PAGE_STORE_PAGE_ID_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `grocery_bag_cms_page` (`page_id`) ON DELETE CASCADE,
  CONSTRAINT `CMS_PAGE_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page To Store Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_cms_page_store`
--

LOCK TABLES `grocery_bag_cms_page_store` WRITE;
/*!40000 ALTER TABLE `grocery_bag_cms_page_store` DISABLE KEYS */;
INSERT INTO `grocery_bag_cms_page_store` VALUES (1,0),(2,0),(3,0),(4,0);
/*!40000 ALTER TABLE `grocery_bag_cms_page_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_core_config_data`
--

DROP TABLE IF EXISTS `grocery_bag_core_config_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_core_config_data` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Config Id',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Config Scope Id',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text COMMENT 'Config Value',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='Config Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_core_config_data`
--

LOCK TABLES `grocery_bag_core_config_data` WRITE;
/*!40000 ALTER TABLE `grocery_bag_core_config_data` DISABLE KEYS */;
INSERT INTO `grocery_bag_core_config_data` VALUES (1,'default',0,'web/seo/use_rewrites','1'),(2,'default',0,'web/unsecure/base_url','http://fedoraservermagento/'),(3,'default',0,'web/secure/base_url','https://fedoraservermagento/'),(4,'default',0,'general/locale/code','en_US'),(5,'default',0,'web/secure/use_in_frontend','0'),(6,'default',0,'web/secure/use_in_adminhtml','1'),(7,'default',0,'general/locale/timezone','Asia/Colombo'),(8,'default',0,'currency/options/base','LKR'),(9,'default',0,'currency/options/default','LKR'),(10,'default',0,'currency/options/allow','LKR'),(11,'default',0,'general/region/display_all','1'),(12,'default',0,'general/region/state_required','AT,BR,CA,EE,FI,FR,DE,LV,LT,RO,ES,CH,US'),(13,'default',0,'catalog/category/root_id',NULL),(14,'default',0,'general/country/default','US'),(15,'default',0,'general/country/allow','AF,AX,AL,DZ,AS,AD,AO,AI,AQ,AG,AR,AM,AW,AU,AT,AZ,BS,BH,BD,BB,BY,BE,BZ,BJ,BM,BT,BO,BA,BW,BV,BR,IO,VG,BN,BG,BF,BI,KH,CM,CA,CV,KY,CF,TD,CL,CN,CX,CC,CO,KM,CG,CD,CK,CR,CI,HR,CU,CY,CZ,DK,DJ,DM,DO,EC,EG,SV,GQ,ER,EE,ET,FK,FO,FJ,FI,FR,GF,PF,TF,GA,GM,GE,DE,GH,GI,GR,GL,GD,GP,GU,GT,GG,GN,GW,GY,HT,HM,HN,HK,HU,IS,IN,ID,IR,IQ,IE,IM,IL,IT,JM,JP,JE,JO,KZ,KE,KI,KW,KG,LA,LV,LB,LS,LR,LY,LI,LT,LU,MO,MK,MG,MW,MY,MV,ML,MT,MH,MQ,MR,MU,YT,MX,FM,MD,MC,MN,ME,MS,MA,MZ,MM,NA,NR,NP,NL,AN,NC,NZ,NI,NE,NG,NU,NF,MP,KP,NO,OM,PK,PW,PS,PA,PG,PY,PE,PH,PN,PL,PT,QA,RE,RO,RU,RW,WS,SM,ST,SA,SN,RS,SC,SL,SG,SK,SI,SB,SO,ZA,GS,KR,ES,LK,BL,SH,KN,LC,MF,PM,VC,SD,SR,SJ,SZ,SE,CH,SY,TW,TJ,TZ,TH,TL,TG,TK,TO,TT,TN,TR,TM,TC,TV,UG,UA,AE,GB,US,UY,UM,VI,UZ,VU,VA,VE,VN,WF,EH,YE,ZM,ZW'),(16,'default',0,'general/country/optional_zip_countries','HK,IE,MO,PA,GB'),(17,'default',0,'general/country/eu_countries','AT,BE,BG,HR,CY,CZ,DK,EE,FI,FR,DE,GR,HU,IE,IT,LV,LT,LU,MT,NL,PL,PT,RO,SK,SI,ES,SE,GB'),(18,'default',0,'general/locale/weight_unit','kgs'),(19,'default',0,'general/locale/firstday','1'),(20,'default',0,'general/locale/weekend','0,6'),(21,'default',0,'general/store_information/name',NULL),(22,'default',0,'general/store_information/phone',NULL),(23,'default',0,'general/store_information/hours',NULL),(24,'default',0,'general/store_information/country_id',NULL),(25,'default',0,'general/store_information/region_id',NULL),(26,'default',0,'general/store_information/postcode',NULL),(27,'default',0,'general/store_information/city',NULL),(28,'default',0,'general/store_information/street_line1',NULL),(29,'default',0,'general/store_information/street_line2',NULL),(30,'default',0,'general/store_information/merchant_vat_number',NULL),(31,'default',0,'general/single_store_mode/enabled','0'),(32,'default',0,'web/url/use_store','0'),(33,'default',0,'web/url/redirect_to_base','1'),(34,'default',0,'web/unsecure/base_link_url','{{unsecure_base_url}}'),(35,'default',0,'web/unsecure/base_static_url',NULL),(36,'default',0,'web/unsecure/base_media_url',NULL),(37,'default',0,'web/secure/base_link_url','{{secure_base_url}}'),(38,'default',0,'web/secure/base_static_url',NULL),(39,'default',0,'web/secure/base_media_url',NULL),(40,'default',0,'web/secure/offloader_header','SSL_OFFLOADED'),(41,'default',0,'web/default/front','cms'),(42,'default',0,'web/default/cms_home_page','home'),(43,'default',0,'web/default/no_route','cms/noroute/index'),(44,'default',0,'web/default/cms_no_route','no-route'),(45,'default',0,'web/default/cms_no_cookies','enable-cookies'),(46,'default',0,'web/default/show_cms_breadcrumbs','1'),(47,'default',0,'web/cookie/cookie_lifetime','3600000'),(48,'default',0,'web/cookie/cookie_path',NULL),(49,'default',0,'web/cookie/cookie_domain',NULL),(50,'default',0,'web/cookie/cookie_httponly','1'),(51,'default',0,'web/cookie/cookie_restriction','0'),(52,'default',0,'web/session/use_remote_addr','0'),(53,'default',0,'web/session/use_http_via','0'),(54,'default',0,'web/session/use_http_x_forwarded_for','0'),(55,'default',0,'web/session/use_http_user_agent','0'),(56,'default',0,'web/session/use_frontend_sid','1'),(57,'default',0,'web/browser_capabilities/cookies','1'),(58,'default',0,'web/browser_capabilities/javascript','1'),(59,'default',0,'web/browser_capabilities/local_storage','0'),(60,'default',0,'admin/emails/forgot_email_template','admin_emails_forgot_email_template'),(61,'default',0,'admin/emails/forgot_email_identity','general'),(62,'default',0,'admin/emails/password_reset_link_expiration_period','1'),(63,'default',0,'admin/emails/reset_password_template','admin_emails_reset_password_template'),(64,'default',0,'admin/startup/menu_item_id','Magento_Backend::dashboard'),(65,'default',0,'admin/url/use_custom','0'),(66,'default',0,'admin/url/use_custom_path','0'),(67,'default',0,'admin/security/use_form_key','1'),(68,'default',0,'admin/security/use_case_sensitive_login','0'),(69,'default',0,'admin/security/session_lifetime','360000'),(70,'default',0,'admin/security/lockout_failures','6'),(71,'default',0,'admin/security/lockout_threshold','30'),(72,'default',0,'admin/security/password_lifetime','90'),(73,'default',0,'admin/security/password_is_forced','1'),(74,'default',0,'admin/dashboard/enable_charts','1'),(75,'default',0,'admin/captcha/enable','0');
/*!40000 ALTER TABLE `grocery_bag_core_config_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_cron_schedule`
--

DROP TABLE IF EXISTS `grocery_bag_cron_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Schedule Id',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text COMMENT 'Messages',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At',
  PRIMARY KEY (`schedule_id`),
  KEY `CRON_SCHEDULE_JOB_CODE` (`job_code`),
  KEY `CRON_SCHEDULE_SCHEDULED_AT_STATUS` (`scheduled_at`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Cron Schedule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_cron_schedule`
--

LOCK TABLES `grocery_bag_cron_schedule` WRITE;
/*!40000 ALTER TABLE `grocery_bag_cron_schedule` DISABLE KEYS */;
INSERT INTO `grocery_bag_cron_schedule` VALUES (1,'catalog_index_refresh_price','pending',NULL,'2015-10-15 07:29:01','2015-10-15 07:30:00',NULL,NULL),(2,'sales_clean_orders','pending',NULL,'2015-10-15 07:29:01','2015-10-15 07:30:00',NULL,NULL),(3,'sales_grid_order_async_insert','pending',NULL,'2015-10-15 07:29:01','2015-10-15 07:29:00',NULL,NULL),(4,'sales_grid_order_invoice_async_insert','pending',NULL,'2015-10-15 07:29:01','2015-10-15 07:29:00',NULL,NULL),(5,'sales_grid_order_shipment_async_insert','pending',NULL,'2015-10-15 07:29:01','2015-10-15 07:29:00',NULL,NULL),(6,'sales_grid_order_creditmemo_async_insert','pending',NULL,'2015-10-15 07:29:01','2015-10-15 07:29:00',NULL,NULL),(7,'sales_send_order_emails','pending',NULL,'2015-10-15 07:29:01','2015-10-15 07:29:00',NULL,NULL),(8,'sales_send_order_invoice_emails','pending',NULL,'2015-10-15 07:29:01','2015-10-15 07:29:00',NULL,NULL),(9,'sales_send_order_shipment_emails','pending',NULL,'2015-10-15 07:29:01','2015-10-15 07:29:00',NULL,NULL),(10,'sales_send_order_creditmemo_emails','pending',NULL,'2015-10-15 07:29:01','2015-10-15 07:29:00',NULL,NULL),(11,'newsletter_send_all','pending',NULL,'2015-10-15 07:29:01','2015-10-15 07:30:00',NULL,NULL),(12,'captcha_delete_old_attempts','pending',NULL,'2015-10-15 07:29:01','2015-10-15 07:30:00',NULL,NULL),(13,'captcha_delete_expired_images','pending',NULL,'2015-10-15 07:29:01','2015-10-15 07:30:00',NULL,NULL),(14,'magento_newrelicreporting_cron','pending',NULL,'2015-10-15 07:29:01','2015-10-15 07:30:00',NULL,NULL);
/*!40000 ALTER TABLE `grocery_bag_cron_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_address_entity`
--

DROP TABLE IF EXISTS `grocery_bag_customer_address_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `city` varchar(255) NOT NULL COMMENT 'City',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `country_id` varchar(255) NOT NULL COMMENT 'Country',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `firstname` varchar(255) NOT NULL COMMENT 'First Name',
  `lastname` varchar(255) NOT NULL COMMENT 'Last Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Zip/Postal Code',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `region` varchar(255) DEFAULT NULL COMMENT 'State/Province',
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'State/Province',
  `street` text NOT NULL COMMENT 'Street Address',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `telephone` varchar(255) NOT NULL COMMENT 'Phone Number',
  `vat_id` varchar(255) DEFAULT NULL COMMENT 'VAT number',
  `vat_is_valid` int(10) unsigned DEFAULT NULL COMMENT 'VAT number validity',
  `vat_request_date` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request date',
  `vat_request_id` varchar(255) DEFAULT NULL COMMENT 'VAT number validation request ID',
  `vat_request_success` int(10) unsigned DEFAULT NULL COMMENT 'VAT number validation request success',
  PRIMARY KEY (`entity_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`),
  CONSTRAINT `CUSTOMER_ADDRESS_ENTITY_PARENT_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_address_entity`
--

LOCK TABLES `grocery_bag_customer_address_entity` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_address_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_customer_address_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_address_entity_datetime`
--

DROP TABLE IF EXISTS `grocery_bag_customer_address_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_DTIME_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_DTIME_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Datetime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_address_entity_datetime`
--

LOCK TABLES `grocery_bag_customer_address_entity_datetime` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_address_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_customer_address_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_address_entity_decimal`
--

DROP TABLE IF EXISTS `grocery_bag_customer_address_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_DEC_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_DEC_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Decimal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_address_entity_decimal`
--

LOCK TABLES `grocery_bag_customer_address_entity_decimal` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_address_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_customer_address_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_address_entity_int`
--

DROP TABLE IF EXISTS `grocery_bag_customer_address_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_address_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_INT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_INT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Int';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_address_entity_int`
--

LOCK TABLES `grocery_bag_customer_address_entity_int` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_address_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_customer_address_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_address_entity_text`
--

DROP TABLE IF EXISTS `grocery_bag_customer_address_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_address_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CSTR_ADDR_ENTT_TEXT_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_TEXT_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Text';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_address_entity_text`
--

LOCK TABLES `grocery_bag_customer_address_entity_text` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_address_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_customer_address_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_address_entity_varchar`
--

DROP TABLE IF EXISTS `grocery_bag_customer_address_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CSTR_ADDR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_ADDR_ENTT_VCHR_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_customer_address_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Varchar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_address_entity_varchar`
--

LOCK TABLES `grocery_bag_customer_address_entity_varchar` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_address_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_customer_address_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_eav_attribute`
--

DROP TABLE IF EXISTS `grocery_bag_customer_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Multiline Count',
  `validate_rules` text COMMENT 'Validate Rules',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model',
  `is_used_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used in Grid',
  `is_visible_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible in Grid',
  `is_filterable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable in Grid',
  `is_searchable_in_grid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable in Grid',
  PRIMARY KEY (`attribute_id`),
  CONSTRAINT `CUSTOMER_EAV_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_eav_attribute`
--

LOCK TABLES `grocery_bag_customer_eav_attribute` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_eav_attribute` DISABLE KEYS */;
INSERT INTO `grocery_bag_customer_eav_attribute` VALUES (1,1,NULL,0,NULL,1,10,NULL,1,1,1,0),(2,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(3,1,NULL,0,NULL,1,20,NULL,1,1,0,1),(4,0,NULL,0,NULL,0,30,NULL,0,0,0,0),(5,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,40,NULL,0,0,0,0),(6,0,NULL,0,NULL,0,50,NULL,0,0,0,0),(7,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,60,NULL,0,0,0,0),(8,0,NULL,0,NULL,0,70,NULL,0,0,0,0),(9,1,NULL,0,'a:1:{s:16:\"input_validation\";s:5:\"email\";}',1,80,NULL,1,1,1,1),(10,1,NULL,0,NULL,1,25,NULL,1,1,1,0),(11,0,'date',0,'a:1:{s:16:\"input_validation\";s:4:\"date\";}',0,90,NULL,1,1,1,0),(12,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(13,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(14,0,NULL,0,'a:1:{s:16:\"input_validation\";s:4:\"date\";}',1,0,NULL,0,0,0,0),(15,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(16,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(17,0,NULL,0,'a:1:{s:15:\"max_text_length\";i:255;}',0,100,NULL,1,1,0,1),(18,0,NULL,0,NULL,1,0,NULL,1,1,1,0),(19,0,NULL,0,NULL,0,0,NULL,1,1,1,0),(20,0,NULL,0,'a:0:{}',0,110,NULL,1,1,1,0),(21,1,NULL,0,NULL,1,28,NULL,0,0,0,0),(22,0,NULL,0,NULL,0,10,NULL,0,0,0,0),(23,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,20,NULL,1,0,0,1),(24,0,NULL,0,NULL,0,30,NULL,0,0,0,0),(25,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,40,NULL,1,0,0,1),(26,0,NULL,0,NULL,0,50,NULL,0,0,0,0),(27,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,60,NULL,1,0,0,1),(28,1,NULL,2,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,70,NULL,1,0,0,1),(29,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,80,NULL,1,0,0,1),(30,1,NULL,0,NULL,1,90,NULL,1,1,1,0),(31,1,NULL,0,NULL,1,100,NULL,1,1,0,1),(32,1,NULL,0,NULL,1,100,NULL,0,0,0,0),(33,1,NULL,0,'a:0:{}',1,110,'Magento\\Customer\\Model\\Attribute\\Data\\Postcode',1,1,1,1),(34,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,120,NULL,1,1,1,1),(35,0,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',0,130,NULL,1,0,0,1),(36,1,NULL,0,NULL,1,140,NULL,0,0,0,0),(37,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(38,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(39,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(40,0,NULL,0,NULL,1,0,NULL,0,0,0,0),(41,0,NULL,0,NULL,0,0,NULL,0,0,0,0);
/*!40000 ALTER TABLE `grocery_bag_customer_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_eav_attribute_website`
--

DROP TABLE IF EXISTS `grocery_bag_customer_eav_attribute_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_eav_attribute_website` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `is_visible` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Required',
  `default_value` text COMMENT 'Default Value',
  `multiline_count` smallint(5) unsigned DEFAULT NULL COMMENT 'Multiline Count',
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `CSTR_EAV_ATTR_WS_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CSTR_EAV_ATTR_WS_WS_ID_STORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_eav_attribute_website`
--

LOCK TABLES `grocery_bag_customer_eav_attribute_website` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_eav_attribute_website` DISABLE KEYS */;
INSERT INTO `grocery_bag_customer_eav_attribute_website` VALUES (1,1,NULL,NULL,NULL,NULL),(3,1,NULL,NULL,NULL,NULL),(9,1,NULL,NULL,NULL,NULL),(10,1,NULL,NULL,NULL,NULL),(11,1,NULL,NULL,NULL,NULL),(17,1,NULL,NULL,NULL,NULL),(18,1,NULL,NULL,NULL,NULL),(19,1,NULL,NULL,NULL,NULL),(20,1,NULL,NULL,NULL,NULL),(21,1,NULL,NULL,NULL,NULL),(23,1,NULL,NULL,NULL,NULL),(25,1,NULL,NULL,NULL,NULL),(27,1,NULL,NULL,NULL,NULL),(28,1,NULL,NULL,NULL,NULL),(29,1,NULL,NULL,NULL,NULL),(30,1,NULL,NULL,NULL,NULL),(31,1,NULL,NULL,NULL,NULL),(32,1,NULL,NULL,NULL,NULL),(33,1,NULL,NULL,NULL,NULL),(34,1,NULL,NULL,NULL,NULL),(35,1,NULL,NULL,NULL,NULL),(36,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `grocery_bag_customer_eav_attribute_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_entity`
--

DROP TABLE IF EXISTS `grocery_bag_customer_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Website Id',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `disable_auto_group_change` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Disable automatic group change based on VAT ID',
  `created_in` varchar(255) DEFAULT NULL COMMENT 'Created From',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'First Name',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middle Name/Initial',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Last Name',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `dob` date DEFAULT NULL COMMENT 'Date Of Birth',
  `password_hash` varchar(128) DEFAULT NULL COMMENT 'Password_hash',
  `rp_token` varchar(128) DEFAULT NULL COMMENT 'Reset password token',
  `rp_token_created_at` datetime DEFAULT NULL COMMENT 'Reset password token creation time',
  `default_billing` int(10) unsigned DEFAULT NULL COMMENT 'Default Billing Address',
  `default_shipping` int(10) unsigned DEFAULT NULL COMMENT 'Default Shipping Address',
  `taxvat` varchar(50) DEFAULT NULL COMMENT 'Tax/VAT Number',
  `confirmation` varchar(64) DEFAULT NULL COMMENT 'Is Confirmed',
  `gender` smallint(5) unsigned DEFAULT NULL COMMENT 'Gender',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  KEY `CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  KEY `CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`),
  KEY `CUSTOMER_ENTITY_FIRSTNAME` (`firstname`),
  KEY `CUSTOMER_ENTITY_LASTNAME` (`lastname`),
  CONSTRAINT `CUSTOMER_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `CUSTOMER_ENTITY_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_entity`
--

LOCK TABLES `grocery_bag_customer_entity` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_customer_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_entity_datetime`
--

DROP TABLE IF EXISTS `grocery_bag_customer_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_DATETIME_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Datetime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_entity_datetime`
--

LOCK TABLES `grocery_bag_customer_entity_datetime` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_customer_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_entity_decimal`
--

DROP TABLE IF EXISTS `grocery_bag_customer_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Decimal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_entity_decimal`
--

LOCK TABLES `grocery_bag_customer_entity_decimal` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_customer_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_entity_int`
--

DROP TABLE IF EXISTS `grocery_bag_customer_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_INT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_INT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Int';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_entity_int`
--

LOCK TABLES `grocery_bag_customer_entity_int` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_customer_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_entity_text`
--

DROP TABLE IF EXISTS `grocery_bag_customer_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_TEXT_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Text';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_entity_text`
--

LOCK TABLES `grocery_bag_customer_entity_text` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_customer_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_entity_varchar`
--

DROP TABLE IF EXISTS `grocery_bag_customer_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Varchar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_entity_varchar`
--

LOCK TABLES `grocery_bag_customer_entity_varchar` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_customer_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_form_attribute`
--

DROP TABLE IF EXISTS `grocery_bag_customer_form_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Form Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_form_attribute`
--

LOCK TABLES `grocery_bag_customer_form_attribute` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_form_attribute` DISABLE KEYS */;
INSERT INTO `grocery_bag_customer_form_attribute` VALUES ('adminhtml_checkout',9),('adminhtml_checkout',10),('adminhtml_checkout',11),('adminhtml_checkout',17),('adminhtml_checkout',20),('adminhtml_customer',1),('adminhtml_customer',3),('adminhtml_customer',4),('adminhtml_customer',5),('adminhtml_customer',6),('adminhtml_customer',7),('adminhtml_customer',8),('adminhtml_customer',9),('adminhtml_customer',10),('adminhtml_customer',11),('adminhtml_customer',17),('adminhtml_customer',19),('adminhtml_customer',20),('adminhtml_customer',21),('adminhtml_customer_address',22),('adminhtml_customer_address',23),('adminhtml_customer_address',24),('adminhtml_customer_address',25),('adminhtml_customer_address',26),('adminhtml_customer_address',27),('adminhtml_customer_address',28),('adminhtml_customer_address',29),('adminhtml_customer_address',30),('adminhtml_customer_address',31),('adminhtml_customer_address',32),('adminhtml_customer_address',33),('adminhtml_customer_address',34),('adminhtml_customer_address',35),('adminhtml_customer_address',36),('checkout_register',4),('checkout_register',5),('checkout_register',6),('checkout_register',7),('checkout_register',8),('checkout_register',9),('checkout_register',11),('checkout_register',17),('checkout_register',19),('checkout_register',20),('customer_account_create',4),('customer_account_create',5),('customer_account_create',6),('customer_account_create',7),('customer_account_create',8),('customer_account_create',9),('customer_account_create',11),('customer_account_create',17),('customer_account_create',19),('customer_account_create',20),('customer_account_edit',4),('customer_account_edit',5),('customer_account_edit',6),('customer_account_edit',7),('customer_account_edit',8),('customer_account_edit',9),('customer_account_edit',11),('customer_account_edit',17),('customer_account_edit',19),('customer_account_edit',20),('customer_address_edit',22),('customer_address_edit',23),('customer_address_edit',24),('customer_address_edit',25),('customer_address_edit',26),('customer_address_edit',27),('customer_address_edit',28),('customer_address_edit',29),('customer_address_edit',30),('customer_address_edit',31),('customer_address_edit',32),('customer_address_edit',33),('customer_address_edit',34),('customer_address_edit',35),('customer_address_edit',36),('customer_register_address',22),('customer_register_address',23),('customer_register_address',24),('customer_register_address',25),('customer_register_address',26),('customer_register_address',27),('customer_register_address',28),('customer_register_address',29),('customer_register_address',30),('customer_register_address',31),('customer_register_address',32),('customer_register_address',33),('customer_register_address',34),('customer_register_address',35),('customer_register_address',36);
/*!40000 ALTER TABLE `grocery_bag_customer_form_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_grid_flat`
--

DROP TABLE IF EXISTS `grocery_bag_customer_grid_flat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_grid_flat` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `name` text COMMENT 'Name',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` int(11) DEFAULT NULL COMMENT 'Group_id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created_at',
  `website_id` int(11) DEFAULT NULL COMMENT 'Website_id',
  `confirmation` int(11) DEFAULT NULL COMMENT 'Confirmation',
  `created_in` text COMMENT 'Created_in',
  `dob` date DEFAULT NULL COMMENT 'Dob',
  `gender` int(11) DEFAULT NULL COMMENT 'Gender',
  `taxvat` varchar(255) DEFAULT NULL COMMENT 'Taxvat',
  `last_visit_at` datetime DEFAULT NULL COMMENT 'Last_visit_at',
  `billing_full` text COMMENT 'Billing_full',
  `billing_firstname` varchar(255) DEFAULT NULL COMMENT 'Billing_firstname',
  `billing_lastname` varchar(255) DEFAULT NULL COMMENT 'Billing_lastname',
  `billing_telephone` varchar(255) DEFAULT NULL COMMENT 'Billing_telephone',
  `billing_postcode` varchar(255) DEFAULT NULL COMMENT 'Billing_postcode',
  `billing_country_id` varchar(255) DEFAULT NULL COMMENT 'Billing_country_id',
  `billing_region` varchar(255) DEFAULT NULL COMMENT 'Billing_region',
  `billing_street` varchar(255) DEFAULT NULL COMMENT 'Billing_street',
  `billing_city` varchar(255) DEFAULT NULL COMMENT 'Billing_city',
  `billing_fax` varchar(255) DEFAULT NULL COMMENT 'Billing_fax',
  `billing_vat_id` varchar(255) DEFAULT NULL COMMENT 'Billing_vat_id',
  `billing_company` varchar(255) DEFAULT NULL COMMENT 'Billing_company',
  `shipping_full` text COMMENT 'Shipping_full',
  PRIMARY KEY (`entity_id`),
  KEY `GROCERY_BAG_CUSTOMER_GRID_FLAT_GROUP_ID` (`group_id`),
  KEY `GROCERY_BAG_CUSTOMER_GRID_FLAT_CREATED_AT` (`created_at`),
  KEY `GROCERY_BAG_CUSTOMER_GRID_FLAT_WEBSITE_ID` (`website_id`),
  KEY `GROCERY_BAG_CUSTOMER_GRID_FLAT_CONFIRMATION` (`confirmation`),
  KEY `GROCERY_BAG_CUSTOMER_GRID_FLAT_DOB` (`dob`),
  KEY `GROCERY_BAG_CUSTOMER_GRID_FLAT_GENDER` (`gender`),
  KEY `GROCERY_BAG_CUSTOMER_GRID_FLAT_LAST_VISIT_AT` (`last_visit_at`),
  KEY `GROCERY_BAG_CUSTOMER_GRID_FLAT_BILLING_COUNTRY_ID` (`billing_country_id`),
  FULLTEXT KEY `FTI_536D3CF7E333E8191DB2510DAF43DC6B` (`name`,`email`,`created_in`,`taxvat`,`billing_full`,`billing_firstname`,`billing_lastname`,`billing_telephone`,`billing_postcode`,`billing_region`,`billing_city`,`billing_fax`,`billing_company`,`shipping_full`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='grocery_bag_customer_grid_flat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_grid_flat`
--

LOCK TABLES `grocery_bag_customer_grid_flat` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_grid_flat` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_customer_grid_flat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_group`
--

DROP TABLE IF EXISTS `grocery_bag_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_group` (
  `customer_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Customer Group Id',
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tax Class Id',
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Customer Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_group`
--

LOCK TABLES `grocery_bag_customer_group` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_group` DISABLE KEYS */;
INSERT INTO `grocery_bag_customer_group` VALUES (0,'NOT LOGGED IN',3),(1,'General',3),(2,'Wholesale',3),(3,'Retailer',3);
/*!40000 ALTER TABLE `grocery_bag_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_log`
--

DROP TABLE IF EXISTS `grocery_bag_customer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `customer_id` int(11) NOT NULL COMMENT 'Customer ID',
  `last_login_at` timestamp NULL DEFAULT NULL COMMENT 'Last Login Time',
  `last_logout_at` timestamp NULL DEFAULT NULL COMMENT 'Last Logout Time',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `GROCERY_BAG_CUSTOMER_LOG_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Log Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_log`
--

LOCK TABLES `grocery_bag_customer_log` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_customer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_customer_visitor`
--

DROP TABLE IF EXISTS `grocery_bag_customer_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_customer_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `session_id` varchar(64) DEFAULT NULL COMMENT 'Session ID',
  `last_visit_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Visit Time',
  PRIMARY KEY (`visitor_id`),
  KEY `CUSTOMER_VISITOR_CUSTOMER_ID` (`customer_id`),
  KEY `CUSTOMER_VISITOR_LAST_VISIT_AT` (`last_visit_at`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Visitor Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_customer_visitor`
--

LOCK TABLES `grocery_bag_customer_visitor` WRITE;
/*!40000 ALTER TABLE `grocery_bag_customer_visitor` DISABLE KEYS */;
INSERT INTO `grocery_bag_customer_visitor` VALUES (1,NULL,'k5nutr8aithrdbphg6epphvo81','2015-10-15 07:08:45'),(2,NULL,'17st198qbq6ctd8024cqk1g097','2015-10-15 07:09:32'),(3,NULL,'o1u3hcqf1am0tepak776u2emh1','2015-10-15 07:17:12'),(4,NULL,'211vc0imekbvk3h9h96f6uggs7','2015-10-15 07:26:39'),(5,NULL,'ucf18mv0rbitu09iiqtlhr3ck1','2015-10-15 07:26:48'),(6,NULL,'og4o57842jdmnbi91g0964lt31','2015-10-15 08:05:18'),(7,NULL,'p9vi9b417gp96isl7cbc24cp64','2015-10-15 08:08:14'),(8,NULL,'ergn2cs6tg1chjg9rqomgqp673','2015-10-15 08:16:36'),(9,NULL,'3jq0tdv0vu069jubk79j114tp6','2015-10-15 08:32:36'),(10,NULL,'s321dnal3ptgg57ftitsofoas1','2015-10-15 09:49:00'),(11,NULL,'djqboa6pnnp24blc5kggbhuf33','2015-10-15 12:38:34'),(12,NULL,'ujdidr083o96cmd13b4a7ftia4','2015-10-15 16:31:03'),(13,NULL,'djqboa6pnnp24blc5kggbhuf33','2015-10-16 06:39:51');
/*!40000 ALTER TABLE `grocery_bag_customer_visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_design_change`
--

DROP TABLE IF EXISTS `grocery_bag_design_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_design_change` (
  `design_change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Design Change Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity',
  PRIMARY KEY (`design_change_id`),
  KEY `DESIGN_CHANGE_STORE_ID` (`store_id`),
  CONSTRAINT `DESIGN_CHANGE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Design Changes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_design_change`
--

LOCK TABLES `grocery_bag_design_change` WRITE;
/*!40000 ALTER TABLE `grocery_bag_design_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_design_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_directory_country`
--

DROP TABLE IF EXISTS `grocery_bag_directory_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_directory_country` (
  `country_id` varchar(2) NOT NULL COMMENT 'Country Id in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_directory_country`
--

LOCK TABLES `grocery_bag_directory_country` WRITE;
/*!40000 ALTER TABLE `grocery_bag_directory_country` DISABLE KEYS */;
INSERT INTO `grocery_bag_directory_country` VALUES ('AD','AD','AND'),('AE','AE','ARE'),('AF','AF','AFG'),('AG','AG','ATG'),('AI','AI','AIA'),('AL','AL','ALB'),('AM','AM','ARM'),('AN','AN','ANT'),('AO','AO','AGO'),('AQ','AQ','ATA'),('AR','AR','ARG'),('AS','AS','ASM'),('AT','AT','AUT'),('AU','AU','AUS'),('AW','AW','ABW'),('AX','AX','ALA'),('AZ','AZ','AZE'),('BA','BA','BIH'),('BB','BB','BRB'),('BD','BD','BGD'),('BE','BE','BEL'),('BF','BF','BFA'),('BG','BG','BGR'),('BH','BH','BHR'),('BI','BI','BDI'),('BJ','BJ','BEN'),('BL','BL','BLM'),('BM','BM','BMU'),('BN','BN','BRN'),('BO','BO','BOL'),('BR','BR','BRA'),('BS','BS','BHS'),('BT','BT','BTN'),('BV','BV','BVT'),('BW','BW','BWA'),('BY','BY','BLR'),('BZ','BZ','BLZ'),('CA','CA','CAN'),('CC','CC','CCK'),('CD','CD','COD'),('CF','CF','CAF'),('CG','CG','COG'),('CH','CH','CHE'),('CI','CI','CIV'),('CK','CK','COK'),('CL','CL','CHL'),('CM','CM','CMR'),('CN','CN','CHN'),('CO','CO','COL'),('CR','CR','CRI'),('CU','CU','CUB'),('CV','CV','CPV'),('CX','CX','CXR'),('CY','CY','CYP'),('CZ','CZ','CZE'),('DE','DE','DEU'),('DJ','DJ','DJI'),('DK','DK','DNK'),('DM','DM','DMA'),('DO','DO','DOM'),('DZ','DZ','DZA'),('EC','EC','ECU'),('EE','EE','EST'),('EG','EG','EGY'),('EH','EH','ESH'),('ER','ER','ERI'),('ES','ES','ESP'),('ET','ET','ETH'),('FI','FI','FIN'),('FJ','FJ','FJI'),('FK','FK','FLK'),('FM','FM','FSM'),('FO','FO','FRO'),('FR','FR','FRA'),('GA','GA','GAB'),('GB','GB','GBR'),('GD','GD','GRD'),('GE','GE','GEO'),('GF','GF','GUF'),('GG','GG','GGY'),('GH','GH','GHA'),('GI','GI','GIB'),('GL','GL','GRL'),('GM','GM','GMB'),('GN','GN','GIN'),('GP','GP','GLP'),('GQ','GQ','GNQ'),('GR','GR','GRC'),('GS','GS','SGS'),('GT','GT','GTM'),('GU','GU','GUM'),('GW','GW','GNB'),('GY','GY','GUY'),('HK','HK','HKG'),('HM','HM','HMD'),('HN','HN','HND'),('HR','HR','HRV'),('HT','HT','HTI'),('HU','HU','HUN'),('ID','ID','IDN'),('IE','IE','IRL'),('IL','IL','ISR'),('IM','IM','IMN'),('IN','IN','IND'),('IO','IO','IOT'),('IQ','IQ','IRQ'),('IR','IR','IRN'),('IS','IS','ISL'),('IT','IT','ITA'),('JE','JE','JEY'),('JM','JM','JAM'),('JO','JO','JOR'),('JP','JP','JPN'),('KE','KE','KEN'),('KG','KG','KGZ'),('KH','KH','KHM'),('KI','KI','KIR'),('KM','KM','COM'),('KN','KN','KNA'),('KP','KP','PRK'),('KR','KR','KOR'),('KW','KW','KWT'),('KY','KY','CYM'),('KZ','KZ','KAZ'),('LA','LA','LAO'),('LB','LB','LBN'),('LC','LC','LCA'),('LI','LI','LIE'),('LK','LK','LKA'),('LR','LR','LBR'),('LS','LS','LSO'),('LT','LT','LTU'),('LU','LU','LUX'),('LV','LV','LVA'),('LY','LY','LBY'),('MA','MA','MAR'),('MC','MC','MCO'),('MD','MD','MDA'),('ME','ME','MNE'),('MF','MF','MAF'),('MG','MG','MDG'),('MH','MH','MHL'),('MK','MK','MKD'),('ML','ML','MLI'),('MM','MM','MMR'),('MN','MN','MNG'),('MO','MO','MAC'),('MP','MP','MNP'),('MQ','MQ','MTQ'),('MR','MR','MRT'),('MS','MS','MSR'),('MT','MT','MLT'),('MU','MU','MUS'),('MV','MV','MDV'),('MW','MW','MWI'),('MX','MX','MEX'),('MY','MY','MYS'),('MZ','MZ','MOZ'),('NA','NA','NAM'),('NC','NC','NCL'),('NE','NE','NER'),('NF','NF','NFK'),('NG','NG','NGA'),('NI','NI','NIC'),('NL','NL','NLD'),('NO','NO','NOR'),('NP','NP','NPL'),('NR','NR','NRU'),('NU','NU','NIU'),('NZ','NZ','NZL'),('OM','OM','OMN'),('PA','PA','PAN'),('PE','PE','PER'),('PF','PF','PYF'),('PG','PG','PNG'),('PH','PH','PHL'),('PK','PK','PAK'),('PL','PL','POL'),('PM','PM','SPM'),('PN','PN','PCN'),('PS','PS','PSE'),('PT','PT','PRT'),('PW','PW','PLW'),('PY','PY','PRY'),('QA','QA','QAT'),('RE','RE','REU'),('RO','RO','ROU'),('RS','RS','SRB'),('RU','RU','RUS'),('RW','RW','RWA'),('SA','SA','SAU'),('SB','SB','SLB'),('SC','SC','SYC'),('SD','SD','SDN'),('SE','SE','SWE'),('SG','SG','SGP'),('SH','SH','SHN'),('SI','SI','SVN'),('SJ','SJ','SJM'),('SK','SK','SVK'),('SL','SL','SLE'),('SM','SM','SMR'),('SN','SN','SEN'),('SO','SO','SOM'),('SR','SR','SUR'),('ST','ST','STP'),('SV','SV','SLV'),('SY','SY','SYR'),('SZ','SZ','SWZ'),('TC','TC','TCA'),('TD','TD','TCD'),('TF','TF','ATF'),('TG','TG','TGO'),('TH','TH','THA'),('TJ','TJ','TJK'),('TK','TK','TKL'),('TL','TL','TLS'),('TM','TM','TKM'),('TN','TN','TUN'),('TO','TO','TON'),('TR','TR','TUR'),('TT','TT','TTO'),('TV','TV','TUV'),('TW','TW','TWN'),('TZ','TZ','TZA'),('UA','UA','UKR'),('UG','UG','UGA'),('UM','UM','UMI'),('US','US','USA'),('UY','UY','URY'),('UZ','UZ','UZB'),('VA','VA','VAT'),('VC','VC','VCT'),('VE','VE','VEN'),('VG','VG','VGB'),('VI','VI','VIR'),('VN','VN','VNM'),('VU','VU','VUT'),('WF','WF','WLF'),('WS','WS','WSM'),('YE','YE','YEM'),('YT','YT','MYT'),('ZA','ZA','ZAF'),('ZM','ZM','ZMB'),('ZW','ZW','ZWE');
/*!40000 ALTER TABLE `grocery_bag_directory_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_directory_country_format`
--

DROP TABLE IF EXISTS `grocery_bag_directory_country_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Country Format Id',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id in ISO-2',
  `type` varchar(30) DEFAULT NULL COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format',
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Format';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_directory_country_format`
--

LOCK TABLES `grocery_bag_directory_country_format` WRITE;
/*!40000 ALTER TABLE `grocery_bag_directory_country_format` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_directory_country_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_directory_country_region`
--

DROP TABLE IF EXISTS `grocery_bag_directory_country_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_directory_country_region` (
  `region_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Region Id',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country Id in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`region_id`),
  KEY `DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8 COMMENT='Directory Country Region';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_directory_country_region`
--

LOCK TABLES `grocery_bag_directory_country_region` WRITE;
/*!40000 ALTER TABLE `grocery_bag_directory_country_region` DISABLE KEYS */;
INSERT INTO `grocery_bag_directory_country_region` VALUES (1,'US','AL','Alabama'),(2,'US','AK','Alaska'),(3,'US','AS','American Samoa'),(4,'US','AZ','Arizona'),(5,'US','AR','Arkansas'),(6,'US','AE','Armed Forces Africa'),(7,'US','AA','Armed Forces Americas'),(8,'US','AE','Armed Forces Canada'),(9,'US','AE','Armed Forces Europe'),(10,'US','AE','Armed Forces Middle East'),(11,'US','AP','Armed Forces Pacific'),(12,'US','CA','California'),(13,'US','CO','Colorado'),(14,'US','CT','Connecticut'),(15,'US','DE','Delaware'),(16,'US','DC','District of Columbia'),(17,'US','FM','Federated States Of Micronesia'),(18,'US','FL','Florida'),(19,'US','GA','Georgia'),(20,'US','GU','Guam'),(21,'US','HI','Hawaii'),(22,'US','ID','Idaho'),(23,'US','IL','Illinois'),(24,'US','IN','Indiana'),(25,'US','IA','Iowa'),(26,'US','KS','Kansas'),(27,'US','KY','Kentucky'),(28,'US','LA','Louisiana'),(29,'US','ME','Maine'),(30,'US','MH','Marshall Islands'),(31,'US','MD','Maryland'),(32,'US','MA','Massachusetts'),(33,'US','MI','Michigan'),(34,'US','MN','Minnesota'),(35,'US','MS','Mississippi'),(36,'US','MO','Missouri'),(37,'US','MT','Montana'),(38,'US','NE','Nebraska'),(39,'US','NV','Nevada'),(40,'US','NH','New Hampshire'),(41,'US','NJ','New Jersey'),(42,'US','NM','New Mexico'),(43,'US','NY','New York'),(44,'US','NC','North Carolina'),(45,'US','ND','North Dakota'),(46,'US','MP','Northern Mariana Islands'),(47,'US','OH','Ohio'),(48,'US','OK','Oklahoma'),(49,'US','OR','Oregon'),(50,'US','PW','Palau'),(51,'US','PA','Pennsylvania'),(52,'US','PR','Puerto Rico'),(53,'US','RI','Rhode Island'),(54,'US','SC','South Carolina'),(55,'US','SD','South Dakota'),(56,'US','TN','Tennessee'),(57,'US','TX','Texas'),(58,'US','UT','Utah'),(59,'US','VT','Vermont'),(60,'US','VI','Virgin Islands'),(61,'US','VA','Virginia'),(62,'US','WA','Washington'),(63,'US','WV','West Virginia'),(64,'US','WI','Wisconsin'),(65,'US','WY','Wyoming'),(66,'CA','AB','Alberta'),(67,'CA','BC','British Columbia'),(68,'CA','MB','Manitoba'),(69,'CA','NL','Newfoundland and Labrador'),(70,'CA','NB','New Brunswick'),(71,'CA','NS','Nova Scotia'),(72,'CA','NT','Northwest Territories'),(73,'CA','NU','Nunavut'),(74,'CA','ON','Ontario'),(75,'CA','PE','Prince Edward Island'),(76,'CA','QC','Quebec'),(77,'CA','SK','Saskatchewan'),(78,'CA','YT','Yukon Territory'),(79,'DE','NDS','Niedersachsen'),(80,'DE','BAW','Baden-Württemberg'),(81,'DE','BAY','Bayern'),(82,'DE','BER','Berlin'),(83,'DE','BRG','Brandenburg'),(84,'DE','BRE','Bremen'),(85,'DE','HAM','Hamburg'),(86,'DE','HES','Hessen'),(87,'DE','MEC','Mecklenburg-Vorpommern'),(88,'DE','NRW','Nordrhein-Westfalen'),(89,'DE','RHE','Rheinland-Pfalz'),(90,'DE','SAR','Saarland'),(91,'DE','SAS','Sachsen'),(92,'DE','SAC','Sachsen-Anhalt'),(93,'DE','SCN','Schleswig-Holstein'),(94,'DE','THE','Thüringen'),(95,'AT','WI','Wien'),(96,'AT','NO','Niederösterreich'),(97,'AT','OO','Oberösterreich'),(98,'AT','SB','Salzburg'),(99,'AT','KN','Kärnten'),(100,'AT','ST','Steiermark'),(101,'AT','TI','Tirol'),(102,'AT','BL','Burgenland'),(103,'AT','VB','Vorarlberg'),(104,'CH','AG','Aargau'),(105,'CH','AI','Appenzell Innerrhoden'),(106,'CH','AR','Appenzell Ausserrhoden'),(107,'CH','BE','Bern'),(108,'CH','BL','Basel-Landschaft'),(109,'CH','BS','Basel-Stadt'),(110,'CH','FR','Freiburg'),(111,'CH','GE','Genf'),(112,'CH','GL','Glarus'),(113,'CH','GR','Graubünden'),(114,'CH','JU','Jura'),(115,'CH','LU','Luzern'),(116,'CH','NE','Neuenburg'),(117,'CH','NW','Nidwalden'),(118,'CH','OW','Obwalden'),(119,'CH','SG','St. Gallen'),(120,'CH','SH','Schaffhausen'),(121,'CH','SO','Solothurn'),(122,'CH','SZ','Schwyz'),(123,'CH','TG','Thurgau'),(124,'CH','TI','Tessin'),(125,'CH','UR','Uri'),(126,'CH','VD','Waadt'),(127,'CH','VS','Wallis'),(128,'CH','ZG','Zug'),(129,'CH','ZH','Zürich'),(130,'ES','A Coruсa','A Coruña'),(131,'ES','Alava','Alava'),(132,'ES','Albacete','Albacete'),(133,'ES','Alicante','Alicante'),(134,'ES','Almeria','Almeria'),(135,'ES','Asturias','Asturias'),(136,'ES','Avila','Avila'),(137,'ES','Badajoz','Badajoz'),(138,'ES','Baleares','Baleares'),(139,'ES','Barcelona','Barcelona'),(140,'ES','Burgos','Burgos'),(141,'ES','Caceres','Caceres'),(142,'ES','Cadiz','Cadiz'),(143,'ES','Cantabria','Cantabria'),(144,'ES','Castellon','Castellon'),(145,'ES','Ceuta','Ceuta'),(146,'ES','Ciudad Real','Ciudad Real'),(147,'ES','Cordoba','Cordoba'),(148,'ES','Cuenca','Cuenca'),(149,'ES','Girona','Girona'),(150,'ES','Granada','Granada'),(151,'ES','Guadalajara','Guadalajara'),(152,'ES','Guipuzcoa','Guipuzcoa'),(153,'ES','Huelva','Huelva'),(154,'ES','Huesca','Huesca'),(155,'ES','Jaen','Jaen'),(156,'ES','La Rioja','La Rioja'),(157,'ES','Las Palmas','Las Palmas'),(158,'ES','Leon','Leon'),(159,'ES','Lleida','Lleida'),(160,'ES','Lugo','Lugo'),(161,'ES','Madrid','Madrid'),(162,'ES','Malaga','Malaga'),(163,'ES','Melilla','Melilla'),(164,'ES','Murcia','Murcia'),(165,'ES','Navarra','Navarra'),(166,'ES','Ourense','Ourense'),(167,'ES','Palencia','Palencia'),(168,'ES','Pontevedra','Pontevedra'),(169,'ES','Salamanca','Salamanca'),(170,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,'ES','Segovia','Segovia'),(172,'ES','Sevilla','Sevilla'),(173,'ES','Soria','Soria'),(174,'ES','Tarragona','Tarragona'),(175,'ES','Teruel','Teruel'),(176,'ES','Toledo','Toledo'),(177,'ES','Valencia','Valencia'),(178,'ES','Valladolid','Valladolid'),(179,'ES','Vizcaya','Vizcaya'),(180,'ES','Zamora','Zamora'),(181,'ES','Zaragoza','Zaragoza'),(182,'FR','1','Ain'),(183,'FR','2','Aisne'),(184,'FR','3','Allier'),(185,'FR','4','Alpes-de-Haute-Provence'),(186,'FR','5','Hautes-Alpes'),(187,'FR','6','Alpes-Maritimes'),(188,'FR','7','Ardèche'),(189,'FR','8','Ardennes'),(190,'FR','9','Ariège'),(191,'FR','10','Aube'),(192,'FR','11','Aude'),(193,'FR','12','Aveyron'),(194,'FR','13','Bouches-du-Rhône'),(195,'FR','14','Calvados'),(196,'FR','15','Cantal'),(197,'FR','16','Charente'),(198,'FR','17','Charente-Maritime'),(199,'FR','18','Cher'),(200,'FR','19','Corrèze'),(201,'FR','2A','Corse-du-Sud'),(202,'FR','2B','Haute-Corse'),(203,'FR','21','Côte-d\'Or'),(204,'FR','22','Côtes-d\'Armor'),(205,'FR','23','Creuse'),(206,'FR','24','Dordogne'),(207,'FR','25','Doubs'),(208,'FR','26','Drôme'),(209,'FR','27','Eure'),(210,'FR','28','Eure-et-Loir'),(211,'FR','29','Finistère'),(212,'FR','30','Gard'),(213,'FR','31','Haute-Garonne'),(214,'FR','32','Gers'),(215,'FR','33','Gironde'),(216,'FR','34','Hérault'),(217,'FR','35','Ille-et-Vilaine'),(218,'FR','36','Indre'),(219,'FR','37','Indre-et-Loire'),(220,'FR','38','Isère'),(221,'FR','39','Jura'),(222,'FR','40','Landes'),(223,'FR','41','Loir-et-Cher'),(224,'FR','42','Loire'),(225,'FR','43','Haute-Loire'),(226,'FR','44','Loire-Atlantique'),(227,'FR','45','Loiret'),(228,'FR','46','Lot'),(229,'FR','47','Lot-et-Garonne'),(230,'FR','48','Lozère'),(231,'FR','49','Maine-et-Loire'),(232,'FR','50','Manche'),(233,'FR','51','Marne'),(234,'FR','52','Haute-Marne'),(235,'FR','53','Mayenne'),(236,'FR','54','Meurthe-et-Moselle'),(237,'FR','55','Meuse'),(238,'FR','56','Morbihan'),(239,'FR','57','Moselle'),(240,'FR','58','Nièvre'),(241,'FR','59','Nord'),(242,'FR','60','Oise'),(243,'FR','61','Orne'),(244,'FR','62','Pas-de-Calais'),(245,'FR','63','Puy-de-Dôme'),(246,'FR','64','Pyrénées-Atlantiques'),(247,'FR','65','Hautes-Pyrénées'),(248,'FR','66','Pyrénées-Orientales'),(249,'FR','67','Bas-Rhin'),(250,'FR','68','Haut-Rhin'),(251,'FR','69','Rhône'),(252,'FR','70','Haute-Saône'),(253,'FR','71','Saône-et-Loire'),(254,'FR','72','Sarthe'),(255,'FR','73','Savoie'),(256,'FR','74','Haute-Savoie'),(257,'FR','75','Paris'),(258,'FR','76','Seine-Maritime'),(259,'FR','77','Seine-et-Marne'),(260,'FR','78','Yvelines'),(261,'FR','79','Deux-Sèvres'),(262,'FR','80','Somme'),(263,'FR','81','Tarn'),(264,'FR','82','Tarn-et-Garonne'),(265,'FR','83','Var'),(266,'FR','84','Vaucluse'),(267,'FR','85','Vendée'),(268,'FR','86','Vienne'),(269,'FR','87','Haute-Vienne'),(270,'FR','88','Vosges'),(271,'FR','89','Yonne'),(272,'FR','90','Territoire-de-Belfort'),(273,'FR','91','Essonne'),(274,'FR','92','Hauts-de-Seine'),(275,'FR','93','Seine-Saint-Denis'),(276,'FR','94','Val-de-Marne'),(277,'FR','95','Val-d\'Oise'),(278,'RO','AB','Alba'),(279,'RO','AR','Arad'),(280,'RO','AG','Argeş'),(281,'RO','BC','Bacău'),(282,'RO','BH','Bihor'),(283,'RO','BN','Bistriţa-Năsăud'),(284,'RO','BT','Botoşani'),(285,'RO','BV','Braşov'),(286,'RO','BR','Brăila'),(287,'RO','B','Bucureşti'),(288,'RO','BZ','Buzău'),(289,'RO','CS','Caraş-Severin'),(290,'RO','CL','Călăraşi'),(291,'RO','CJ','Cluj'),(292,'RO','CT','Constanţa'),(293,'RO','CV','Covasna'),(294,'RO','DB','Dâmboviţa'),(295,'RO','DJ','Dolj'),(296,'RO','GL','Galaţi'),(297,'RO','GR','Giurgiu'),(298,'RO','GJ','Gorj'),(299,'RO','HR','Harghita'),(300,'RO','HD','Hunedoara'),(301,'RO','IL','Ialomiţa'),(302,'RO','IS','Iaşi'),(303,'RO','IF','Ilfov'),(304,'RO','MM','Maramureş'),(305,'RO','MH','Mehedinţi'),(306,'RO','MS','Mureş'),(307,'RO','NT','Neamţ'),(308,'RO','OT','Olt'),(309,'RO','PH','Prahova'),(310,'RO','SM','Satu-Mare'),(311,'RO','SJ','Sălaj'),(312,'RO','SB','Sibiu'),(313,'RO','SV','Suceava'),(314,'RO','TR','Teleorman'),(315,'RO','TM','Timiş'),(316,'RO','TL','Tulcea'),(317,'RO','VS','Vaslui'),(318,'RO','VL','Vâlcea'),(319,'RO','VN','Vrancea'),(320,'FI','Lappi','Lappi'),(321,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa'),(322,'FI','Kainuu','Kainuu'),(323,'FI','Pohjois-Karjala','Pohjois-Karjala'),(324,'FI','Pohjois-Savo','Pohjois-Savo'),(325,'FI','Etelä-Savo','Etelä-Savo'),(326,'FI','Etelä-Pohjanmaa','Etelä-Pohjanmaa'),(327,'FI','Pohjanmaa','Pohjanmaa'),(328,'FI','Pirkanmaa','Pirkanmaa'),(329,'FI','Satakunta','Satakunta'),(330,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa'),(331,'FI','Keski-Suomi','Keski-Suomi'),(332,'FI','Varsinais-Suomi','Varsinais-Suomi'),(333,'FI','Etelä-Karjala','Etelä-Karjala'),(334,'FI','Päijät-Häme','Päijät-Häme'),(335,'FI','Kanta-Häme','Kanta-Häme'),(336,'FI','Uusimaa','Uusimaa'),(337,'FI','Itä-Uusimaa','Itä-Uusimaa'),(338,'FI','Kymenlaakso','Kymenlaakso'),(339,'FI','Ahvenanmaa','Ahvenanmaa'),(340,'EE','EE-37','Harjumaa'),(341,'EE','EE-39','Hiiumaa'),(342,'EE','EE-44','Ida-Virumaa'),(343,'EE','EE-49','Jõgevamaa'),(344,'EE','EE-51','Järvamaa'),(345,'EE','EE-57','Läänemaa'),(346,'EE','EE-59','Lääne-Virumaa'),(347,'EE','EE-65','Põlvamaa'),(348,'EE','EE-67','Pärnumaa'),(349,'EE','EE-70','Raplamaa'),(350,'EE','EE-74','Saaremaa'),(351,'EE','EE-78','Tartumaa'),(352,'EE','EE-82','Valgamaa'),(353,'EE','EE-84','Viljandimaa'),(354,'EE','EE-86','Võrumaa'),(355,'LV','LV-DGV','Daugavpils'),(356,'LV','LV-JEL','Jelgava'),(357,'LV','Jēkabpils','Jēkabpils'),(358,'LV','LV-JUR','Jūrmala'),(359,'LV','LV-LPX','Liepāja'),(360,'LV','LV-LE','Liepājas novads'),(361,'LV','LV-REZ','Rēzekne'),(362,'LV','LV-RIX','Rīga'),(363,'LV','LV-RI','Rīgas novads'),(364,'LV','Valmiera','Valmiera'),(365,'LV','LV-VEN','Ventspils'),(366,'LV','Aglonas novads','Aglonas novads'),(367,'LV','LV-AI','Aizkraukles novads'),(368,'LV','Aizputes novads','Aizputes novads'),(369,'LV','Aknīstes novads','Aknīstes novads'),(370,'LV','Alojas novads','Alojas novads'),(371,'LV','Alsungas novads','Alsungas novads'),(372,'LV','LV-AL','Alūksnes novads'),(373,'LV','Amatas novads','Amatas novads'),(374,'LV','Apes novads','Apes novads'),(375,'LV','Auces novads','Auces novads'),(376,'LV','Babītes novads','Babītes novads'),(377,'LV','Baldones novads','Baldones novads'),(378,'LV','Baltinavas novads','Baltinavas novads'),(379,'LV','LV-BL','Balvu novads'),(380,'LV','LV-BU','Bauskas novads'),(381,'LV','Beverīnas novads','Beverīnas novads'),(382,'LV','Brocēnu novads','Brocēnu novads'),(383,'LV','Burtnieku novads','Burtnieku novads'),(384,'LV','Carnikavas novads','Carnikavas novads'),(385,'LV','Cesvaines novads','Cesvaines novads'),(386,'LV','Ciblas novads','Ciblas novads'),(387,'LV','LV-CE','Cēsu novads'),(388,'LV','Dagdas novads','Dagdas novads'),(389,'LV','LV-DA','Daugavpils novads'),(390,'LV','LV-DO','Dobeles novads'),(391,'LV','Dundagas novads','Dundagas novads'),(392,'LV','Durbes novads','Durbes novads'),(393,'LV','Engures novads','Engures novads'),(394,'LV','Garkalnes novads','Garkalnes novads'),(395,'LV','Grobiņas novads','Grobiņas novads'),(396,'LV','LV-GU','Gulbenes novads'),(397,'LV','Iecavas novads','Iecavas novads'),(398,'LV','Ikšķiles novads','Ikšķiles novads'),(399,'LV','Ilūkstes novads','Ilūkstes novads'),(400,'LV','Inčukalna novads','Inčukalna novads'),(401,'LV','Jaunjelgavas novads','Jaunjelgavas novads'),(402,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads'),(403,'LV','Jaunpils novads','Jaunpils novads'),(404,'LV','LV-JL','Jelgavas novads'),(405,'LV','LV-JK','Jēkabpils novads'),(406,'LV','Kandavas novads','Kandavas novads'),(407,'LV','Kokneses novads','Kokneses novads'),(408,'LV','Krimuldas novads','Krimuldas novads'),(409,'LV','Krustpils novads','Krustpils novads'),(410,'LV','LV-KR','Krāslavas novads'),(411,'LV','LV-KU','Kuldīgas novads'),(412,'LV','Kārsavas novads','Kārsavas novads'),(413,'LV','Lielvārdes novads','Lielvārdes novads'),(414,'LV','LV-LM','Limbažu novads'),(415,'LV','Lubānas novads','Lubānas novads'),(416,'LV','LV-LU','Ludzas novads'),(417,'LV','Līgatnes novads','Līgatnes novads'),(418,'LV','Līvānu novads','Līvānu novads'),(419,'LV','LV-MA','Madonas novads'),(420,'LV','Mazsalacas novads','Mazsalacas novads'),(421,'LV','Mālpils novads','Mālpils novads'),(422,'LV','Mārupes novads','Mārupes novads'),(423,'LV','Naukšēnu novads','Naukšēnu novads'),(424,'LV','Neretas novads','Neretas novads'),(425,'LV','Nīcas novads','Nīcas novads'),(426,'LV','LV-OG','Ogres novads'),(427,'LV','Olaines novads','Olaines novads'),(428,'LV','Ozolnieku novads','Ozolnieku novads'),(429,'LV','LV-PR','Preiļu novads'),(430,'LV','Priekules novads','Priekules novads'),(431,'LV','Priekuļu novads','Priekuļu novads'),(432,'LV','Pārgaujas novads','Pārgaujas novads'),(433,'LV','Pāvilostas novads','Pāvilostas novads'),(434,'LV','Pļaviņu novads','Pļaviņu novads'),(435,'LV','Raunas novads','Raunas novads'),(436,'LV','Riebiņu novads','Riebiņu novads'),(437,'LV','Rojas novads','Rojas novads'),(438,'LV','Ropažu novads','Ropažu novads'),(439,'LV','Rucavas novads','Rucavas novads'),(440,'LV','Rugāju novads','Rugāju novads'),(441,'LV','Rundāles novads','Rundāles novads'),(442,'LV','LV-RE','Rēzeknes novads'),(443,'LV','Rūjienas novads','Rūjienas novads'),(444,'LV','Salacgrīvas novads','Salacgrīvas novads'),(445,'LV','Salas novads','Salas novads'),(446,'LV','Salaspils novads','Salaspils novads'),(447,'LV','LV-SA','Saldus novads'),(448,'LV','Saulkrastu novads','Saulkrastu novads'),(449,'LV','Siguldas novads','Siguldas novads'),(450,'LV','Skrundas novads','Skrundas novads'),(451,'LV','Skrīveru novads','Skrīveru novads'),(452,'LV','Smiltenes novads','Smiltenes novads'),(453,'LV','Stopiņu novads','Stopiņu novads'),(454,'LV','Strenču novads','Strenču novads'),(455,'LV','Sējas novads','Sējas novads'),(456,'LV','LV-TA','Talsu novads'),(457,'LV','LV-TU','Tukuma novads'),(458,'LV','Tērvetes novads','Tērvetes novads'),(459,'LV','Vaiņodes novads','Vaiņodes novads'),(460,'LV','LV-VK','Valkas novads'),(461,'LV','LV-VM','Valmieras novads'),(462,'LV','Varakļānu novads','Varakļānu novads'),(463,'LV','Vecpiebalgas novads','Vecpiebalgas novads'),(464,'LV','Vecumnieku novads','Vecumnieku novads'),(465,'LV','LV-VE','Ventspils novads'),(466,'LV','Viesītes novads','Viesītes novads'),(467,'LV','Viļakas novads','Viļakas novads'),(468,'LV','Viļānu novads','Viļānu novads'),(469,'LV','Vārkavas novads','Vārkavas novads'),(470,'LV','Zilupes novads','Zilupes novads'),(471,'LV','Ādažu novads','Ādažu novads'),(472,'LV','Ērgļu novads','Ērgļu novads'),(473,'LV','Ķeguma novads','Ķeguma novads'),(474,'LV','Ķekavas novads','Ķekavas novads'),(475,'LT','LT-AL','Alytaus Apskritis'),(476,'LT','LT-KU','Kauno Apskritis'),(477,'LT','LT-KL','Klaipėdos Apskritis'),(478,'LT','LT-MR','Marijampolės Apskritis'),(479,'LT','LT-PN','Panevėžio Apskritis'),(480,'LT','LT-SA','Šiaulių Apskritis'),(481,'LT','LT-TA','Tauragės Apskritis'),(482,'LT','LT-TE','Telšių Apskritis'),(483,'LT','LT-UT','Utenos Apskritis'),(484,'LT','LT-VL','Vilniaus Apskritis'),(485,'BR','AC','Acre'),(486,'BR','AL','Alagoas'),(487,'BR','AP','Amapá'),(488,'BR','AM','Amazonas'),(489,'BR','BA','Bahia'),(490,'BR','CE','Ceará'),(491,'BR','ES','Espírito Santo'),(492,'BR','GO','Goiás'),(493,'BR','MA','Maranhão'),(494,'BR','MT','Mato Grosso'),(495,'BR','MS','Mato Grosso do Sul'),(496,'BR','MG','Minas Gerais'),(497,'BR','PA','Pará'),(498,'BR','PB','Paraíba'),(499,'BR','PR','Paraná'),(500,'BR','PE','Pernambuco'),(501,'BR','PI','Piauí'),(502,'BR','RJ','Rio de Janeiro'),(503,'BR','RN','Rio Grande do Norte'),(504,'BR','RS','Rio Grande do Sul'),(505,'BR','RO','Rondônia'),(506,'BR','RR','Roraima'),(507,'BR','SC','Santa Catarina'),(508,'BR','SP','São Paulo'),(509,'BR','SE','Sergipe'),(510,'BR','TO','Tocantins'),(511,'BR','DF','Distrito Federal');
/*!40000 ALTER TABLE `grocery_bag_directory_country_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_directory_country_region_name`
--

DROP TABLE IF EXISTS `grocery_bag_directory_country_region_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_directory_country_region_name` (
  `locale` varchar(8) NOT NULL COMMENT 'Locale',
  `region_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Region Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`),
  CONSTRAINT `DIR_COUNTRY_REGION_NAME_REGION_ID_DIR_COUNTRY_REGION_REGION_ID` FOREIGN KEY (`region_id`) REFERENCES `grocery_bag_directory_country_region` (`region_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region Name';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_directory_country_region_name`
--

LOCK TABLES `grocery_bag_directory_country_region_name` WRITE;
/*!40000 ALTER TABLE `grocery_bag_directory_country_region_name` DISABLE KEYS */;
INSERT INTO `grocery_bag_directory_country_region_name` VALUES ('en_US',1,'Alabama'),('en_US',2,'Alaska'),('en_US',3,'American Samoa'),('en_US',4,'Arizona'),('en_US',5,'Arkansas'),('en_US',6,'Armed Forces Africa'),('en_US',7,'Armed Forces Americas'),('en_US',8,'Armed Forces Canada'),('en_US',9,'Armed Forces Europe'),('en_US',10,'Armed Forces Middle East'),('en_US',11,'Armed Forces Pacific'),('en_US',12,'California'),('en_US',13,'Colorado'),('en_US',14,'Connecticut'),('en_US',15,'Delaware'),('en_US',16,'District of Columbia'),('en_US',17,'Federated States Of Micronesia'),('en_US',18,'Florida'),('en_US',19,'Georgia'),('en_US',20,'Guam'),('en_US',21,'Hawaii'),('en_US',22,'Idaho'),('en_US',23,'Illinois'),('en_US',24,'Indiana'),('en_US',25,'Iowa'),('en_US',26,'Kansas'),('en_US',27,'Kentucky'),('en_US',28,'Louisiana'),('en_US',29,'Maine'),('en_US',30,'Marshall Islands'),('en_US',31,'Maryland'),('en_US',32,'Massachusetts'),('en_US',33,'Michigan'),('en_US',34,'Minnesota'),('en_US',35,'Mississippi'),('en_US',36,'Missouri'),('en_US',37,'Montana'),('en_US',38,'Nebraska'),('en_US',39,'Nevada'),('en_US',40,'New Hampshire'),('en_US',41,'New Jersey'),('en_US',42,'New Mexico'),('en_US',43,'New York'),('en_US',44,'North Carolina'),('en_US',45,'North Dakota'),('en_US',46,'Northern Mariana Islands'),('en_US',47,'Ohio'),('en_US',48,'Oklahoma'),('en_US',49,'Oregon'),('en_US',50,'Palau'),('en_US',51,'Pennsylvania'),('en_US',52,'Puerto Rico'),('en_US',53,'Rhode Island'),('en_US',54,'South Carolina'),('en_US',55,'South Dakota'),('en_US',56,'Tennessee'),('en_US',57,'Texas'),('en_US',58,'Utah'),('en_US',59,'Vermont'),('en_US',60,'Virgin Islands'),('en_US',61,'Virginia'),('en_US',62,'Washington'),('en_US',63,'West Virginia'),('en_US',64,'Wisconsin'),('en_US',65,'Wyoming'),('en_US',66,'Alberta'),('en_US',67,'British Columbia'),('en_US',68,'Manitoba'),('en_US',69,'Newfoundland and Labrador'),('en_US',70,'New Brunswick'),('en_US',71,'Nova Scotia'),('en_US',72,'Northwest Territories'),('en_US',73,'Nunavut'),('en_US',74,'Ontario'),('en_US',75,'Prince Edward Island'),('en_US',76,'Quebec'),('en_US',77,'Saskatchewan'),('en_US',78,'Yukon Territory'),('en_US',79,'Niedersachsen'),('en_US',80,'Baden-Württemberg'),('en_US',81,'Bayern'),('en_US',82,'Berlin'),('en_US',83,'Brandenburg'),('en_US',84,'Bremen'),('en_US',85,'Hamburg'),('en_US',86,'Hessen'),('en_US',87,'Mecklenburg-Vorpommern'),('en_US',88,'Nordrhein-Westfalen'),('en_US',89,'Rheinland-Pfalz'),('en_US',90,'Saarland'),('en_US',91,'Sachsen'),('en_US',92,'Sachsen-Anhalt'),('en_US',93,'Schleswig-Holstein'),('en_US',94,'Thüringen'),('en_US',95,'Wien'),('en_US',96,'Niederösterreich'),('en_US',97,'Oberösterreich'),('en_US',98,'Salzburg'),('en_US',99,'Kärnten'),('en_US',100,'Steiermark'),('en_US',101,'Tirol'),('en_US',102,'Burgenland'),('en_US',103,'Vorarlberg'),('en_US',104,'Aargau'),('en_US',105,'Appenzell Innerrhoden'),('en_US',106,'Appenzell Ausserrhoden'),('en_US',107,'Bern'),('en_US',108,'Basel-Landschaft'),('en_US',109,'Basel-Stadt'),('en_US',110,'Freiburg'),('en_US',111,'Genf'),('en_US',112,'Glarus'),('en_US',113,'Graubünden'),('en_US',114,'Jura'),('en_US',115,'Luzern'),('en_US',116,'Neuenburg'),('en_US',117,'Nidwalden'),('en_US',118,'Obwalden'),('en_US',119,'St. Gallen'),('en_US',120,'Schaffhausen'),('en_US',121,'Solothurn'),('en_US',122,'Schwyz'),('en_US',123,'Thurgau'),('en_US',124,'Tessin'),('en_US',125,'Uri'),('en_US',126,'Waadt'),('en_US',127,'Wallis'),('en_US',128,'Zug'),('en_US',129,'Zürich'),('en_US',130,'A Coruña'),('en_US',131,'Alava'),('en_US',132,'Albacete'),('en_US',133,'Alicante'),('en_US',134,'Almeria'),('en_US',135,'Asturias'),('en_US',136,'Avila'),('en_US',137,'Badajoz'),('en_US',138,'Baleares'),('en_US',139,'Barcelona'),('en_US',140,'Burgos'),('en_US',141,'Caceres'),('en_US',142,'Cadiz'),('en_US',143,'Cantabria'),('en_US',144,'Castellon'),('en_US',145,'Ceuta'),('en_US',146,'Ciudad Real'),('en_US',147,'Cordoba'),('en_US',148,'Cuenca'),('en_US',149,'Girona'),('en_US',150,'Granada'),('en_US',151,'Guadalajara'),('en_US',152,'Guipuzcoa'),('en_US',153,'Huelva'),('en_US',154,'Huesca'),('en_US',155,'Jaen'),('en_US',156,'La Rioja'),('en_US',157,'Las Palmas'),('en_US',158,'Leon'),('en_US',159,'Lleida'),('en_US',160,'Lugo'),('en_US',161,'Madrid'),('en_US',162,'Malaga'),('en_US',163,'Melilla'),('en_US',164,'Murcia'),('en_US',165,'Navarra'),('en_US',166,'Ourense'),('en_US',167,'Palencia'),('en_US',168,'Pontevedra'),('en_US',169,'Salamanca'),('en_US',170,'Santa Cruz de Tenerife'),('en_US',171,'Segovia'),('en_US',172,'Sevilla'),('en_US',173,'Soria'),('en_US',174,'Tarragona'),('en_US',175,'Teruel'),('en_US',176,'Toledo'),('en_US',177,'Valencia'),('en_US',178,'Valladolid'),('en_US',179,'Vizcaya'),('en_US',180,'Zamora'),('en_US',181,'Zaragoza'),('en_US',182,'Ain'),('en_US',183,'Aisne'),('en_US',184,'Allier'),('en_US',185,'Alpes-de-Haute-Provence'),('en_US',186,'Hautes-Alpes'),('en_US',187,'Alpes-Maritimes'),('en_US',188,'Ardèche'),('en_US',189,'Ardennes'),('en_US',190,'Ariège'),('en_US',191,'Aube'),('en_US',192,'Aude'),('en_US',193,'Aveyron'),('en_US',194,'Bouches-du-Rhône'),('en_US',195,'Calvados'),('en_US',196,'Cantal'),('en_US',197,'Charente'),('en_US',198,'Charente-Maritime'),('en_US',199,'Cher'),('en_US',200,'Corrèze'),('en_US',201,'Corse-du-Sud'),('en_US',202,'Haute-Corse'),('en_US',203,'Côte-d\'Or'),('en_US',204,'Côtes-d\'Armor'),('en_US',205,'Creuse'),('en_US',206,'Dordogne'),('en_US',207,'Doubs'),('en_US',208,'Drôme'),('en_US',209,'Eure'),('en_US',210,'Eure-et-Loir'),('en_US',211,'Finistère'),('en_US',212,'Gard'),('en_US',213,'Haute-Garonne'),('en_US',214,'Gers'),('en_US',215,'Gironde'),('en_US',216,'Hérault'),('en_US',217,'Ille-et-Vilaine'),('en_US',218,'Indre'),('en_US',219,'Indre-et-Loire'),('en_US',220,'Isère'),('en_US',221,'Jura'),('en_US',222,'Landes'),('en_US',223,'Loir-et-Cher'),('en_US',224,'Loire'),('en_US',225,'Haute-Loire'),('en_US',226,'Loire-Atlantique'),('en_US',227,'Loiret'),('en_US',228,'Lot'),('en_US',229,'Lot-et-Garonne'),('en_US',230,'Lozère'),('en_US',231,'Maine-et-Loire'),('en_US',232,'Manche'),('en_US',233,'Marne'),('en_US',234,'Haute-Marne'),('en_US',235,'Mayenne'),('en_US',236,'Meurthe-et-Moselle'),('en_US',237,'Meuse'),('en_US',238,'Morbihan'),('en_US',239,'Moselle'),('en_US',240,'Nièvre'),('en_US',241,'Nord'),('en_US',242,'Oise'),('en_US',243,'Orne'),('en_US',244,'Pas-de-Calais'),('en_US',245,'Puy-de-Dôme'),('en_US',246,'Pyrénées-Atlantiques'),('en_US',247,'Hautes-Pyrénées'),('en_US',248,'Pyrénées-Orientales'),('en_US',249,'Bas-Rhin'),('en_US',250,'Haut-Rhin'),('en_US',251,'Rhône'),('en_US',252,'Haute-Saône'),('en_US',253,'Saône-et-Loire'),('en_US',254,'Sarthe'),('en_US',255,'Savoie'),('en_US',256,'Haute-Savoie'),('en_US',257,'Paris'),('en_US',258,'Seine-Maritime'),('en_US',259,'Seine-et-Marne'),('en_US',260,'Yvelines'),('en_US',261,'Deux-Sèvres'),('en_US',262,'Somme'),('en_US',263,'Tarn'),('en_US',264,'Tarn-et-Garonne'),('en_US',265,'Var'),('en_US',266,'Vaucluse'),('en_US',267,'Vendée'),('en_US',268,'Vienne'),('en_US',269,'Haute-Vienne'),('en_US',270,'Vosges'),('en_US',271,'Yonne'),('en_US',272,'Territoire-de-Belfort'),('en_US',273,'Essonne'),('en_US',274,'Hauts-de-Seine'),('en_US',275,'Seine-Saint-Denis'),('en_US',276,'Val-de-Marne'),('en_US',277,'Val-d\'Oise'),('en_US',278,'Alba'),('en_US',279,'Arad'),('en_US',280,'Argeş'),('en_US',281,'Bacău'),('en_US',282,'Bihor'),('en_US',283,'Bistriţa-Năsăud'),('en_US',284,'Botoşani'),('en_US',285,'Braşov'),('en_US',286,'Brăila'),('en_US',287,'Bucureşti'),('en_US',288,'Buzău'),('en_US',289,'Caraş-Severin'),('en_US',290,'Călăraşi'),('en_US',291,'Cluj'),('en_US',292,'Constanţa'),('en_US',293,'Covasna'),('en_US',294,'Dâmboviţa'),('en_US',295,'Dolj'),('en_US',296,'Galaţi'),('en_US',297,'Giurgiu'),('en_US',298,'Gorj'),('en_US',299,'Harghita'),('en_US',300,'Hunedoara'),('en_US',301,'Ialomiţa'),('en_US',302,'Iaşi'),('en_US',303,'Ilfov'),('en_US',304,'Maramureş'),('en_US',305,'Mehedinţi'),('en_US',306,'Mureş'),('en_US',307,'Neamţ'),('en_US',308,'Olt'),('en_US',309,'Prahova'),('en_US',310,'Satu-Mare'),('en_US',311,'Sălaj'),('en_US',312,'Sibiu'),('en_US',313,'Suceava'),('en_US',314,'Teleorman'),('en_US',315,'Timiş'),('en_US',316,'Tulcea'),('en_US',317,'Vaslui'),('en_US',318,'Vâlcea'),('en_US',319,'Vrancea'),('en_US',320,'Lappi'),('en_US',321,'Pohjois-Pohjanmaa'),('en_US',322,'Kainuu'),('en_US',323,'Pohjois-Karjala'),('en_US',324,'Pohjois-Savo'),('en_US',325,'Etelä-Savo'),('en_US',326,'Etelä-Pohjanmaa'),('en_US',327,'Pohjanmaa'),('en_US',328,'Pirkanmaa'),('en_US',329,'Satakunta'),('en_US',330,'Keski-Pohjanmaa'),('en_US',331,'Keski-Suomi'),('en_US',332,'Varsinais-Suomi'),('en_US',333,'Etelä-Karjala'),('en_US',334,'Päijät-Häme'),('en_US',335,'Kanta-Häme'),('en_US',336,'Uusimaa'),('en_US',337,'Itä-Uusimaa'),('en_US',338,'Kymenlaakso'),('en_US',339,'Ahvenanmaa'),('en_US',340,'Harjumaa'),('en_US',341,'Hiiumaa'),('en_US',342,'Ida-Virumaa'),('en_US',343,'Jõgevamaa'),('en_US',344,'Järvamaa'),('en_US',345,'Läänemaa'),('en_US',346,'Lääne-Virumaa'),('en_US',347,'Põlvamaa'),('en_US',348,'Pärnumaa'),('en_US',349,'Raplamaa'),('en_US',350,'Saaremaa'),('en_US',351,'Tartumaa'),('en_US',352,'Valgamaa'),('en_US',353,'Viljandimaa'),('en_US',354,'Võrumaa'),('en_US',355,'Daugavpils'),('en_US',356,'Jelgava'),('en_US',357,'Jēkabpils'),('en_US',358,'Jūrmala'),('en_US',359,'Liepāja'),('en_US',360,'Liepājas novads'),('en_US',361,'Rēzekne'),('en_US',362,'Rīga'),('en_US',363,'Rīgas novads'),('en_US',364,'Valmiera'),('en_US',365,'Ventspils'),('en_US',366,'Aglonas novads'),('en_US',367,'Aizkraukles novads'),('en_US',368,'Aizputes novads'),('en_US',369,'Aknīstes novads'),('en_US',370,'Alojas novads'),('en_US',371,'Alsungas novads'),('en_US',372,'Alūksnes novads'),('en_US',373,'Amatas novads'),('en_US',374,'Apes novads'),('en_US',375,'Auces novads'),('en_US',376,'Babītes novads'),('en_US',377,'Baldones novads'),('en_US',378,'Baltinavas novads'),('en_US',379,'Balvu novads'),('en_US',380,'Bauskas novads'),('en_US',381,'Beverīnas novads'),('en_US',382,'Brocēnu novads'),('en_US',383,'Burtnieku novads'),('en_US',384,'Carnikavas novads'),('en_US',385,'Cesvaines novads'),('en_US',386,'Ciblas novads'),('en_US',387,'Cēsu novads'),('en_US',388,'Dagdas novads'),('en_US',389,'Daugavpils novads'),('en_US',390,'Dobeles novads'),('en_US',391,'Dundagas novads'),('en_US',392,'Durbes novads'),('en_US',393,'Engures novads'),('en_US',394,'Garkalnes novads'),('en_US',395,'Grobiņas novads'),('en_US',396,'Gulbenes novads'),('en_US',397,'Iecavas novads'),('en_US',398,'Ikšķiles novads'),('en_US',399,'Ilūkstes novads'),('en_US',400,'Inčukalna novads'),('en_US',401,'Jaunjelgavas novads'),('en_US',402,'Jaunpiebalgas novads'),('en_US',403,'Jaunpils novads'),('en_US',404,'Jelgavas novads'),('en_US',405,'Jēkabpils novads'),('en_US',406,'Kandavas novads'),('en_US',407,'Kokneses novads'),('en_US',408,'Krimuldas novads'),('en_US',409,'Krustpils novads'),('en_US',410,'Krāslavas novads'),('en_US',411,'Kuldīgas novads'),('en_US',412,'Kārsavas novads'),('en_US',413,'Lielvārdes novads'),('en_US',414,'Limbažu novads'),('en_US',415,'Lubānas novads'),('en_US',416,'Ludzas novads'),('en_US',417,'Līgatnes novads'),('en_US',418,'Līvānu novads'),('en_US',419,'Madonas novads'),('en_US',420,'Mazsalacas novads'),('en_US',421,'Mālpils novads'),('en_US',422,'Mārupes novads'),('en_US',423,'Naukšēnu novads'),('en_US',424,'Neretas novads'),('en_US',425,'Nīcas novads'),('en_US',426,'Ogres novads'),('en_US',427,'Olaines novads'),('en_US',428,'Ozolnieku novads'),('en_US',429,'Preiļu novads'),('en_US',430,'Priekules novads'),('en_US',431,'Priekuļu novads'),('en_US',432,'Pārgaujas novads'),('en_US',433,'Pāvilostas novads'),('en_US',434,'Pļaviņu novads'),('en_US',435,'Raunas novads'),('en_US',436,'Riebiņu novads'),('en_US',437,'Rojas novads'),('en_US',438,'Ropažu novads'),('en_US',439,'Rucavas novads'),('en_US',440,'Rugāju novads'),('en_US',441,'Rundāles novads'),('en_US',442,'Rēzeknes novads'),('en_US',443,'Rūjienas novads'),('en_US',444,'Salacgrīvas novads'),('en_US',445,'Salas novads'),('en_US',446,'Salaspils novads'),('en_US',447,'Saldus novads'),('en_US',448,'Saulkrastu novads'),('en_US',449,'Siguldas novads'),('en_US',450,'Skrundas novads'),('en_US',451,'Skrīveru novads'),('en_US',452,'Smiltenes novads'),('en_US',453,'Stopiņu novads'),('en_US',454,'Strenču novads'),('en_US',455,'Sējas novads'),('en_US',456,'Talsu novads'),('en_US',457,'Tukuma novads'),('en_US',458,'Tērvetes novads'),('en_US',459,'Vaiņodes novads'),('en_US',460,'Valkas novads'),('en_US',461,'Valmieras novads'),('en_US',462,'Varakļānu novads'),('en_US',463,'Vecpiebalgas novads'),('en_US',464,'Vecumnieku novads'),('en_US',465,'Ventspils novads'),('en_US',466,'Viesītes novads'),('en_US',467,'Viļakas novads'),('en_US',468,'Viļānu novads'),('en_US',469,'Vārkavas novads'),('en_US',470,'Zilupes novads'),('en_US',471,'Ādažu novads'),('en_US',472,'Ērgļu novads'),('en_US',473,'Ķeguma novads'),('en_US',474,'Ķekavas novads'),('en_US',475,'Alytaus Apskritis'),('en_US',476,'Kauno Apskritis'),('en_US',477,'Klaipėdos Apskritis'),('en_US',478,'Marijampolės Apskritis'),('en_US',479,'Panevėžio Apskritis'),('en_US',480,'Šiaulių Apskritis'),('en_US',481,'Tauragės Apskritis'),('en_US',482,'Telšių Apskritis'),('en_US',483,'Utenos Apskritis'),('en_US',484,'Vilniaus Apskritis'),('en_US',485,'Acre'),('en_US',486,'Alagoas'),('en_US',487,'Amapá'),('en_US',488,'Amazonas'),('en_US',489,'Bahia'),('en_US',490,'Ceará'),('en_US',491,'Espírito Santo'),('en_US',492,'Goiás'),('en_US',493,'Maranhão'),('en_US',494,'Mato Grosso'),('en_US',495,'Mato Grosso do Sul'),('en_US',496,'Minas Gerais'),('en_US',497,'Pará'),('en_US',498,'Paraíba'),('en_US',499,'Paraná'),('en_US',500,'Pernambuco'),('en_US',501,'Piauí'),('en_US',502,'Rio de Janeiro'),('en_US',503,'Rio Grande do Norte'),('en_US',504,'Rio Grande do Sul'),('en_US',505,'Rondônia'),('en_US',506,'Roraima'),('en_US',507,'Santa Catarina'),('en_US',508,'São Paulo'),('en_US',509,'Sergipe'),('en_US',510,'Tocantins'),('en_US',511,'Distrito Federal');
/*!40000 ALTER TABLE `grocery_bag_directory_country_region_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_directory_currency_rate`
--

DROP TABLE IF EXISTS `grocery_bag_directory_currency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' COMMENT 'Currency Conversion Rate',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Currency Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_directory_currency_rate`
--

LOCK TABLES `grocery_bag_directory_currency_rate` WRITE;
/*!40000 ALTER TABLE `grocery_bag_directory_currency_rate` DISABLE KEYS */;
INSERT INTO `grocery_bag_directory_currency_rate` VALUES ('EUR','EUR',1.000000000000),('EUR','USD',1.415000000000),('USD','EUR',0.706700000000),('USD','USD',1.000000000000);
/*!40000 ALTER TABLE `grocery_bag_directory_currency_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_downloadable_link`
--

DROP TABLE IF EXISTS `grocery_bag_downloadable_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_downloadable_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  `number_of_downloads` int(11) DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  PRIMARY KEY (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`),
  CONSTRAINT `DOWNLOADABLE_LINK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_downloadable_link`
--

LOCK TABLES `grocery_bag_downloadable_link` WRITE;
/*!40000 ALTER TABLE `grocery_bag_downloadable_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_downloadable_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_downloadable_link_price`
--

DROP TABLE IF EXISTS `grocery_bag_downloadable_link_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Price ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  PRIMARY KEY (`price_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  KEY `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `DOWNLOADABLE_LINK_PRICE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `grocery_bag_downloadable_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_LINK_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_downloadable_link_price`
--

LOCK TABLES `grocery_bag_downloadable_link_price` WRITE;
/*!40000 ALTER TABLE `grocery_bag_downloadable_link_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_downloadable_link_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_downloadable_link_purchased`
--

DROP TABLE IF EXISTS `grocery_bag_downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID',
  `order_id` int(10) unsigned DEFAULT '0' COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of modification',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title',
  PRIMARY KEY (`purchased_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `DL_LNK_PURCHASED_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `DOWNLOADABLE_LINK_PURCHASED_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `grocery_bag_sales_order` (`entity_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_downloadable_link_purchased`
--

LOCK TABLES `grocery_bag_downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `grocery_bag_downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_downloadable_link_purchased_item`
--

DROP TABLE IF EXISTS `grocery_bag_downloadable_link_purchased_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `purchased_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Purchased ID',
  `order_item_id` int(10) unsigned DEFAULT '0' COMMENT 'Order Item ID',
  `product_id` int(10) unsigned DEFAULT '0' COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads used',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  PRIMARY KEY (`item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  KEY `DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`),
  CONSTRAINT `DL_LNK_PURCHASED_ITEM_ORDER_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`order_item_id`) REFERENCES `grocery_bag_sales_order_item` (`item_id`) ON DELETE SET NULL,
  CONSTRAINT `DL_LNK_PURCHASED_ITEM_PURCHASED_ID_DL_LNK_PURCHASED_PURCHASED_ID` FOREIGN KEY (`purchased_id`) REFERENCES `grocery_bag_downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Item Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_downloadable_link_purchased_item`
--

LOCK TABLES `grocery_bag_downloadable_link_purchased_item` WRITE;
/*!40000 ALTER TABLE `grocery_bag_downloadable_link_purchased_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_downloadable_link_purchased_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_downloadable_link_title`
--

DROP TABLE IF EXISTS `grocery_bag_downloadable_link_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  KEY `DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `DOWNLOADABLE_LINK_TITLE_LINK_ID_DOWNLOADABLE_LINK_LINK_ID` FOREIGN KEY (`link_id`) REFERENCES `grocery_bag_downloadable_link` (`link_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_LINK_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_downloadable_link_title`
--

LOCK TABLES `grocery_bag_downloadable_link_title` WRITE;
/*!40000 ALTER TABLE `grocery_bag_downloadable_link_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_downloadable_link_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_downloadable_sample`
--

DROP TABLE IF EXISTS `grocery_bag_downloadable_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sample ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`sample_id`),
  KEY `DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`),
  CONSTRAINT `DOWNLOADABLE_SAMPLE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_downloadable_sample`
--

LOCK TABLES `grocery_bag_downloadable_sample` WRITE;
/*!40000 ALTER TABLE `grocery_bag_downloadable_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_downloadable_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_downloadable_sample_title`
--

DROP TABLE IF EXISTS `grocery_bag_downloadable_sample_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `sample_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sample ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  KEY `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `DL_SAMPLE_TTL_SAMPLE_ID_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `grocery_bag_downloadable_sample` (`sample_id`) ON DELETE CASCADE,
  CONSTRAINT `DOWNLOADABLE_SAMPLE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_downloadable_sample_title`
--

LOCK TABLES `grocery_bag_downloadable_sample_title` WRITE;
/*!40000 ALTER TABLE `grocery_bag_downloadable_sample_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_downloadable_sample_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_attribute`
--

DROP TABLE IF EXISTS `grocery_bag_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_code` varchar(255) DEFAULT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Required',
  `is_user_defined` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is User Defined',
  `default_value` text COMMENT 'Default Value',
  `is_unique` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note',
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`),
  CONSTRAINT `EAV_ATTRIBUTE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `grocery_bag_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_attribute`
--

LOCK TABLES `grocery_bag_eav_attribute` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_attribute` DISABLE KEYS */;
INSERT INTO `grocery_bag_eav_attribute` VALUES (1,1,'website_id',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Website','static',NULL,NULL,'select','Associate to Website',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Website',1,0,NULL,0,NULL),(2,1,'store_id',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Store','static',NULL,NULL,'select','Create In',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Store',1,0,NULL,0,NULL),(3,1,'created_in',NULL,NULL,'static',NULL,NULL,'text','Created From',NULL,NULL,0,0,NULL,0,NULL),(4,1,'prefix',NULL,NULL,'static',NULL,NULL,'text','Prefix',NULL,NULL,0,0,NULL,0,NULL),(5,1,'firstname',NULL,NULL,'static',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),(6,1,'middlename',NULL,NULL,'static',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),(7,1,'lastname',NULL,NULL,'static',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),(8,1,'suffix',NULL,NULL,'static',NULL,NULL,'text','Suffix',NULL,NULL,0,0,NULL,0,NULL),(9,1,'email',NULL,NULL,'static',NULL,NULL,'text','Email',NULL,NULL,1,0,NULL,0,NULL),(10,1,'group_id',NULL,NULL,'static',NULL,NULL,'select','Group',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Source\\Group',1,0,NULL,0,NULL),(11,1,'dob',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','static',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime','date','Date Of Birth',NULL,NULL,0,0,NULL,0,NULL),(12,1,'password_hash',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Password','static',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),(13,1,'rp_token',NULL,NULL,'static',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),(14,1,'rp_token_created_at',NULL,NULL,'static',NULL,NULL,'date',NULL,NULL,NULL,0,0,NULL,0,NULL),(15,1,'default_billing',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Billing','static',NULL,NULL,'text','Default Billing Address',NULL,NULL,0,0,NULL,0,NULL),(16,1,'default_shipping',NULL,'Magento\\Customer\\Model\\Customer\\Attribute\\Backend\\Shipping','static',NULL,NULL,'text','Default Shipping Address',NULL,NULL,0,0,NULL,0,NULL),(17,1,'taxvat',NULL,NULL,'static',NULL,NULL,'text','Tax/VAT Number',NULL,NULL,0,0,NULL,0,NULL),(18,1,'confirmation',NULL,NULL,'static',NULL,NULL,'text','Is Confirmed',NULL,NULL,0,0,NULL,0,NULL),(19,1,'created_at',NULL,NULL,'static',NULL,NULL,'date','Created At',NULL,NULL,0,0,NULL,0,NULL),(20,1,'gender',NULL,NULL,'static',NULL,NULL,'select','Gender',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Table',0,0,NULL,0,NULL),(21,1,'disable_auto_group_change',NULL,'Magento\\Customer\\Model\\Attribute\\Backend\\Data\\Boolean','static',NULL,NULL,'boolean','Disable Automatic Group Change Based on VAT ID',NULL,NULL,0,0,NULL,0,NULL),(22,2,'prefix',NULL,NULL,'static',NULL,NULL,'text','Prefix',NULL,NULL,0,0,NULL,0,NULL),(23,2,'firstname',NULL,NULL,'static',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),(24,2,'middlename',NULL,NULL,'static',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),(25,2,'lastname',NULL,NULL,'static',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),(26,2,'suffix',NULL,NULL,'static',NULL,NULL,'text','Suffix',NULL,NULL,0,0,NULL,0,NULL),(27,2,'company',NULL,NULL,'static',NULL,NULL,'text','Company',NULL,NULL,0,0,NULL,0,NULL),(28,2,'street',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\DefaultBackend','static',NULL,NULL,'multiline','Street Address',NULL,NULL,1,0,NULL,0,NULL),(29,2,'city',NULL,NULL,'static',NULL,NULL,'text','City',NULL,NULL,1,0,NULL,0,NULL),(30,2,'country_id',NULL,NULL,'static',NULL,NULL,'select','Country',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Country',1,0,NULL,0,NULL),(31,2,'region',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Backend\\Region','static',NULL,NULL,'text','State/Province',NULL,NULL,0,0,NULL,0,NULL),(32,2,'region_id',NULL,NULL,'static',NULL,NULL,'hidden','State/Province',NULL,'Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Source\\Region',0,0,NULL,0,NULL),(33,2,'postcode',NULL,NULL,'static',NULL,NULL,'text','Zip/Postal Code',NULL,NULL,0,0,NULL,0,NULL),(34,2,'telephone',NULL,NULL,'static',NULL,NULL,'text','Phone Number',NULL,NULL,1,0,NULL,0,NULL),(35,2,'fax',NULL,NULL,'static',NULL,NULL,'text','Fax',NULL,NULL,0,0,NULL,0,NULL),(36,2,'vat_id',NULL,NULL,'static',NULL,NULL,'text','VAT number',NULL,NULL,0,0,NULL,0,NULL),(37,2,'vat_is_valid',NULL,NULL,'static',NULL,NULL,'text','VAT number validity',NULL,NULL,0,0,NULL,0,NULL),(38,2,'vat_request_id',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request ID',NULL,NULL,0,0,NULL,0,NULL),(39,2,'vat_request_date',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request date',NULL,NULL,0,0,NULL,0,NULL),(40,2,'vat_request_success',NULL,NULL,'static',NULL,NULL,'text','VAT number validation request success',NULL,NULL,0,0,NULL,0,NULL),(41,1,'updated_at',NULL,NULL,'static',NULL,NULL,'date','Updated At',NULL,NULL,0,0,NULL,0,NULL),(42,3,'name',NULL,NULL,'varchar',NULL,NULL,'text','Name',NULL,NULL,1,0,NULL,0,NULL),(43,3,'is_active',NULL,NULL,'int',NULL,NULL,'select','Is Active',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',1,0,NULL,0,NULL),(44,3,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,0,0,NULL,0,NULL),(45,3,'image',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Image','varchar',NULL,NULL,'image','Image',NULL,NULL,0,0,NULL,0,NULL),(46,3,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Page Title',NULL,NULL,0,0,NULL,0,NULL),(47,3,'meta_keywords',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),(48,3,'meta_description',NULL,NULL,'text',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,NULL),(49,3,'display_mode',NULL,NULL,'varchar',NULL,NULL,'select','Display Mode',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Mode',0,0,NULL,0,NULL),(50,3,'landing_page',NULL,NULL,'int',NULL,NULL,'select','CMS Block',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Page',0,0,NULL,0,NULL),(51,3,'is_anchor',NULL,NULL,'int',NULL,NULL,'select','Is Anchor',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(52,3,'path',NULL,NULL,'static',NULL,NULL,'text','Path',NULL,NULL,0,0,NULL,0,NULL),(53,3,'position',NULL,NULL,'static',NULL,NULL,'text','Position',NULL,NULL,0,0,NULL,0,NULL),(54,3,'all_children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(55,3,'path_in_store',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(56,3,'children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(57,3,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','Custom Design',NULL,'Magento\\Theme\\Model\\Theme\\Source\\Theme',0,0,NULL,0,NULL),(58,3,'custom_design_from','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Frontend\\Datetime','date','Active From',NULL,NULL,0,0,NULL,0,NULL),(59,3,'custom_design_to',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),(60,3,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Page Layout',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(61,3,'custom_layout_update',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate','text',NULL,NULL,'textarea','Custom Layout Update',NULL,NULL,0,0,NULL,0,NULL),(62,3,'level',NULL,NULL,'static',NULL,NULL,'text','Level',NULL,NULL,0,0,NULL,0,NULL),(63,3,'children_count',NULL,NULL,'static',NULL,NULL,'text','Children Count',NULL,NULL,0,0,NULL,0,NULL),(64,3,'available_sort_by',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby','text',NULL,NULL,'multiselect','Available Product Listing Sort By',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby',1,0,NULL,0,NULL),(65,3,'default_sort_by',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Backend\\Sortby','varchar',NULL,NULL,'select','Default Product Listing Sort By',NULL,'Magento\\Catalog\\Model\\Category\\Attribute\\Source\\Sortby',1,0,NULL,0,NULL),(66,3,'include_in_menu',NULL,NULL,'int',NULL,NULL,'select','Include in Navigation Menu',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',1,0,'1',0,NULL),(67,3,'custom_use_parent_settings',NULL,NULL,'int',NULL,NULL,'select','Use Parent Category Settings',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(68,3,'custom_apply_to_products',NULL,NULL,'int',NULL,NULL,'select','Apply To Products',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL),(69,3,'filter_price_range',NULL,NULL,'decimal',NULL,NULL,'text','Layered Navigation Price Step',NULL,NULL,0,0,NULL,0,NULL),(70,4,'name',NULL,NULL,'varchar',NULL,NULL,'text','Name','validate-length maximum-length-255',NULL,1,0,NULL,0,NULL),(71,4,'sku',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Sku','static',NULL,NULL,'text','SKU','validate-length maximum-length-64',NULL,1,0,NULL,1,NULL),(72,4,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,0,0,NULL,0,NULL),(73,4,'short_description',NULL,NULL,'text',NULL,NULL,'textarea','Short Description',NULL,NULL,0,0,NULL,0,NULL),(74,4,'price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Price',NULL,NULL,1,0,NULL,0,NULL),(75,4,'special_price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Special Price',NULL,NULL,0,0,NULL,0,NULL),(76,4,'special_from_date',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Special Price From Date',NULL,NULL,0,0,NULL,0,NULL),(77,4,'special_to_date',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Special Price To Date',NULL,NULL,0,0,NULL,0,NULL),(78,4,'cost',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Cost',NULL,NULL,0,1,NULL,0,NULL),(79,4,'weight',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Weight','decimal',NULL,NULL,'weight','Weight',NULL,NULL,0,0,NULL,0,NULL),(80,4,'manufacturer',NULL,NULL,'int',NULL,NULL,'select','Manufacturer',NULL,NULL,0,1,NULL,0,NULL),(81,4,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Meta Title',NULL,NULL,0,0,NULL,0,NULL),(82,4,'meta_keyword',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),(83,4,'meta_description',NULL,NULL,'varchar',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,'Maximum 255 chars'),(84,4,'image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Base Image',NULL,NULL,0,0,NULL,0,NULL),(85,4,'small_image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Small Image',NULL,NULL,0,0,NULL,0,NULL),(86,4,'thumbnail',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Thumbnail',NULL,NULL,0,0,NULL,0,NULL),(87,4,'media_gallery',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Media','varchar',NULL,NULL,'gallery','Media Gallery',NULL,NULL,0,0,NULL,0,NULL),(88,4,'old_id',NULL,NULL,'int',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(89,4,'tier_price',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Tierprice','decimal',NULL,NULL,'text','Tier Price',NULL,NULL,0,0,NULL,0,NULL),(90,4,'color',NULL,NULL,'int',NULL,NULL,'select','Color',NULL,NULL,0,1,NULL,0,NULL),(91,4,'news_from_date',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Set Product as New from Date',NULL,NULL,0,0,NULL,0,NULL),(92,4,'news_to_date',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Set Product as New to Date',NULL,NULL,0,0,NULL,0,NULL),(93,4,'gallery',NULL,NULL,'varchar',NULL,NULL,'gallery','Image Gallery',NULL,NULL,0,0,NULL,0,NULL),(94,4,'status',NULL,NULL,'int',NULL,NULL,'select','Status',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Status',0,0,'1',0,NULL),(95,4,'minimal_price',NULL,NULL,'decimal',NULL,NULL,'price','Minimal Price',NULL,NULL,0,0,NULL,0,NULL),(96,4,'visibility',NULL,NULL,'int',NULL,NULL,'select','Visibility',NULL,'Magento\\Catalog\\Model\\Product\\Visibility',0,0,'4',0,NULL),(97,4,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','Custom Design',NULL,'Magento\\Theme\\Model\\Theme\\Source\\Theme',0,0,NULL,0,NULL),(98,4,'custom_design_from',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Startdate','datetime',NULL,NULL,'date','Active From',NULL,NULL,0,0,NULL,0,NULL),(99,4,'custom_design_to',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),(100,4,'custom_layout_update',NULL,'Magento\\Catalog\\Model\\Attribute\\Backend\\Customlayoutupdate','text',NULL,NULL,'textarea','Custom Layout Update',NULL,NULL,0,0,NULL,0,NULL),(101,4,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Page Layout',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Layout',0,0,NULL,0,NULL),(102,4,'category_ids',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Category','static',NULL,NULL,'text','Categories',NULL,NULL,0,0,NULL,0,NULL),(103,4,'options_container',NULL,NULL,'varchar',NULL,NULL,'select','Display Product Options In',NULL,'Magento\\Catalog\\Model\\Entity\\Product\\Attribute\\Design\\Options\\Container',0,0,'container2',0,NULL),(104,4,'required_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(105,4,'has_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(106,4,'image_label',NULL,NULL,'varchar',NULL,NULL,'text','Image Label',NULL,NULL,0,0,NULL,0,NULL),(107,4,'small_image_label',NULL,NULL,'varchar',NULL,NULL,'text','Small Image Label',NULL,NULL,0,0,NULL,0,NULL),(108,4,'thumbnail_label',NULL,NULL,'varchar',NULL,NULL,'text','Thumbnail Label',NULL,NULL,0,0,NULL,0,NULL),(109,4,'created_at',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Time\\Created','static',NULL,NULL,'text',NULL,NULL,NULL,1,0,NULL,0,NULL),(110,4,'updated_at',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Backend\\Time\\Updated','static',NULL,NULL,'text',NULL,NULL,NULL,1,0,NULL,0,NULL),(111,4,'country_of_manufacture',NULL,NULL,'varchar',NULL,NULL,'select','Country of Manufacture',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Source\\Countryofmanufacture',0,0,NULL,0,NULL),(112,4,'quantity_and_stock_status',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Stock','int',NULL,NULL,'select','Quantity',NULL,'Magento\\CatalogInventory\\Model\\Source\\Stock',0,0,'1',0,NULL),(113,3,'url_key',NULL,NULL,'varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),(114,3,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(115,4,'url_key',NULL,NULL,'varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),(116,4,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(117,4,'msrp',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Price','decimal',NULL,NULL,'price','Manufacturer\'s Suggested Retail Price',NULL,NULL,0,0,NULL,0,NULL),(118,4,'msrp_display_actual_price_type',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean','varchar',NULL,NULL,'select','Display Actual Price',NULL,'Magento\\Msrp\\Model\\Product\\Attribute\\Source\\Type\\Price',0,0,'0',0,NULL),(119,4,'price_type',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,0,NULL),(120,4,'sku_type',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,0,NULL),(121,4,'weight_type',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,0,NULL),(122,4,'price_view',NULL,NULL,'int',NULL,NULL,'select','Price View',NULL,'Magento\\Bundle\\Model\\Product\\Attribute\\Source\\Price\\View',1,0,NULL,0,NULL),(123,4,'shipment_type',NULL,NULL,'int',NULL,NULL,NULL,'Shipment',NULL,NULL,1,0,NULL,0,NULL),(124,4,'links_purchased_separately',NULL,NULL,'int',NULL,NULL,NULL,'Links can be purchased separately',NULL,NULL,1,0,NULL,0,NULL),(125,4,'samples_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Samples title',NULL,NULL,1,0,NULL,0,NULL),(126,4,'links_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Links title',NULL,NULL,1,0,NULL,0,NULL),(127,4,'links_exist',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'0',0,NULL),(128,4,'swatch_image',NULL,NULL,'varchar',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Frontend\\Image','media_image','Swatch Image',NULL,NULL,0,0,NULL,0,NULL),(129,4,'tax_class_id',NULL,NULL,'int',NULL,NULL,'select','Tax Class',NULL,'Magento\\Tax\\Model\\TaxClass\\Source\\Product',0,0,'2',0,NULL),(130,4,'gift_message_available',NULL,'Magento\\Catalog\\Model\\Product\\Attribute\\Backend\\Boolean','varchar',NULL,NULL,'select','Allow Gift Message',NULL,'Magento\\Eav\\Model\\Entity\\Attribute\\Source\\Boolean',0,0,NULL,0,NULL);
/*!40000 ALTER TABLE `grocery_bag_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_attribute_group`
--

DROP TABLE IF EXISTS `grocery_bag_eav_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Default Id',
  `attribute_group_code` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Code',
  `tab_group_code` varchar(255) DEFAULT NULL COMMENT 'Tab Group Code',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_ATTRIBUTE_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  KEY `EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  CONSTRAINT `EAV_ATTR_GROUP_ATTR_SET_ID_EAV_ATTR_SET_ATTR_SET_ID` FOREIGN KEY (`attribute_set_id`) REFERENCES `grocery_bag_eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_attribute_group`
--

LOCK TABLES `grocery_bag_eav_attribute_group` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_attribute_group` DISABLE KEYS */;
INSERT INTO `grocery_bag_eav_attribute_group` VALUES (1,1,'General',1,1,NULL,NULL),(2,2,'General',1,1,NULL,NULL),(3,3,'General',10,1,NULL,NULL),(4,3,'General Information',2,0,NULL,NULL),(5,3,'Display Settings',20,0,NULL,NULL),(6,3,'Custom Design',30,0,NULL,NULL),(7,4,'Product Details',10,1,'product-details','basic'),(8,4,'Advanced Pricing',40,0,'advanced-pricing','advanced'),(9,4,'Search Engine Optimization',30,0,'search-engine-optimization','basic'),(10,4,'Image Management',20,0,'image-management','basic'),(11,4,'Design',50,0,'design','advanced'),(12,4,'Autosettings',60,0,'autosettings','advanced'),(13,5,'General',1,1,NULL,NULL),(14,6,'General',1,1,NULL,NULL),(15,7,'General',1,1,NULL,NULL),(16,8,'General',1,1,NULL,NULL);
/*!40000 ALTER TABLE `grocery_bag_eav_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_attribute_label`
--

DROP TABLE IF EXISTS `grocery_bag_eav_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_attribute_label` (
  `attribute_label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`attribute_label_id`),
  KEY `EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  KEY `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`),
  CONSTRAINT `EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTRIBUTE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_attribute_label`
--

LOCK TABLES `grocery_bag_eav_attribute_label` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_eav_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_attribute_option`
--

DROP TABLE IF EXISTS `grocery_bag_eav_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_attribute_option`
--

LOCK TABLES `grocery_bag_eav_attribute_option` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_attribute_option` DISABLE KEYS */;
INSERT INTO `grocery_bag_eav_attribute_option` VALUES (1,20,0),(2,20,1),(3,20,3);
/*!40000 ALTER TABLE `grocery_bag_eav_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_attribute_option_swatch`
--

DROP TABLE IF EXISTS `grocery_bag_eav_attribute_option_swatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_attribute_option_swatch` (
  `swatch_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Swatch ID',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `type` smallint(5) unsigned NOT NULL COMMENT 'Swatch type: 0 - text, 1 - visual color, 2 - visual image',
  `value` varchar(255) DEFAULT NULL COMMENT 'Swatch Value',
  PRIMARY KEY (`swatch_id`),
  UNIQUE KEY `GROCERY_BAG_EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_OPTION_ID` (`store_id`,`option_id`),
  KEY `GROCERY_BAG_EAV_ATTRIBUTE_OPTION_SWATCH_SWATCH_ID` (`swatch_id`),
  KEY `GROCERY_BAG_EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` (`option_id`),
  CONSTRAINT `GROCERY_BAG_EAV_ATTRIBUTE_OPTION_SWATCH_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `GROCERY_BAG_EAV_ATTR_OPT_SWATCH_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `grocery_bag_eav_attribute_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magento Swatches table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_attribute_option_swatch`
--

LOCK TABLES `grocery_bag_eav_attribute_option_swatch` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_attribute_option_swatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_eav_attribute_option_swatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_attribute_option_value`
--

DROP TABLE IF EXISTS `grocery_bag_eav_attribute_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  KEY `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ATTR_OPT_VAL_OPT_ID_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `grocery_bag_eav_attribute_option` (`option_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_attribute_option_value`
--

LOCK TABLES `grocery_bag_eav_attribute_option_value` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_attribute_option_value` DISABLE KEYS */;
INSERT INTO `grocery_bag_eav_attribute_option_value` VALUES (1,1,0,'Male'),(2,2,0,'Female'),(3,3,0,'Not Specified');
/*!40000 ALTER TABLE `grocery_bag_eav_attribute_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_attribute_set`
--

DROP TABLE IF EXISTS `grocery_bag_eav_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  KEY `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`),
  CONSTRAINT `EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `grocery_bag_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Set';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_attribute_set`
--

LOCK TABLES `grocery_bag_eav_attribute_set` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_attribute_set` DISABLE KEYS */;
INSERT INTO `grocery_bag_eav_attribute_set` VALUES (1,1,'Default',2),(2,2,'Default',2),(3,3,'Default',1),(4,4,'Default',1),(5,5,'Default',1),(6,6,'Default',1),(7,7,'Default',1),(8,8,'Default',1);
/*!40000 ALTER TABLE `grocery_bag_eav_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_entity`
--

DROP TABLE IF EXISTS `grocery_bag_eav_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Entity Active',
  PRIMARY KEY (`entity_id`),
  KEY `EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `grocery_bag_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_entity`
--

LOCK TABLES `grocery_bag_eav_entity` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_eav_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_entity_attribute`
--

DROP TABLE IF EXISTS `grocery_bag_eav_entity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  KEY `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTT_ATTR_ATTR_GROUP_ID_EAV_ATTR_GROUP_ATTR_GROUP_ID` FOREIGN KEY (`attribute_group_id`) REFERENCES `grocery_bag_eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_entity_attribute`
--

LOCK TABLES `grocery_bag_eav_entity_attribute` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_entity_attribute` DISABLE KEYS */;
INSERT INTO `grocery_bag_eav_entity_attribute` VALUES (1,1,1,1,1,10),(2,1,1,1,2,20),(3,1,1,1,3,20),(4,1,1,1,4,30),(5,1,1,1,5,40),(6,1,1,1,6,50),(7,1,1,1,7,60),(8,1,1,1,8,70),(9,1,1,1,9,80),(10,1,1,1,10,25),(11,1,1,1,11,90),(12,1,1,1,12,81),(13,1,1,1,13,115),(14,1,1,1,14,120),(15,1,1,1,15,82),(16,1,1,1,16,83),(17,1,1,1,17,100),(18,1,1,1,18,85),(19,1,1,1,19,86),(20,1,1,1,20,110),(21,1,1,1,21,121),(22,2,2,2,22,10),(23,2,2,2,23,20),(24,2,2,2,24,30),(25,2,2,2,25,40),(26,2,2,2,26,50),(27,2,2,2,27,60),(28,2,2,2,28,70),(29,2,2,2,29,80),(30,2,2,2,30,90),(31,2,2,2,31,100),(32,2,2,2,32,100),(33,2,2,2,33,110),(34,2,2,2,34,120),(35,2,2,2,35,130),(36,2,2,2,36,131),(37,2,2,2,37,132),(38,2,2,2,38,133),(39,2,2,2,39,134),(40,2,2,2,40,135),(41,1,1,1,41,87),(42,3,3,4,42,1),(43,3,3,4,43,2),(44,3,3,4,44,4),(45,3,3,4,45,5),(46,3,3,4,46,6),(47,3,3,4,47,7),(48,3,3,4,48,8),(49,3,3,5,49,10),(50,3,3,5,50,20),(51,3,3,5,51,30),(52,3,3,4,52,12),(53,3,3,4,53,13),(54,3,3,4,54,14),(55,3,3,4,55,15),(56,3,3,4,56,16),(57,3,3,6,57,10),(58,3,3,6,58,30),(59,3,3,6,59,40),(60,3,3,6,60,50),(61,3,3,6,61,60),(62,3,3,4,62,24),(63,3,3,4,63,25),(64,3,3,5,64,40),(65,3,3,5,65,50),(66,3,3,4,66,10),(67,3,3,6,67,5),(68,3,3,6,68,6),(69,3,3,5,69,51),(70,4,4,7,70,10),(71,4,4,7,71,20),(72,4,4,7,72,90),(73,4,4,12,73,0),(74,4,4,7,74,30),(75,4,4,8,75,3),(76,4,4,8,76,4),(77,4,4,8,77,5),(78,4,4,8,78,6),(79,4,4,7,79,70),(80,4,4,9,81,20),(81,4,4,9,82,30),(82,4,4,9,83,40),(83,4,4,7,84,50),(84,4,4,10,85,2),(85,4,4,10,86,3),(86,4,4,10,87,4),(87,4,4,7,88,6),(88,4,4,8,89,7),(89,4,4,12,91,30),(90,4,4,12,92,40),(91,4,4,10,93,5),(92,4,4,7,94,100),(93,4,4,8,95,8),(94,4,4,12,96,20),(95,4,4,11,97,1),(96,4,4,11,98,2),(97,4,4,11,99,3),(98,4,4,11,100,4),(99,4,4,11,101,5),(100,4,4,7,102,80),(101,4,4,11,103,6),(102,4,4,7,104,14),(103,4,4,7,105,15),(104,4,4,7,106,16),(105,4,4,7,107,17),(106,4,4,7,108,18),(107,4,4,7,109,19),(108,4,4,7,110,20),(109,4,4,12,111,50),(110,4,4,7,112,60),(111,3,3,4,113,3),(112,3,3,4,114,17),(113,4,4,9,115,10),(114,4,4,7,116,11),(115,4,4,8,117,9),(116,4,4,8,118,10),(117,4,4,7,119,101),(118,4,4,7,120,102),(119,4,4,7,121,103),(120,4,4,8,122,11),(121,4,4,7,123,104),(122,4,4,7,124,105),(123,4,4,7,125,106),(124,4,4,7,126,107),(125,4,4,7,127,108),(126,4,4,7,128,3),(127,4,4,7,129,40),(128,4,4,12,130,60);
/*!40000 ALTER TABLE `grocery_bag_eav_entity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_entity_datetime`
--

DROP TABLE IF EXISTS `grocery_bag_eav_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_DATETIME_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DATETIME_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTT_DTIME_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `grocery_bag_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_entity_datetime`
--

LOCK TABLES `grocery_bag_eav_entity_datetime` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_eav_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_entity_decimal`
--

DROP TABLE IF EXISTS `grocery_bag_eav_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_DECIMAL_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `grocery_bag_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_DECIMAL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_entity_decimal`
--

LOCK TABLES `grocery_bag_eav_entity_decimal` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_eav_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_entity_int`
--

DROP TABLE IF EXISTS `grocery_bag_eav_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_INT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_INT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `grocery_bag_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_INT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_entity_int`
--

LOCK TABLES `grocery_bag_eav_entity_int` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_eav_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_entity_store`
--

DROP TABLE IF EXISTS `grocery_bag_eav_entity_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Store Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented Id',
  PRIMARY KEY (`entity_store_id`),
  KEY `EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_STORE_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `grocery_bag_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_entity_store`
--

LOCK TABLES `grocery_bag_eav_entity_store` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_entity_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_eav_entity_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_entity_text`
--

DROP TABLE IF EXISTS `grocery_bag_eav_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `EAV_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_ENTITY_TEXT_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_TEXT_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `grocery_bag_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_TEXT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_entity_text`
--

LOCK TABLES `grocery_bag_eav_entity_text` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_eav_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_entity_type`
--

DROP TABLE IF EXISTS `grocery_bag_eav_entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Type Id',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity Id Field',
  `is_data_sharing` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Attribute Set Id',
  `increment_model` varchar(255) DEFAULT NULL COMMENT 'Increment Model',
  `increment_per_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Increment Per Store',
  `increment_pad_length` smallint(5) unsigned NOT NULL DEFAULT '8' COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT NULL COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection',
  PRIMARY KEY (`entity_type_id`),
  KEY `EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_entity_type`
--

LOCK TABLES `grocery_bag_eav_entity_type` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_entity_type` DISABLE KEYS */;
INSERT INTO `grocery_bag_eav_entity_type` VALUES (1,'customer','Magento\\Customer\\Model\\ResourceModel\\Customer','Magento\\Customer\\Model\\Attribute','customer_entity',NULL,NULL,1,'default',1,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',0,8,'0','customer_eav_attribute','Magento\\Customer\\Model\\ResourceModel\\Attribute\\Collection'),(2,'customer_address','Magento\\Customer\\Model\\ResourceModel\\Address','Magento\\Customer\\Model\\Attribute','customer_address_entity',NULL,NULL,1,'default',2,NULL,0,8,'0','customer_eav_attribute','Magento\\Customer\\Model\\ResourceModel\\Address\\Attribute\\Collection'),(3,'catalog_category','Magento\\Catalog\\Model\\ResourceModel\\Category','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','catalog_category_entity',NULL,NULL,1,'default',3,NULL,0,8,'0','catalog_eav_attribute','Magento\\Catalog\\Model\\ResourceModel\\Category\\Attribute\\Collection'),(4,'catalog_product','Magento\\Catalog\\Model\\ResourceModel\\Product','Magento\\Catalog\\Model\\ResourceModel\\Eav\\Attribute','catalog_product_entity',NULL,NULL,1,'default',4,NULL,0,8,'0','catalog_eav_attribute','Magento\\Catalog\\Model\\ResourceModel\\Product\\Attribute\\Collection'),(5,'order','Magento\\Sales\\Model\\ResourceModel\\Order',NULL,'sales_order',NULL,NULL,1,'default',5,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(6,'invoice','Magento\\Sales\\Model\\ResourceModel\\Order\\Invoice',NULL,'sales_invoice',NULL,NULL,1,'default',6,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(7,'creditmemo','Magento\\Sales\\Model\\ResourceModel\\Order\\Creditmemo',NULL,'sales_creditmemo',NULL,NULL,1,'default',7,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL),(8,'shipment','Magento\\Sales\\Model\\ResourceModel\\Order\\Shipment',NULL,'sales_shipment',NULL,NULL,1,'default',8,'Magento\\Eav\\Model\\Entity\\Increment\\NumericValue',1,8,'0',NULL,NULL);
/*!40000 ALTER TABLE `grocery_bag_eav_entity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_entity_varchar`
--

DROP TABLE IF EXISTS `grocery_bag_eav_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `EAV_ENTITY_VARCHAR_ENTITY_ID_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_eav_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_EAV_ENTITY_TYPE_ENTITY_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `grocery_bag_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_ENTITY_VARCHAR_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_entity_varchar`
--

LOCK TABLES `grocery_bag_eav_entity_varchar` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_eav_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_form_element`
--

DROP TABLE IF EXISTS `grocery_bag_eav_form_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_form_element` (
  `element_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Element Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `fieldset_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Fieldset Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  KEY `EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  KEY `EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `EAV_FORM_ELEMENT_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_ELEMENT_FIELDSET_ID_EAV_FORM_FIELDSET_FIELDSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `grocery_bag_eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL,
  CONSTRAINT `EAV_FORM_ELEMENT_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `grocery_bag_eav_form_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='Eav Form Element';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_form_element`
--

LOCK TABLES `grocery_bag_eav_form_element` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_form_element` DISABLE KEYS */;
INSERT INTO `grocery_bag_eav_form_element` VALUES (1,1,NULL,23,0),(2,1,NULL,25,1),(3,1,NULL,27,2),(4,1,NULL,9,3),(5,1,NULL,28,4),(6,1,NULL,29,5),(7,1,NULL,31,6),(8,1,NULL,33,7),(9,1,NULL,30,8),(10,1,NULL,34,9),(11,1,NULL,35,10),(12,2,NULL,23,0),(13,2,NULL,25,1),(14,2,NULL,27,2),(15,2,NULL,9,3),(16,2,NULL,28,4),(17,2,NULL,29,5),(18,2,NULL,31,6),(19,2,NULL,33,7),(20,2,NULL,30,8),(21,2,NULL,34,9),(22,2,NULL,35,10),(23,3,NULL,23,0),(24,3,NULL,25,1),(25,3,NULL,27,2),(26,3,NULL,28,3),(27,3,NULL,29,4),(28,3,NULL,31,5),(29,3,NULL,33,6),(30,3,NULL,30,7),(31,3,NULL,34,8),(32,3,NULL,35,9),(33,4,NULL,23,0),(34,4,NULL,25,1),(35,4,NULL,27,2),(36,4,NULL,28,3),(37,4,NULL,29,4),(38,4,NULL,31,5),(39,4,NULL,33,6),(40,4,NULL,30,7),(41,4,NULL,34,8),(42,4,NULL,35,9);
/*!40000 ALTER TABLE `grocery_bag_eav_form_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_form_fieldset`
--

DROP TABLE IF EXISTS `grocery_bag_eav_form_fieldset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_form_fieldset` (
  `fieldset_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Fieldset Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`),
  CONSTRAINT `EAV_FORM_FIELDSET_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `grocery_bag_eav_form_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_form_fieldset`
--

LOCK TABLES `grocery_bag_eav_form_fieldset` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_form_fieldset` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_eav_form_fieldset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_form_fieldset_label`
--

DROP TABLE IF EXISTS `grocery_bag_eav_form_fieldset_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_form_fieldset_label` (
  `fieldset_id` smallint(5) unsigned NOT NULL COMMENT 'Fieldset Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_FORM_FIELDSET_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_FSET_LBL_FSET_ID_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `grocery_bag_eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_form_fieldset_label`
--

LOCK TABLES `grocery_bag_eav_form_fieldset_label` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_form_fieldset_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_eav_form_fieldset_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_form_type`
--

DROP TABLE IF EXISTS `grocery_bag_eav_form_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_form_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  KEY `EAV_FORM_TYPE_STORE_ID` (`store_id`),
  CONSTRAINT `EAV_FORM_TYPE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Eav Form Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_form_type`
--

LOCK TABLES `grocery_bag_eav_form_type` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_form_type` DISABLE KEYS */;
INSERT INTO `grocery_bag_eav_form_type` VALUES (1,'checkout_onepage_register','checkout_onepage_register',1,'',0),(2,'checkout_onepage_register_guest','checkout_onepage_register_guest',1,'',0),(3,'checkout_onepage_billing_address','checkout_onepage_billing_address',1,'',0),(4,'checkout_onepage_shipping_address','checkout_onepage_shipping_address',1,'',0);
/*!40000 ALTER TABLE `grocery_bag_eav_form_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_eav_form_type_entity`
--

DROP TABLE IF EXISTS `grocery_bag_eav_form_type_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_eav_form_type_entity` (
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `entity_type_id` smallint(5) unsigned NOT NULL COMMENT 'Entity Type Id',
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  CONSTRAINT `EAV_FORM_TYPE_ENTITY_TYPE_ID_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `grocery_bag_eav_form_type` (`type_id`) ON DELETE CASCADE,
  CONSTRAINT `EAV_FORM_TYPE_ENTT_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `grocery_bag_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_eav_form_type_entity`
--

LOCK TABLES `grocery_bag_eav_form_type_entity` WRITE;
/*!40000 ALTER TABLE `grocery_bag_eav_form_type_entity` DISABLE KEYS */;
INSERT INTO `grocery_bag_eav_form_type_entity` VALUES (1,1),(1,2),(2,1),(2,2),(3,2),(4,2);
/*!40000 ALTER TABLE `grocery_bag_eav_form_type_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_email_template`
--

DROP TABLE IF EXISTS `grocery_bag_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_email_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text COMMENT 'Templste Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Date of Template Creation',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text COMMENT 'Original Template Variables',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  KEY `EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_email_template`
--

LOCK TABLES `grocery_bag_email_template` WRITE;
/*!40000 ALTER TABLE `grocery_bag_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_flag`
--

DROP TABLE IF EXISTS `grocery_bag_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_flag` (
  `flag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL COMMENT 'Flag Code',
  `state` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag State',
  `flag_data` text COMMENT 'Flag Data',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Last Flag Update',
  PRIMARY KEY (`flag_id`),
  KEY `FLAG_LAST_UPDATE` (`last_update`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Flag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_flag`
--

LOCK TABLES `grocery_bag_flag` WRITE;
/*!40000 ALTER TABLE `grocery_bag_flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_gift_message`
--

DROP TABLE IF EXISTS `grocery_bag_gift_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_gift_message` (
  `gift_message_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Registrant',
  `message` text COMMENT 'Message',
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gift Message';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_gift_message`
--

LOCK TABLES `grocery_bag_gift_message` WRITE;
/*!40000 ALTER TABLE `grocery_bag_gift_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_gift_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_googleoptimizer_code`
--

DROP TABLE IF EXISTS `grocery_bag_googleoptimizer_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_googleoptimizer_code` (
  `code_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Google experiment code id',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Optimized entity id product id or catalog id',
  `entity_type` varchar(50) DEFAULT NULL COMMENT 'Optimized entity type',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store id',
  `experiment_script` text COMMENT 'Google experiment script',
  PRIMARY KEY (`code_id`),
  UNIQUE KEY `GOOGLEOPTIMIZER_CODE_STORE_ID_ENTITY_ID_ENTITY_TYPE` (`store_id`,`entity_id`,`entity_type`),
  CONSTRAINT `GOOGLEOPTIMIZER_CODE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Experiment code';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_googleoptimizer_code`
--

LOCK TABLES `grocery_bag_googleoptimizer_code` WRITE;
/*!40000 ALTER TABLE `grocery_bag_googleoptimizer_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_googleoptimizer_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_import_history`
--

DROP TABLE IF EXISTS `grocery_bag_import_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_import_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'History record Id',
  `started_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Started at',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `imported_file` varchar(255) DEFAULT NULL COMMENT 'Imported file',
  `execution_time` varchar(255) DEFAULT NULL COMMENT 'Execution time',
  `summary` varchar(255) DEFAULT NULL COMMENT 'Summary',
  `error_file` varchar(255) NOT NULL COMMENT 'Imported file with errors',
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import history table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_import_history`
--

LOCK TABLES `grocery_bag_import_history` WRITE;
/*!40000 ALTER TABLE `grocery_bag_import_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_import_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_importexport_importdata`
--

DROP TABLE IF EXISTS `grocery_bag_importexport_importdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_importexport_importdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext COMMENT 'Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import Data Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_importexport_importdata`
--

LOCK TABLES `grocery_bag_importexport_importdata` WRITE;
/*!40000 ALTER TABLE `grocery_bag_importexport_importdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_importexport_importdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_indexer_state`
--

DROP TABLE IF EXISTS `grocery_bag_indexer_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_indexer_state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Indexer State Id',
  `indexer_id` varchar(255) DEFAULT NULL COMMENT 'Indexer Id',
  `status` varchar(16) DEFAULT 'invalid' COMMENT 'Indexer Status',
  `updated` datetime DEFAULT NULL COMMENT 'Indexer Status',
  `hash_config` varchar(32) NOT NULL COMMENT 'Hash of indexer config',
  PRIMARY KEY (`state_id`),
  KEY `INDEXER_STATE_INDEXER_ID` (`indexer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Indexer State';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_indexer_state`
--

LOCK TABLES `grocery_bag_indexer_state` WRITE;
/*!40000 ALTER TABLE `grocery_bag_indexer_state` DISABLE KEYS */;
INSERT INTO `grocery_bag_indexer_state` VALUES (1,'customer_grid','valid','2015-10-15 12:33:48','9b4506442a512a649dde7c6f25924134'),(2,'catalog_category_product','invalid','2015-10-15 12:33:48','86038392fe878acd22d5650a99b4f9b3'),(3,'catalog_product_category','invalid','2015-10-15 12:33:48','8fd6f9a1ec8741ce1c7984b549915e8e'),(4,'catalog_product_price','invalid','2015-10-15 12:33:48','0dce29088c0563479f66b2a70ebf152b'),(5,'catalog_product_attribute','invalid','2015-10-15 12:33:48','5ee6fe2540126b9b2c90c53fe25c4d9a'),(6,'cataloginventory_stock','invalid','2015-10-15 12:33:48','030021373629a9e2b3b8ffcc92be9483'),(7,'catalogrule_rule','invalid','2015-10-15 12:33:48','63676f01f658a0964f150347a6596a0a'),(8,'catalogrule_product','invalid','2015-10-15 12:33:48','f9512548ab97beef43ea393d4a6dc545'),(9,'catalogsearch_fulltext','valid','2015-10-15 12:34:08','a959fbd517e02dc6c79ef261cc983c97');
/*!40000 ALTER TABLE `grocery_bag_indexer_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_integration`
--

DROP TABLE IF EXISTS `grocery_bag_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_integration` (
  `integration_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Integration ID',
  `name` varchar(255) NOT NULL COMMENT 'Integration name is displayed in the admin interface',
  `email` varchar(255) NOT NULL COMMENT 'Email address of the contact person',
  `endpoint` varchar(255) DEFAULT NULL COMMENT 'Endpoint for posting consumer credentials',
  `status` smallint(5) unsigned NOT NULL COMMENT 'Integration status',
  `consumer_id` int(10) unsigned DEFAULT NULL COMMENT 'Oauth consumer',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Update Time',
  `setup_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Integration type - manual or config file',
  `identity_link_url` varchar(255) DEFAULT NULL COMMENT 'Identity linking Url',
  PRIMARY KEY (`integration_id`),
  UNIQUE KEY `GROCERY_BAG_INTEGRATION_NAME` (`name`),
  UNIQUE KEY `GROCERY_BAG_INTEGRATION_CONSUMER_ID` (`consumer_id`),
  CONSTRAINT `INTEGRATION_CONSUMER_ID_GROCERY_BAG_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `grocery_bag_oauth_consumer` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='grocery_bag_integration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_integration`
--

LOCK TABLES `grocery_bag_integration` WRITE;
/*!40000 ALTER TABLE `grocery_bag_integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_layout_link`
--

DROP TABLE IF EXISTS `grocery_bag_layout_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Defines whether Layout Update is Temporary',
  PRIMARY KEY (`layout_link_id`),
  KEY `LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`),
  KEY `LAYOUT_LINK_STORE_ID_THEME_ID_LAYOUT_UPDATE_ID_IS_TEMPORARY` (`store_id`,`theme_id`,`layout_update_id`,`is_temporary`),
  KEY `LAYOUT_LINK_THEME_ID_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `LAYOUT_LINK_LAYOUT_UPDATE_ID_LAYOUT_UPDATE_LAYOUT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `grocery_bag_layout_update` (`layout_update_id`) ON DELETE CASCADE,
  CONSTRAINT `LAYOUT_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `LAYOUT_LINK_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `grocery_bag_theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_layout_link`
--

LOCK TABLES `grocery_bag_layout_link` WRITE;
/*!40000 ALTER TABLE `grocery_bag_layout_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_layout_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_layout_update`
--

DROP TABLE IF EXISTS `grocery_bag_layout_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Layout Update Id',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text COMMENT 'Xml',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last Update Timestamp',
  PRIMARY KEY (`layout_update_id`),
  KEY `LAYOUT_UPDATE_HANDLE` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_layout_update`
--

LOCK TABLES `grocery_bag_layout_update` WRITE;
/*!40000 ALTER TABLE `grocery_bag_layout_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_layout_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_mview_state`
--

DROP TABLE IF EXISTS `grocery_bag_mview_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_mview_state` (
  `state_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'View State Id',
  `view_id` varchar(255) DEFAULT NULL COMMENT 'View Id',
  `mode` varchar(16) DEFAULT 'disabled' COMMENT 'View Mode',
  `status` varchar(16) DEFAULT 'idle' COMMENT 'View Status',
  `updated` datetime DEFAULT NULL COMMENT 'View updated time',
  `version_id` int(10) unsigned DEFAULT NULL COMMENT 'View Version Id',
  PRIMARY KEY (`state_id`),
  KEY `MVIEW_STATE_VIEW_ID` (`view_id`),
  KEY `MVIEW_STATE_MODE` (`mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='View State';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_mview_state`
--

LOCK TABLES `grocery_bag_mview_state` WRITE;
/*!40000 ALTER TABLE `grocery_bag_mview_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_mview_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_newsletter_problem`
--

DROP TABLE IF EXISTS `grocery_bag_newsletter_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_newsletter_problem` (
  `problem_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Problem Id',
  `subscriber_id` int(10) unsigned DEFAULT NULL COMMENT 'Subscriber Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `problem_error_code` int(10) unsigned DEFAULT '0' COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text',
  PRIMARY KEY (`problem_id`),
  KEY `NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`),
  CONSTRAINT `NEWSLETTER_PROBLEM_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `grocery_bag_newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `NLTTR_PROBLEM_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `grocery_bag_newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Problems';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_newsletter_problem`
--

LOCK TABLES `grocery_bag_newsletter_problem` WRITE;
/*!40000 ALTER TABLE `grocery_bag_newsletter_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_newsletter_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_newsletter_queue`
--

DROP TABLE IF EXISTS `grocery_bag_newsletter_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_newsletter_queue` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Id',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Template ID',
  `newsletter_type` int(11) DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text COMMENT 'Newsletter Text',
  `newsletter_styles` text COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At',
  PRIMARY KEY (`queue_id`),
  KEY `NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`),
  CONSTRAINT `NEWSLETTER_QUEUE_TEMPLATE_ID_NEWSLETTER_TEMPLATE_TEMPLATE_ID` FOREIGN KEY (`template_id`) REFERENCES `grocery_bag_newsletter_template` (`template_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_newsletter_queue`
--

LOCK TABLES `grocery_bag_newsletter_queue` WRITE;
/*!40000 ALTER TABLE `grocery_bag_newsletter_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_newsletter_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_newsletter_queue_link`
--

DROP TABLE IF EXISTS `grocery_bag_newsletter_queue_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_newsletter_queue_link` (
  `queue_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Link Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `subscriber_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subscriber Id',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At',
  PRIMARY KEY (`queue_link_id`),
  KEY `NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`),
  CONSTRAINT `NEWSLETTER_QUEUE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `grocery_bag_newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `NLTTR_QUEUE_LNK_SUBSCRIBER_ID_NLTTR_SUBSCRIBER_SUBSCRIBER_ID` FOREIGN KEY (`subscriber_id`) REFERENCES `grocery_bag_newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_newsletter_queue_link`
--

LOCK TABLES `grocery_bag_newsletter_queue_link` WRITE;
/*!40000 ALTER TABLE `grocery_bag_newsletter_queue_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_newsletter_queue_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_newsletter_queue_store_link`
--

DROP TABLE IF EXISTS `grocery_bag_newsletter_queue_store_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_newsletter_queue_store_link` (
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`),
  CONSTRAINT `NEWSLETTER_QUEUE_STORE_LINK_QUEUE_ID_NEWSLETTER_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `grocery_bag_newsletter_queue` (`queue_id`) ON DELETE CASCADE,
  CONSTRAINT `NEWSLETTER_QUEUE_STORE_LINK_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Store Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_newsletter_queue_store_link`
--

LOCK TABLES `grocery_bag_newsletter_queue_store_link` WRITE;
/*!40000 ALTER TABLE `grocery_bag_newsletter_queue_store_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_newsletter_queue_store_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_newsletter_subscriber`
--

DROP TABLE IF EXISTS `grocery_bag_newsletter_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_newsletter_subscriber` (
  `subscriber_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Subscriber Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `subscriber_email` varchar(150) DEFAULT NULL COMMENT 'Subscriber Email',
  `subscriber_status` int(11) NOT NULL DEFAULT '0' COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code',
  PRIMARY KEY (`subscriber_id`),
  KEY `NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  KEY `NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`),
  CONSTRAINT `NEWSLETTER_SUBSCRIBER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Subscriber';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_newsletter_subscriber`
--

LOCK TABLES `grocery_bag_newsletter_subscriber` WRITE;
/*!40000 ALTER TABLE `grocery_bag_newsletter_subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_newsletter_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_newsletter_template`
--

DROP TABLE IF EXISTS `grocery_bag_newsletter_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_newsletter_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template ID',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text COMMENT 'Template Text',
  `template_styles` text COMMENT 'Template Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint(5) unsigned DEFAULT '1' COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  PRIMARY KEY (`template_id`),
  KEY `NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  KEY `NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_newsletter_template`
--

LOCK TABLES `grocery_bag_newsletter_template` WRITE;
/*!40000 ALTER TABLE `grocery_bag_newsletter_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_newsletter_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_oauth_consumer`
--

DROP TABLE IF EXISTS `grocery_bag_oauth_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_oauth_consumer` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(32) NOT NULL COMMENT 'Secret code',
  `callback_url` varchar(255) DEFAULT NULL COMMENT 'Callback URL',
  `rejected_callback_url` varchar(255) NOT NULL COMMENT 'Rejected callback URL',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `GROCERY_BAG_OAUTH_CONSUMER_KEY` (`key`),
  UNIQUE KEY `GROCERY_BAG_OAUTH_CONSUMER_SECRET` (`secret`),
  KEY `OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  KEY `OAUTH_CONSUMER_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Consumers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_oauth_consumer`
--

LOCK TABLES `grocery_bag_oauth_consumer` WRITE;
/*!40000 ALTER TABLE `grocery_bag_oauth_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_oauth_nonce`
--

DROP TABLE IF EXISTS `grocery_bag_oauth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int(10) unsigned NOT NULL COMMENT 'Nonce Timestamp',
  `consumer_id` int(10) unsigned NOT NULL COMMENT 'Consumer ID',
  UNIQUE KEY `GROCERY_BAG_OAUTH_NONCE_NONCE_CONSUMER_ID` (`nonce`,`consumer_id`),
  KEY `OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` (`consumer_id`),
  CONSTRAINT `OAUTH_NONCE_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `grocery_bag_oauth_consumer` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Nonce';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_oauth_nonce`
--

LOCK TABLES `grocery_bag_oauth_nonce` WRITE;
/*!40000 ALTER TABLE `grocery_bag_oauth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_oauth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_oauth_token`
--

DROP TABLE IF EXISTS `grocery_bag_oauth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_oauth_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `consumer_id` int(10) unsigned DEFAULT NULL COMMENT 'Oauth Consumer ID',
  `admin_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(32) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` varchar(255) NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token revoked',
  `authorized` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token authorized',
  `user_type` int(11) DEFAULT NULL COMMENT 'User type',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Token creation timestamp',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `GROCERY_BAG_OAUTH_TOKEN_TOKEN` (`token`),
  KEY `GROCERY_BAG_OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`),
  KEY `OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` (`admin_id`),
  KEY `OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` (`customer_id`),
  CONSTRAINT `OAUTH_TOKEN_ADMIN_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `grocery_bag_admin_user` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `OAUTH_TOKEN_CONSUMER_ID_OAUTH_CONSUMER_ENTITY_ID` FOREIGN KEY (`consumer_id`) REFERENCES `grocery_bag_oauth_consumer` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `OAUTH_TOKEN_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='OAuth Tokens';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_oauth_token`
--

LOCK TABLES `grocery_bag_oauth_token` WRITE;
/*!40000 ALTER TABLE `grocery_bag_oauth_token` DISABLE KEYS */;
INSERT INTO `grocery_bag_oauth_token` VALUES (1,NULL,1,NULL,'access','eu0qiq8splqyp4hvrhig7poxxmlcoa9t','hwnvwhryl2kyyi0wstvm3vrrnhkfofsj',NULL,'',0,0,2,'2015-10-15 08:43:43'),(2,NULL,1,NULL,'access','7wyc1pu77v2wpabngut2elmaukw7xgdi','bfgwckypcfs14kg57vcuyl2yogy27g1r',NULL,'',0,0,2,'2015-10-15 08:47:49'),(3,NULL,1,NULL,'access','2y3nrtclho5oq62ouc9pbsnl01dmdv13','pv9eul6tdanwf1nfbdyaer3ewyabdib1',NULL,'',0,0,2,'2015-10-15 08:50:05'),(4,NULL,1,NULL,'access','nb751rknm05x9g01w5fsunscc9h7lsy9','h00ojwee2ge4ss7p42w72hsu7yxx4iyc',NULL,'',0,0,2,'2015-10-15 08:50:50'),(5,NULL,2,NULL,'access','stei7d6s1gl0pqcuesj1dku64lf8mn16','ikggfo6jos3d5x1wpjh9n2eb1l8ds607',NULL,'',0,0,2,'2015-10-15 09:03:28'),(6,NULL,2,NULL,'access','wg4hs4an32iel6ww6by2s3les4ajxeme','l24x6ynbkh7srjvn1jt8em38oro78ml8',NULL,'',0,0,2,'2015-10-15 09:06:13'),(7,NULL,2,NULL,'access','evn9ac41ul2dkw6wiu0k5ad8p3qntbtk','f6icvvep1546uyp3uu94rpctg845iw47',NULL,'',0,0,2,'2015-10-15 11:54:52'),(8,NULL,2,NULL,'access','vf8p01lw2pyo2s9mqn8yqdvuh6rs489a','yrlglpw1vl8vf4jvfc7f5glu3ulhja55',NULL,'',0,0,2,'2015-10-15 12:14:01'),(9,NULL,2,NULL,'access','ptfqunjvieehkjkifblymkhiqhyatbgf','ulrw98h9kyklam99ayifi311myep8vib',NULL,'',0,0,2,'2015-10-15 12:21:11');
/*!40000 ALTER TABLE `grocery_bag_oauth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_paypal_billing_agreement`
--

DROP TABLE IF EXISTS `grocery_bag_paypal_billing_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_paypal_billing_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `reference_id` varchar(32) NOT NULL COMMENT 'Reference Id',
  `status` varchar(20) NOT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `agreement_label` varchar(255) DEFAULT NULL COMMENT 'Agreement Label',
  PRIMARY KEY (`agreement_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID` (`customer_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_STORE_ID` (`store_id`),
  CONSTRAINT `PAYPAL_BILLING_AGREEMENT_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PAYPAL_BILLING_AGREEMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_paypal_billing_agreement`
--

LOCK TABLES `grocery_bag_paypal_billing_agreement` WRITE;
/*!40000 ALTER TABLE `grocery_bag_paypal_billing_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_paypal_billing_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_paypal_billing_agreement_order`
--

DROP TABLE IF EXISTS `grocery_bag_paypal_billing_agreement_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_paypal_billing_agreement_order` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  PRIMARY KEY (`agreement_id`,`order_id`),
  KEY `PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID` (`order_id`),
  CONSTRAINT `PAYPAL_BILLING_AGREEMENT_ORDER_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `grocery_bag_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PAYPAL_BILLING_AGRT_ORDER_AGRT_ID_PAYPAL_BILLING_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `grocery_bag_paypal_billing_agreement` (`agreement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_paypal_billing_agreement_order`
--

LOCK TABLES `grocery_bag_paypal_billing_agreement_order` WRITE;
/*!40000 ALTER TABLE `grocery_bag_paypal_billing_agreement_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_paypal_billing_agreement_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_paypal_cert`
--

DROP TABLE IF EXISTS `grocery_bag_paypal_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_paypal_cert` (
  `cert_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Cert Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `content` text COMMENT 'Content',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`cert_id`),
  KEY `PAYPAL_CERT_WEBSITE_ID` (`website_id`),
  CONSTRAINT `PAYPAL_CERT_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Certificate Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_paypal_cert`
--

LOCK TABLES `grocery_bag_paypal_cert` WRITE;
/*!40000 ALTER TABLE `grocery_bag_paypal_cert` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_paypal_cert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_paypal_payment_transaction`
--

DROP TABLE IF EXISTS `grocery_bag_paypal_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_paypal_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `PAYPAL_PAYMENT_TRANSACTION_TXN_ID` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PayPal Payflow Link Payment Transaction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_paypal_payment_transaction`
--

LOCK TABLES `grocery_bag_paypal_payment_transaction` WRITE;
/*!40000 ALTER TABLE `grocery_bag_paypal_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_paypal_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_paypal_settlement_report`
--

DROP TABLE IF EXISTS `grocery_bag_paypal_settlement_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_paypal_settlement_report` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Report Id',
  `report_date` timestamp NULL DEFAULT NULL COMMENT 'Report Date',
  `account_id` varchar(64) DEFAULT NULL COMMENT 'Account Id',
  `filename` varchar(24) DEFAULT NULL COMMENT 'Filename',
  `last_modified` timestamp NULL DEFAULT NULL COMMENT 'Last Modified',
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID` (`report_date`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_paypal_settlement_report`
--

LOCK TABLES `grocery_bag_paypal_settlement_report` WRITE;
/*!40000 ALTER TABLE `grocery_bag_paypal_settlement_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_paypal_settlement_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_paypal_settlement_report_row`
--

DROP TABLE IF EXISTS `grocery_bag_paypal_settlement_report_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_paypal_settlement_report_row` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Row Id',
  `report_id` int(10) unsigned NOT NULL COMMENT 'Report Id',
  `transaction_id` varchar(19) DEFAULT NULL COMMENT 'Transaction Id',
  `invoice_id` varchar(127) DEFAULT NULL COMMENT 'Invoice Id',
  `paypal_reference_id` varchar(19) DEFAULT NULL COMMENT 'Paypal Reference Id',
  `paypal_reference_id_type` varchar(3) DEFAULT NULL COMMENT 'Paypal Reference Id Type',
  `transaction_event_code` varchar(5) DEFAULT NULL COMMENT 'Transaction Event Code',
  `transaction_initiation_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Initiation Date',
  `transaction_completion_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Completion Date',
  `transaction_debit_or_credit` varchar(2) NOT NULL DEFAULT 'CR' COMMENT 'Transaction Debit Or Credit',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Gross Transaction Amount',
  `gross_transaction_currency` varchar(3) DEFAULT NULL COMMENT 'Gross Transaction Currency',
  `fee_debit_or_credit` varchar(2) DEFAULT NULL COMMENT 'Fee Debit Or Credit',
  `fee_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Fee Amount',
  `fee_currency` varchar(3) DEFAULT NULL COMMENT 'Fee Currency',
  `custom_field` varchar(255) DEFAULT NULL COMMENT 'Custom Field',
  `consumer_id` varchar(127) DEFAULT NULL COMMENT 'Consumer Id',
  `payment_tracking_id` varchar(255) DEFAULT NULL COMMENT 'Payment Tracking ID',
  `store_id` varchar(50) DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`row_id`),
  KEY `PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID` (`report_id`),
  CONSTRAINT `FK_E183E488F593E0DE10C6EBFFEBAC9B55` FOREIGN KEY (`report_id`) REFERENCES `grocery_bag_paypal_settlement_report` (`report_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Row Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_paypal_settlement_report_row`
--

LOCK TABLES `grocery_bag_paypal_settlement_report_row` WRITE;
/*!40000 ALTER TABLE `grocery_bag_paypal_settlement_report_row` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_paypal_settlement_report_row` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_persistent_session`
--

DROP TABLE IF EXISTS `grocery_bag_persistent_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_persistent_session` (
  `persistent_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Session id',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `info` text COMMENT 'Session Data',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`persistent_id`),
  UNIQUE KEY `PERSISTENT_SESSION_KEY` (`key`),
  UNIQUE KEY `PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  KEY `PERSISTENT_SESSION_UPDATED_AT` (`updated_at`),
  KEY `PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `PERSISTENT_SESSION_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PERSISTENT_SESSION_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Persistent Session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_persistent_session`
--

LOCK TABLES `grocery_bag_persistent_session` WRITE;
/*!40000 ALTER TABLE `grocery_bag_persistent_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_persistent_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_product_alert_price`
--

DROP TABLE IF EXISTS `grocery_bag_product_alert_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert price id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price amount',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert send count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_price_id`),
  KEY `PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  KEY `PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  KEY `PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `PRODUCT_ALERT_PRICE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_PRICE_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_PRICE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_product_alert_price`
--

LOCK TABLES `grocery_bag_product_alert_price` WRITE;
/*!40000 ALTER TABLE `grocery_bag_product_alert_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_product_alert_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_product_alert_stock`
--

DROP TABLE IF EXISTS `grocery_bag_product_alert_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Send Count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_stock_id`),
  KEY `PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  KEY `PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  KEY `PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`),
  CONSTRAINT `PRODUCT_ALERT_STOCK_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_STOCK_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCT_ALERT_STOCK_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_product_alert_stock`
--

LOCK TABLES `grocery_bag_product_alert_stock` WRITE;
/*!40000 ALTER TABLE `grocery_bag_product_alert_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_product_alert_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_quote`
--

DROP TABLE IF EXISTS `grocery_bag_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint(5) unsigned DEFAULT '1' COMMENT 'Is Active',
  `is_virtual` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Virtual',
  `is_multi_shipping` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Multi Shipping',
  `items_count` int(10) unsigned DEFAULT '0' COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT '0.0000' COMMENT 'Items Qty',
  `orig_order_id` int(10) unsigned DEFAULT '0' COMMENT 'Orig Order Id',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `customer_tax_class_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Tax Class Id',
  `customer_group_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Group Id',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` varchar(255) DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT '1' COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint(5) unsigned DEFAULT '0' COMMENT 'Customer Is Guest',
  `remote_ip` varchar(32) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order Id',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int(10) unsigned DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Trigger Recollect',
  `ext_shipping_info` text COMMENT 'Ext Shipping Info',
  `is_persistent` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Quote Persistent',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`entity_id`),
  KEY `QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  KEY `QUOTE_STORE_ID` (`store_id`),
  CONSTRAINT `QUOTE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_quote`
--

LOCK TABLES `grocery_bag_quote` WRITE;
/*!40000 ALTER TABLE `grocery_bag_quote` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_quote_address`
--

DROP TABLE IF EXISTS `grocery_bag_quote_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_quote_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `save_in_address_book` smallint(6) DEFAULT '0' COMMENT 'Save In Address Book',
  `customer_address_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Address Id',
  `address_type` varchar(10) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(20) DEFAULT NULL COMMENT 'Firstname',
  `middlename` varchar(20) DEFAULT NULL COMMENT 'Middlename',
  `lastname` varchar(20) DEFAULT NULL COMMENT 'Lastname',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(40) DEFAULT NULL COMMENT 'Street',
  `city` varchar(40) DEFAULT NULL COMMENT 'City',
  `region` varchar(40) DEFAULT NULL COMMENT 'Region',
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'Region Id',
  `postcode` varchar(20) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(30) DEFAULT NULL COMMENT 'Country Id',
  `telephone` varchar(20) DEFAULT NULL COMMENT 'Phone Number',
  `fax` varchar(20) DEFAULT NULL COMMENT 'Fax',
  `same_as_billing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Same As Billing',
  `collect_shipping_rates` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(40) DEFAULT NULL COMMENT 'Shipping Method',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Weight',
  `subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `customer_notes` text COMMENT 'Customer Notes',
  `applied_taxes` text COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `free_shipping` smallint(6) DEFAULT NULL,
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`address_id`),
  KEY `QUOTE_ADDRESS_QUOTE_ID` (`quote_id`),
  CONSTRAINT `QUOTE_ADDRESS_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `grocery_bag_quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_quote_address`
--

LOCK TABLES `grocery_bag_quote_address` WRITE;
/*!40000 ALTER TABLE `grocery_bag_quote_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_quote_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_quote_address_item`
--

DROP TABLE IF EXISTS `grocery_bag_quote_address_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Item Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Address Id',
  `quote_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Item Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `super_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Super Product Id',
  `parent_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Product Id',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `is_qty_decimal` int(10) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int(10) unsigned DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `free_shipping` int(11) DEFAULT NULL,
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`address_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  KEY `QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`),
  CONSTRAINT `QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`quote_address_id`) REFERENCES `grocery_bag_quote_address` (`address_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`quote_item_id`) REFERENCES `grocery_bag_quote_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ADDR_ITEM_PARENT_ITEM_ID_QUOTE_ADDR_ITEM_ADDR_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `grocery_bag_quote_address_item` (`address_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_quote_address_item`
--

LOCK TABLES `grocery_bag_quote_address_item` WRITE;
/*!40000 ALTER TABLE `grocery_bag_quote_address_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_quote_address_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_quote_id_mask`
--

DROP TABLE IF EXISTS `grocery_bag_quote_id_mask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_quote_id_mask` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `quote_id` int(10) unsigned NOT NULL COMMENT 'Quote ID',
  `masked_id` varchar(32) DEFAULT NULL COMMENT 'Masked ID',
  PRIMARY KEY (`entity_id`,`quote_id`),
  KEY `QUOTE_ID_MASK_QUOTE_ID` (`quote_id`),
  CONSTRAINT `QUOTE_ID_MASK_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `grocery_bag_quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Quote ID and masked ID mapping';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_quote_id_mask`
--

LOCK TABLES `grocery_bag_quote_id_mask` WRITE;
/*!40000 ALTER TABLE `grocery_bag_quote_id_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_quote_id_mask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_quote_item`
--

DROP TABLE IF EXISTS `grocery_bag_quote_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_quote_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned DEFAULT '0' COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `free_shipping` smallint(6) DEFAULT NULL,
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  KEY `QUOTE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `QUOTE_ITEM_PARENT_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`parent_item_id`) REFERENCES `grocery_bag_quote_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ITEM_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `grocery_bag_quote` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `QUOTE_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_quote_item`
--

LOCK TABLES `grocery_bag_quote_item` WRITE;
/*!40000 ALTER TABLE `grocery_bag_quote_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_quote_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_quote_item_option`
--

DROP TABLE IF EXISTS `grocery_bag_quote_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_quote_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `item_id` int(10) unsigned NOT NULL COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`),
  CONSTRAINT `QUOTE_ITEM_OPTION_ITEM_ID_QUOTE_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `grocery_bag_quote_item` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_quote_item_option`
--

LOCK TABLES `grocery_bag_quote_item_option` WRITE;
/*!40000 ALTER TABLE `grocery_bag_quote_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_quote_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_quote_payment`
--

DROP TABLE IF EXISTS `grocery_bag_quote_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_quote_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payment Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last_4` varchar(255) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text COMMENT 'Additional Information',
  `paypal_payer_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Id',
  `paypal_payer_status` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Status',
  `paypal_correlation_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Correlation Id',
  PRIMARY KEY (`payment_id`),
  KEY `QUOTE_PAYMENT_QUOTE_ID` (`quote_id`),
  CONSTRAINT `QUOTE_PAYMENT_QUOTE_ID_QUOTE_ENTITY_ID` FOREIGN KEY (`quote_id`) REFERENCES `grocery_bag_quote` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_quote_payment`
--

LOCK TABLES `grocery_bag_quote_payment` WRITE;
/*!40000 ALTER TABLE `grocery_bag_quote_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_quote_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_quote_shipping_rate`
--

DROP TABLE IF EXISTS `grocery_bag_quote_shipping_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rate Id',
  `address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Address Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text COMMENT 'Method Description',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `error_message` text COMMENT 'Error Message',
  `method_title` text COMMENT 'Method Title',
  PRIMARY KEY (`rate_id`),
  KEY `QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`),
  CONSTRAINT `QUOTE_SHIPPING_RATE_ADDRESS_ID_QUOTE_ADDRESS_ADDRESS_ID` FOREIGN KEY (`address_id`) REFERENCES `grocery_bag_quote_address` (`address_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Shipping Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_quote_shipping_rate`
--

LOCK TABLES `grocery_bag_quote_shipping_rate` WRITE;
/*!40000 ALTER TABLE `grocery_bag_quote_shipping_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_quote_shipping_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_rating`
--

DROP TABLE IF EXISTS `grocery_bag_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_rating` (
  `rating_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Id',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Position On Storefront',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Rating is active.',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `RATING_RATING_CODE` (`rating_code`),
  KEY `RATING_ENTITY_ID` (`entity_id`),
  CONSTRAINT `RATING_ENTITY_ID_RATING_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_rating_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_rating`
--

LOCK TABLES `grocery_bag_rating` WRITE;
/*!40000 ALTER TABLE `grocery_bag_rating` DISABLE KEYS */;
INSERT INTO `grocery_bag_rating` VALUES (1,1,'Quality',0,1),(2,1,'Value',0,1),(3,1,'Price',0,1);
/*!40000 ALTER TABLE `grocery_bag_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_rating_entity`
--

DROP TABLE IF EXISTS `grocery_bag_rating_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_rating_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `RATING_ENTITY_ENTITY_CODE` (`entity_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Rating entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_rating_entity`
--

LOCK TABLES `grocery_bag_rating_entity` WRITE;
/*!40000 ALTER TABLE `grocery_bag_rating_entity` DISABLE KEYS */;
INSERT INTO `grocery_bag_rating_entity` VALUES (1,'product'),(2,'product_review'),(3,'review');
/*!40000 ALTER TABLE `grocery_bag_rating_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_rating_option`
--

DROP TABLE IF EXISTS `grocery_bag_rating_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_rating_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Option Id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Option Value',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Ration option position on Storefront',
  PRIMARY KEY (`option_id`),
  KEY `RATING_OPTION_RATING_ID` (`rating_id`),
  CONSTRAINT `RATING_OPTION_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `grocery_bag_rating` (`rating_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Rating options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_rating_option`
--

LOCK TABLES `grocery_bag_rating_option` WRITE;
/*!40000 ALTER TABLE `grocery_bag_rating_option` DISABLE KEYS */;
INSERT INTO `grocery_bag_rating_option` VALUES (1,1,'1',1,1),(2,1,'2',2,2),(3,1,'3',3,3),(4,1,'4',4,4),(5,1,'5',5,5),(6,2,'1',1,1),(7,2,'2',2,2),(8,2,'3',3,3),(9,2,'4',4,4),(10,2,'5',5,5),(11,3,'1',1,1),(12,3,'2',2,2),(13,3,'3',3,3),(14,3,'4',4,4),(15,3,'5',5,5);
/*!40000 ALTER TABLE `grocery_bag_rating_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_rating_option_vote`
--

DROP TABLE IF EXISTS `grocery_bag_rating_option_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vote id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote option id',
  `remote_ip` varchar(16) NOT NULL COMMENT 'Customer IP',
  `remote_ip_long` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Customer IP converted to long integer format',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `review_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Review id',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Percent amount',
  `value` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote option value',
  PRIMARY KEY (`vote_id`),
  KEY `RATING_OPTION_VOTE_OPTION_ID` (`option_id`),
  KEY `RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` (`review_id`),
  CONSTRAINT `RATING_OPTION_VOTE_OPTION_ID_RATING_OPTION_OPTION_ID` FOREIGN KEY (`option_id`) REFERENCES `grocery_bag_rating_option` (`option_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_OPTION_VOTE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `grocery_bag_review` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_rating_option_vote`
--

LOCK TABLES `grocery_bag_rating_option_vote` WRITE;
/*!40000 ALTER TABLE `grocery_bag_rating_option_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_rating_option_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_rating_option_vote_aggregated`
--

DROP TABLE IF EXISTS `grocery_bag_rating_option_vote_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote dty',
  `vote_value_sum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'General vote sum',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote percent',
  `percent_approved` smallint(6) DEFAULT '0' COMMENT 'Vote percent approved by admin',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`primary_id`),
  KEY `RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  KEY `RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `RATING_OPTION_VOTE_AGGREGATED_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `grocery_bag_rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_OPTION_VOTE_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating vote aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_rating_option_vote_aggregated`
--

LOCK TABLES `grocery_bag_rating_option_vote_aggregated` WRITE;
/*!40000 ALTER TABLE `grocery_bag_rating_option_vote_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_rating_option_vote_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_rating_store`
--

DROP TABLE IF EXISTS `grocery_bag_rating_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_rating_store` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `RATING_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `RATING_STORE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `grocery_bag_rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_rating_store`
--

LOCK TABLES `grocery_bag_rating_store` WRITE;
/*!40000 ALTER TABLE `grocery_bag_rating_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_rating_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_rating_title`
--

DROP TABLE IF EXISTS `grocery_bag_rating_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_rating_title` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `RATING_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `RATING_TITLE_RATING_ID_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `grocery_bag_rating` (`rating_id`) ON DELETE CASCADE,
  CONSTRAINT `RATING_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Title';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_rating_title`
--

LOCK TABLES `grocery_bag_rating_title` WRITE;
/*!40000 ALTER TABLE `grocery_bag_rating_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_rating_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_report_compared_product_index`
--

DROP TABLE IF EXISTS `grocery_bag_report_compared_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_report_compared_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_CMPD_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_CMPD_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_COMPARED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Compared Product Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_report_compared_product_index`
--

LOCK TABLES `grocery_bag_report_compared_product_index` WRITE;
/*!40000 ALTER TABLE `grocery_bag_report_compared_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_report_compared_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_report_event`
--

DROP TABLE IF EXISTS `grocery_bag_report_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_report_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Id',
  `logged_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Logged At',
  `event_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type Id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Object Id',
  `subject_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subject Id',
  `subtype` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Subtype',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`event_id`),
  KEY `REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  KEY `REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  KEY `REPORT_EVENT_OBJECT_ID` (`object_id`),
  KEY `REPORT_EVENT_SUBTYPE` (`subtype`),
  KEY `REPORT_EVENT_STORE_ID` (`store_id`),
  CONSTRAINT `REPORT_EVENT_EVENT_TYPE_ID_REPORT_EVENT_TYPES_EVENT_TYPE_ID` FOREIGN KEY (`event_type_id`) REFERENCES `grocery_bag_report_event_types` (`event_type_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_EVENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Event Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_report_event`
--

LOCK TABLES `grocery_bag_report_event` WRITE;
/*!40000 ALTER TABLE `grocery_bag_report_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_report_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_report_event_types`
--

DROP TABLE IF EXISTS `grocery_bag_report_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_report_event_types` (
  `event_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Type Id',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Login',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Reports Event Type Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_report_event_types`
--

LOCK TABLES `grocery_bag_report_event_types` WRITE;
/*!40000 ALTER TABLE `grocery_bag_report_event_types` DISABLE KEYS */;
INSERT INTO `grocery_bag_report_event_types` VALUES (1,'catalog_product_view',0),(2,'sendfriend_product',0),(3,'catalog_product_compare_add_product',0),(4,'checkout_cart_add_product',0),(5,'wishlist_add_product',0),(6,'wishlist_share',0);
/*!40000 ALTER TABLE `grocery_bag_report_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_report_viewed_product_aggregated_daily`
--

DROP TABLE IF EXISTS `grocery_bag_report_viewed_product_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_report_viewed_product_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Daily';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_report_viewed_product_aggregated_daily`
--

LOCK TABLES `grocery_bag_report_viewed_product_aggregated_daily` WRITE;
/*!40000 ALTER TABLE `grocery_bag_report_viewed_product_aggregated_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_report_viewed_product_aggregated_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_report_viewed_product_aggregated_monthly`
--

DROP TABLE IF EXISTS `grocery_bag_report_viewed_product_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_report_viewed_product_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_MONTHLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_MONTHLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Monthly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_report_viewed_product_aggregated_monthly`
--

LOCK TABLES `grocery_bag_report_viewed_product_aggregated_monthly` WRITE;
/*!40000 ALTER TABLE `grocery_bag_report_viewed_product_aggregated_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_report_viewed_product_aggregated_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_report_viewed_product_aggregated_yearly`
--

DROP TABLE IF EXISTS `grocery_bag_report_viewed_product_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_report_viewed_product_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `REPORT_VIEWED_PRD_AGGRED_YEARLY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Yearly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_report_viewed_product_aggregated_yearly`
--

LOCK TABLES `grocery_bag_report_viewed_product_aggregated_yearly` WRITE;
/*!40000 ALTER TABLE `grocery_bag_report_viewed_product_aggregated_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_report_viewed_product_aggregated_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_report_viewed_product_index`
--

DROP TABLE IF EXISTS `grocery_bag_report_viewed_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_report_viewed_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `REPORT_VIEWED_PRD_IDX_CSTR_ID_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRD_IDX_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REPORT_VIEWED_PRODUCT_INDEX_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Viewed Product Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_report_viewed_product_index`
--

LOCK TABLES `grocery_bag_report_viewed_product_index` WRITE;
/*!40000 ALTER TABLE `grocery_bag_report_viewed_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_report_viewed_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_reporting_counts`
--

DROP TABLE IF EXISTS `grocery_bag_reporting_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_reporting_counts` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'Item Reported',
  `count` int(10) unsigned DEFAULT NULL COMMENT 'Count Value',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for all count related events generated via the cron job';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_reporting_counts`
--

LOCK TABLES `grocery_bag_reporting_counts` WRITE;
/*!40000 ALTER TABLE `grocery_bag_reporting_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_reporting_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_reporting_module_status`
--

DROP TABLE IF EXISTS `grocery_bag_reporting_module_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_reporting_module_status` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Module Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Module Name',
  `active` varchar(255) DEFAULT NULL COMMENT 'Module Active Status',
  `setup_version` varchar(255) DEFAULT NULL COMMENT 'Module Version',
  `state` varchar(255) DEFAULT NULL COMMENT 'Module State',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_reporting_module_status`
--

LOCK TABLES `grocery_bag_reporting_module_status` WRITE;
/*!40000 ALTER TABLE `grocery_bag_reporting_module_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_reporting_module_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_reporting_orders`
--

DROP TABLE IF EXISTS `grocery_bag_reporting_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_reporting_orders` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `total` decimal(20,2) DEFAULT NULL COMMENT 'Total From Store',
  `total_base` decimal(20,2) DEFAULT NULL COMMENT 'Total From Base Currency',
  `item_count` int(10) unsigned NOT NULL COMMENT 'Line Item Count',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for all orders';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_reporting_orders`
--

LOCK TABLES `grocery_bag_reporting_orders` WRITE;
/*!40000 ALTER TABLE `grocery_bag_reporting_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_reporting_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_reporting_system_updates`
--

DROP TABLE IF EXISTS `grocery_bag_reporting_system_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_reporting_system_updates` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'Update Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for system updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_reporting_system_updates`
--

LOCK TABLES `grocery_bag_reporting_system_updates` WRITE;
/*!40000 ALTER TABLE `grocery_bag_reporting_system_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_reporting_system_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_reporting_users`
--

DROP TABLE IF EXISTS `grocery_bag_reporting_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_reporting_users` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `type` varchar(255) DEFAULT NULL COMMENT 'User Type',
  `action` varchar(255) DEFAULT NULL COMMENT 'Action Performed',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reporting for user actions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_reporting_users`
--

LOCK TABLES `grocery_bag_reporting_users` WRITE;
/*!40000 ALTER TABLE `grocery_bag_reporting_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_reporting_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_review`
--

DROP TABLE IF EXISTS `grocery_bag_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_review` (
  `review_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Review create date',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity id',
  `entity_pk_value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `status_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status code',
  PRIMARY KEY (`review_id`),
  KEY `REVIEW_ENTITY_ID` (`entity_id`),
  KEY `REVIEW_STATUS_ID` (`status_id`),
  KEY `REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`),
  CONSTRAINT `REVIEW_ENTITY_ID_REVIEW_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_review_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `REVIEW_STATUS_ID_REVIEW_STATUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `grocery_bag_review_status` (`status_id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_review`
--

LOCK TABLES `grocery_bag_review` WRITE;
/*!40000 ALTER TABLE `grocery_bag_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_review_detail`
--

DROP TABLE IF EXISTS `grocery_bag_review_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review detail id',
  `review_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Review id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store id',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  PRIMARY KEY (`detail_id`),
  KEY `REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  KEY `REVIEW_DETAIL_STORE_ID` (`store_id`),
  KEY `REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `REVIEW_DETAIL_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `REVIEW_DETAIL_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `grocery_bag_review` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `REVIEW_DETAIL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_review_detail`
--

LOCK TABLES `grocery_bag_review_detail` WRITE;
/*!40000 ALTER TABLE `grocery_bag_review_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_review_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_review_entity`
--

DROP TABLE IF EXISTS `grocery_bag_review_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review entity id',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_review_entity`
--

LOCK TABLES `grocery_bag_review_entity` WRITE;
/*!40000 ALTER TABLE `grocery_bag_review_entity` DISABLE KEYS */;
INSERT INTO `grocery_bag_review_entity` VALUES (1,'product'),(2,'customer'),(3,'category');
/*!40000 ALTER TABLE `grocery_bag_review_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_review_entity_summary`
--

DROP TABLE IF EXISTS `grocery_bag_review_entity_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_review_entity_summary` (
  `primary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity id',
  `entity_pk_value` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Product id',
  `entity_type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Entity type id',
  `reviews_count` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Qty of reviews',
  `rating_summary` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Summarized rating',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`primary_id`),
  KEY `REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`),
  CONSTRAINT `REVIEW_ENTITY_SUMMARY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review aggregates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_review_entity_summary`
--

LOCK TABLES `grocery_bag_review_entity_summary` WRITE;
/*!40000 ALTER TABLE `grocery_bag_review_entity_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_review_entity_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_review_status`
--

DROP TABLE IF EXISTS `grocery_bag_review_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_review_status` (
  `status_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Status id',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_review_status`
--

LOCK TABLES `grocery_bag_review_status` WRITE;
/*!40000 ALTER TABLE `grocery_bag_review_status` DISABLE KEYS */;
INSERT INTO `grocery_bag_review_status` VALUES (1,'Approved'),(2,'Pending'),(3,'Not Approved');
/*!40000 ALTER TABLE `grocery_bag_review_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_review_store`
--

DROP TABLE IF EXISTS `grocery_bag_review_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_review_store` (
  `review_id` bigint(20) unsigned NOT NULL COMMENT 'Review Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `REVIEW_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `REVIEW_STORE_REVIEW_ID_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `grocery_bag_review` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `REVIEW_STORE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_review_store`
--

LOCK TABLES `grocery_bag_review_store` WRITE;
/*!40000 ALTER TABLE `grocery_bag_review_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_review_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_bestsellers_aggregated_daily`
--

DROP TABLE IF EXISTS `grocery_bag_sales_bestsellers_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_bestsellers_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `SALES_BESTSELLERS_AGGRED_DAILY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Daily';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_bestsellers_aggregated_daily`
--

LOCK TABLES `grocery_bag_sales_bestsellers_aggregated_daily` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_bestsellers_aggregated_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_bestsellers_aggregated_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_bestsellers_aggregated_monthly`
--

DROP TABLE IF EXISTS `grocery_bag_sales_bestsellers_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_bestsellers_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `SALES_BESTSELLERS_AGGRED_MONTHLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Monthly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_bestsellers_aggregated_monthly`
--

LOCK TABLES `grocery_bag_sales_bestsellers_aggregated_monthly` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_bestsellers_aggregated_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_bestsellers_aggregated_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_bestsellers_aggregated_yearly`
--

DROP TABLE IF EXISTS `grocery_bag_sales_bestsellers_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_bestsellers_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_PERIOD_STORE_ID_PRODUCT_ID` (`period`,`store_id`,`product_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `SALES_BESTSELLERS_AGGRED_YEARLY_PRD_ID_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Yearly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_bestsellers_aggregated_yearly`
--

LOCK TABLES `grocery_bag_sales_bestsellers_aggregated_yearly` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_bestsellers_aggregated_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_bestsellers_aggregated_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_creditmemo`
--

DROP TABLE IF EXISTS `grocery_bag_sales_creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_creditmemo` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_CREDITMEMO_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_CREDITMEMO_STORE_ID` (`store_id`),
  KEY `SALES_CREDITMEMO_ORDER_ID` (`order_id`),
  KEY `SALES_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `SALES_CREDITMEMO_STATE` (`state`),
  KEY `SALES_CREDITMEMO_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_UPDATED_AT` (`updated_at`),
  KEY `SALES_CREDITMEMO_SEND_EMAIL` (`send_email`),
  KEY `SALES_CREDITMEMO_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_CREDITMEMO_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `grocery_bag_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_CREDITMEMO_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_creditmemo`
--

LOCK TABLES `grocery_bag_sales_creditmemo` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_creditmemo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_creditmemo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_creditmemo_comment`
--

DROP TABLE IF EXISTS `grocery_bag_sales_creditmemo_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_creditmemo_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_CREDITMEMO_COMMENT_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `grocery_bag_sales_creditmemo` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_creditmemo_comment`
--

LOCK TABLES `grocery_bag_sales_creditmemo_comment` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_creditmemo_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_creditmemo_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_creditmemo_grid`
--

DROP TABLE IF EXISTS `grocery_bag_sales_creditmemo_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_creditmemo_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `state` int(11) DEFAULT NULL COMMENT 'Status',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `order_base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Order Grand Total',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_CREDITMEMO_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_CREDITMEMO_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_CREDITMEMO_GRID_STATE` (`state`),
  KEY `SALES_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_STATUS` (`order_status`),
  KEY `SALES_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `SALES_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_BASE_GRAND_TOTAL` (`order_base_grand_total`),
  KEY `SALES_CREDITMEMO_GRID_ORDER_ID` (`order_id`),
  FULLTEXT KEY `FTI_32B7BA885941A8254EE84AE650ABDC86` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_creditmemo_grid`
--

LOCK TABLES `grocery_bag_sales_creditmemo_grid` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_creditmemo_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_creditmemo_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_creditmemo_item`
--

DROP TABLE IF EXISTS `grocery_bag_sales_creditmemo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_creditmemo_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax in the creditmemo item over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_CREDITMEMO_ITEM_PARENT_ID_SALES_CREDITMEMO_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `grocery_bag_sales_creditmemo` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_creditmemo_item`
--

LOCK TABLES `grocery_bag_sales_creditmemo_item` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_creditmemo_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_creditmemo_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_invoice`
--

DROP TABLE IF EXISTS `grocery_bag_sales_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_invoice` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `is_used_for_refund` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `can_void_flag` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_INVOICE_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_INVOICE_STORE_ID` (`store_id`),
  KEY `SALES_INVOICE_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_INVOICE_ORDER_ID` (`order_id`),
  KEY `SALES_INVOICE_STATE` (`state`),
  KEY `SALES_INVOICE_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_UPDATED_AT` (`updated_at`),
  KEY `SALES_INVOICE_SEND_EMAIL` (`send_email`),
  KEY `SALES_INVOICE_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_INVOICE_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `grocery_bag_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_INVOICE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_invoice`
--

LOCK TABLES `grocery_bag_sales_invoice` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_invoice_comment`
--

DROP TABLE IF EXISTS `grocery_bag_sales_invoice_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_invoice_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_INVOICE_COMMENT_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `grocery_bag_sales_invoice` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_invoice_comment`
--

LOCK TABLES `grocery_bag_sales_invoice_comment` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_invoice_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_invoice_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_invoice_grid`
--

DROP TABLE IF EXISTS `grocery_bag_sales_invoice_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_invoice_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `payment_method` varchar(128) DEFAULT NULL COMMENT 'Payment Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_INVOICE_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_INVOICE_GRID_STORE_ID` (`store_id`),
  KEY `SALES_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_INVOICE_GRID_ORDER_ID` (`order_id`),
  KEY `SALES_INVOICE_GRID_STATE` (`state`),
  KEY `SALES_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_INVOICE_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_INVOICE_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_INVOICE_GRID_BILLING_NAME` (`billing_name`),
  FULLTEXT KEY `FTI_95D9C924DD6A8734EB8B5D01D60F90DE` (`increment_id`,`order_increment_id`,`billing_name`,`billing_address`,`shipping_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_invoice_grid`
--

LOCK TABLES `grocery_bag_sales_invoice_grid` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_invoice_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_invoice_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_invoice_item`
--

DROP TABLE IF EXISTS `grocery_bag_sales_invoice_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_invoice_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `tax_ratio` text COMMENT 'Ratio of tax invoiced over tax of the order item',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_INVOICE_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_INVOICE_ITEM_PARENT_ID_SALES_INVOICE_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `grocery_bag_sales_invoice` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_invoice_item`
--

LOCK TABLES `grocery_bag_sales_invoice_item` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_invoice_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_invoice_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_invoiced_aggregated`
--

DROP TABLE IF EXISTS `grocery_bag_sales_invoiced_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_invoiced_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_INVOICED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_INVOICED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_invoiced_aggregated`
--

LOCK TABLES `grocery_bag_sales_invoiced_aggregated` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_invoiced_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_invoiced_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_invoiced_aggregated_order`
--

DROP TABLE IF EXISTS `grocery_bag_sales_invoiced_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_invoiced_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_INVOICED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_INVOICED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_invoiced_aggregated_order`
--

LOCK TABLES `grocery_bag_sales_invoiced_aggregated_order` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_invoiced_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_invoiced_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_order`
--

DROP TABLE IF EXISTS `grocery_bag_sales_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `edit_increment` int(11) DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `forced_shipment_with_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int(11) DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `quote_id` int(11) DEFAULT NULL COMMENT 'Quote Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(12,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(12,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(32) DEFAULT NULL COMMENT 'Increment Id',
  `applied_rule_ids` varchar(128) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(128) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(128) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(128) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(32) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(32) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(32) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(32) DEFAULT NULL COMMENT 'Ext Customer Id',
  `ext_order_id` varchar(32) DEFAULT NULL COMMENT 'Ext Order Id',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(32) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(32) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(32) DEFAULT NULL COMMENT 'Original Increment Id',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Id',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real Id',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Id',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real Id',
  `remote_ip` varchar(32) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(32) DEFAULT NULL COMMENT 'Shipping Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(32) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(32) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text COMMENT 'Customer Note',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `total_item_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Total Item Count',
  `customer_gender` int(11) DEFAULT NULL COMMENT 'Customer Gender',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `shipping_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Tax Compensation Amount',
  `base_shipping_discount_tax_compensation_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name',
  `paypal_ipn_customer_notified` int(11) DEFAULT '0' COMMENT 'Paypal Ipn Customer Notified',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_ORDER_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_ORDER_STATUS` (`status`),
  KEY `SALES_ORDER_STATE` (`state`),
  KEY `SALES_ORDER_STORE_ID` (`store_id`),
  KEY `SALES_ORDER_CREATED_AT` (`created_at`),
  KEY `SALES_ORDER_CUSTOMER_ID` (`customer_id`),
  KEY `SALES_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  KEY `SALES_ORDER_QUOTE_ID` (`quote_id`),
  KEY `SALES_ORDER_UPDATED_AT` (`updated_at`),
  KEY `SALES_ORDER_SEND_EMAIL` (`send_email`),
  KEY `SALES_ORDER_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_ORDER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE SET NULL,
  CONSTRAINT `SALES_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_order`
--

LOCK TABLES `grocery_bag_sales_order` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_order_address`
--

DROP TABLE IF EXISTS `grocery_bag_sales_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_order_address` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `customer_address_id` int(11) DEFAULT NULL COMMENT 'Customer Address Id',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `region_id` int(11) DEFAULT NULL COMMENT 'Region Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Phone Number',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_ADDRESS_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_ORDER_ADDRESS_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `grocery_bag_sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_order_address`
--

LOCK TABLES `grocery_bag_sales_order_address` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_order_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_order_aggregated_created`
--

DROP TABLE IF EXISTS `grocery_bag_sales_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_ORDER_AGGREGATED_CREATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Created';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_order_aggregated_created`
--

LOCK TABLES `grocery_bag_sales_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_order_aggregated_updated`
--

DROP TABLE IF EXISTS `grocery_bag_sales_order_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `GROCERY_BAG_SALES_ORDER_AGGRED_UPDATED_PERIOD_STORE_ID_ORDER_STS` (`period`,`store_id`,`order_status`),
  KEY `GROCERY_BAG_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_0B37F885D4C0253D5F2EDF5CA249E0DA` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grocery Bag Sales Order Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_order_aggregated_updated`
--

LOCK TABLES `grocery_bag_sales_order_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_order_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_order_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_order_grid`
--

DROP TABLE IF EXISTS `grocery_bag_sales_order_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_order_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group` varchar(255) DEFAULT NULL COMMENT 'Customer Group',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `shipping_and_handling` decimal(12,4) DEFAULT NULL COMMENT 'Shipping and handling amount',
  `customer_name` varchar(255) DEFAULT NULL COMMENT 'Customer Name',
  `payment_method` varchar(255) DEFAULT NULL COMMENT 'Payment Method',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_ORDER_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_ORDER_GRID_STATUS` (`status`),
  KEY `SALES_ORDER_GRID_STORE_ID` (`store_id`),
  KEY `SALES_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `SALES_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `SALES_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `SALES_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  KEY `SALES_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `SALES_ORDER_GRID_BILLING_NAME` (`billing_name`),
  KEY `SALES_ORDER_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  KEY `SALES_ORDER_GRID_UPDATED_AT` (`updated_at`),
  FULLTEXT KEY `FTI_65B9E9925EC58F0C7C2E2F6379C233E7` (`increment_id`,`billing_name`,`shipping_name`,`shipping_address`,`billing_address`,`customer_name`,`customer_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_order_grid`
--

LOCK TABLES `grocery_bag_sales_order_grid` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_order_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_order_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_order_item`
--

DROP TABLE IF EXISTS `grocery_bag_sales_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_order_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Quote Item Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` text COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Cost',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `original_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Amount Refunded',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item Id',
  `locked_do_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Amount',
  `base_discount_tax_compensation_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Amount',
  `discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Invoiced',
  `base_discount_tax_compensation_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Invoiced',
  `discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Refunded',
  `base_discount_tax_compensation_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Tax Compensation Refunded',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `discount_tax_compensation_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Tax Compensation Canceled',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `free_shipping` smallint(6) DEFAULT NULL,
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `gift_message_available` int(11) DEFAULT NULL COMMENT 'Gift Message Available',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `SALES_ORDER_ITEM_ORDER_ID` (`order_id`),
  KEY `SALES_ORDER_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_ITEM_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `grocery_bag_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_order_item`
--

LOCK TABLES `grocery_bag_sales_order_item` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_order_payment`
--

DROP TABLE IF EXISTS `grocery_bag_sales_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_order_payment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int(11) DEFAULT NULL COMMENT 'Quote Payment Id',
  `additional_data` text COMMENT 'Additional Data',
  `cc_exp_month` varchar(12) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(12) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(128) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(128) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(32) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(32) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(32) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last_4` varchar(100) DEFAULT NULL COMMENT 'Cc Last 4',
  `cc_status_description` varchar(32) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(32) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(128) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(32) DEFAULT NULL COMMENT 'Last Trans Id',
  `cc_cid_status` varchar(32) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(128) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(32) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(32) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(4) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(4) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(32) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(32) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(32) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(32) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(32) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(32) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(32) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(32) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_trans_id` varchar(32) DEFAULT NULL COMMENT 'Cc Trans Id',
  `address_status` varchar(32) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text COMMENT 'Additional Information',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_PAYMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_ORDER_PAYMENT_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `grocery_bag_sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_order_payment`
--

LOCK TABLES `grocery_bag_sales_order_payment` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_order_status`
--

DROP TABLE IF EXISTS `grocery_bag_sales_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_order_status`
--

LOCK TABLES `grocery_bag_sales_order_status` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_order_status` DISABLE KEYS */;
INSERT INTO `grocery_bag_sales_order_status` VALUES ('canceled','Canceled'),('closed','Closed'),('complete','Complete'),('fraud','Suspected Fraud'),('holded','On Hold'),('payment_review','Payment Review'),('paypal_canceled_reversal','PayPal Canceled Reversal'),('paypal_reversed','PayPal Reversed'),('pending','Pending'),('pending_payment','Pending Payment'),('pending_paypal','Pending PayPal'),('processing','Processing');
/*!40000 ALTER TABLE `grocery_bag_sales_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_order_status_history`
--

DROP TABLE IF EXISTS `grocery_bag_sales_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_order_status_history` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  KEY `SALES_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`),
  CONSTRAINT `SALES_ORDER_STATUS_HISTORY_PARENT_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `grocery_bag_sales_order` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Status History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_order_status_history`
--

LOCK TABLES `grocery_bag_sales_order_status_history` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_order_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_order_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_order_status_label`
--

DROP TABLE IF EXISTS `grocery_bag_sales_order_status_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`,`store_id`),
  KEY `SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_ORDER_STATUS_LABEL_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `grocery_bag_sales_order_status` (`status`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_STATUS_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Label Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_order_status_label`
--

LOCK TABLES `grocery_bag_sales_order_status_label` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_order_status_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_order_status_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_order_status_state`
--

DROP TABLE IF EXISTS `grocery_bag_sales_order_status_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Visible on front',
  PRIMARY KEY (`status`,`state`),
  CONSTRAINT `SALES_ORDER_STATUS_STATE_STATUS_SALES_ORDER_STATUS_STATUS` FOREIGN KEY (`status`) REFERENCES `grocery_bag_sales_order_status` (`status`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_order_status_state`
--

LOCK TABLES `grocery_bag_sales_order_status_state` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_order_status_state` DISABLE KEYS */;
INSERT INTO `grocery_bag_sales_order_status_state` VALUES ('canceled','canceled',1,1),('closed','closed',1,1),('complete','complete',1,1),('fraud','payment_review',0,1),('fraud','processing',0,1),('holded','holded',1,1),('payment_review','payment_review',1,1),('pending','new',1,1),('pending_payment','pending_payment',1,0),('processing','processing',1,1);
/*!40000 ALTER TABLE `grocery_bag_sales_order_status_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_order_tax`
--

DROP TABLE IF EXISTS `grocery_bag_sales_order_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(12,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `base_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint(6) NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Real Amount',
  PRIMARY KEY (`tax_id`),
  KEY `SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_order_tax`
--

LOCK TABLES `grocery_bag_sales_order_tax` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_order_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_order_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_order_tax_item`
--

DROP TABLE IF EXISTS `grocery_bag_sales_order_tax_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_order_tax_item` (
  `tax_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Item Id',
  `tax_id` int(10) unsigned NOT NULL COMMENT 'Tax Id',
  `item_id` int(10) unsigned DEFAULT NULL COMMENT 'Item Id',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item',
  `amount` decimal(12,4) NOT NULL COMMENT 'Tax amount for the item and tax rate',
  `base_amount` decimal(12,4) NOT NULL COMMENT 'Base tax amount for the item and tax rate',
  `real_amount` decimal(12,4) NOT NULL COMMENT 'Real tax amount for the item and tax rate',
  `real_base_amount` decimal(12,4) NOT NULL COMMENT 'Real base tax amount for the item and tax rate',
  `associated_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Id of the associated item',
  `taxable_item_type` varchar(32) NOT NULL COMMENT 'Type of the taxable item',
  PRIMARY KEY (`tax_item_id`),
  UNIQUE KEY `SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  KEY `SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`),
  KEY `SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` (`associated_item_id`),
  CONSTRAINT `SALES_ORDER_TAX_ITEM_ASSOCIATED_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`associated_item_id`) REFERENCES `grocery_bag_sales_order_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_TAX_ITEM_ITEM_ID_SALES_ORDER_ITEM_ITEM_ID` FOREIGN KEY (`item_id`) REFERENCES `grocery_bag_sales_order_item` (`item_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_ORDER_TAX_ITEM_TAX_ID_SALES_ORDER_TAX_TAX_ID` FOREIGN KEY (`tax_id`) REFERENCES `grocery_bag_sales_order_tax` (`tax_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_order_tax_item`
--

LOCK TABLES `grocery_bag_sales_order_tax_item` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_order_tax_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_order_tax_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_payment_transaction`
--

DROP TABLE IF EXISTS `grocery_bag_sales_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transaction Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `payment_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Payment Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn Id',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Closed',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  KEY `SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  KEY `SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`),
  CONSTRAINT `FK_B99FF1A06402D725EBDB0F3A7ECD47A2` FOREIGN KEY (`parent_id`) REFERENCES `grocery_bag_sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_PAYMENT_TRANSACTION_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `grocery_bag_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_PAYMENT_TRANSACTION_PAYMENT_ID_SALES_ORDER_PAYMENT_ENTT_ID` FOREIGN KEY (`payment_id`) REFERENCES `grocery_bag_sales_order_payment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Payment Transaction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_payment_transaction`
--

LOCK TABLES `grocery_bag_sales_payment_transaction` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_refunded_aggregated`
--

DROP TABLE IF EXISTS `grocery_bag_sales_refunded_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_refunded_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_REFUNDED_AGGREGATED_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_REFUNDED_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_refunded_aggregated`
--

LOCK TABLES `grocery_bag_sales_refunded_aggregated` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_refunded_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_refunded_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_refunded_aggregated_order`
--

DROP TABLE IF EXISTS `grocery_bag_sales_refunded_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_refunded_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_REFUNDED_AGGREGATED_ORDER_PERIOD_STORE_ID_ORDER_STATUS` (`period`,`store_id`,`order_status`),
  KEY `SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_refunded_aggregated_order`
--

LOCK TABLES `grocery_bag_sales_refunded_aggregated_order` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_refunded_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_refunded_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_sequence_meta`
--

DROP TABLE IF EXISTS `grocery_bag_sales_sequence_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_sequence_meta` (
  `meta_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity_type` varchar(32) NOT NULL COMMENT 'Prefix',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `sequence_table` varchar(32) NOT NULL COMMENT 'table for sequence',
  PRIMARY KEY (`meta_id`),
  UNIQUE KEY `SALES_SEQUENCE_META_ENTITY_TYPE_STORE_ID` (`entity_type`,`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='grocery_bag_sales_sequence_meta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_sequence_meta`
--

LOCK TABLES `grocery_bag_sales_sequence_meta` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_sequence_meta` DISABLE KEYS */;
INSERT INTO `grocery_bag_sales_sequence_meta` VALUES (1,'order',0,'grocery_bag_sequence_order_0'),(2,'invoice',0,'grocery_bag_sequence_invoice_0'),(3,'creditmemo',0,'grocery_bag_sequence_creditmemo_'),(4,'shipment',0,'grocery_bag_sequence_shipment_0'),(5,'order',1,'grocery_bag_sequence_order_1'),(6,'invoice',1,'grocery_bag_sequence_invoice_1'),(7,'creditmemo',1,'grocery_bag_sequence_creditmemo_'),(8,'shipment',1,'grocery_bag_sequence_shipment_1');
/*!40000 ALTER TABLE `grocery_bag_sales_sequence_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_sequence_profile`
--

DROP TABLE IF EXISTS `grocery_bag_sales_sequence_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_sequence_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `meta_id` int(10) unsigned NOT NULL COMMENT 'Meta_id',
  `prefix` varchar(32) DEFAULT NULL COMMENT 'Prefix',
  `suffix` varchar(32) DEFAULT NULL COMMENT 'Suffix',
  `start_value` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Start value for sequence',
  `step` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Step for sequence',
  `max_value` int(10) unsigned NOT NULL COMMENT 'MaxValue for sequence',
  `warning_value` int(10) unsigned NOT NULL COMMENT 'WarningValue for sequence',
  `is_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'isActive flag',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `SALES_SEQUENCE_PROFILE_META_ID_PREFIX_SUFFIX` (`meta_id`,`prefix`,`suffix`),
  CONSTRAINT `SALES_SEQUENCE_PROFILE_META_ID_SALES_SEQUENCE_META_META_ID` FOREIGN KEY (`meta_id`) REFERENCES `grocery_bag_sales_sequence_meta` (`meta_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='grocery_bag_sales_sequence_profile';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_sequence_profile`
--

LOCK TABLES `grocery_bag_sales_sequence_profile` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_sequence_profile` DISABLE KEYS */;
INSERT INTO `grocery_bag_sales_sequence_profile` VALUES (1,1,NULL,NULL,1,1,4294967295,4294966295,1),(2,2,NULL,NULL,1,1,4294967295,4294966295,1),(3,3,NULL,NULL,1,1,4294967295,4294966295,1),(4,4,NULL,NULL,1,1,4294967295,4294966295,1),(5,5,NULL,NULL,1,1,4294967295,4294966295,1),(6,6,NULL,NULL,1,1,4294967295,4294966295,1),(7,7,NULL,NULL,1,1,4294967295,4294966295,1),(8,8,NULL,NULL,1,1,4294967295,4294966295,1);
/*!40000 ALTER TABLE `grocery_bag_sales_sequence_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_shipment`
--

DROP TABLE IF EXISTS `grocery_bag_sales_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_shipment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `send_email` smallint(5) unsigned DEFAULT NULL COMMENT 'Send Email',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  `packages` text COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob COMMENT 'Shipping Label Content',
  `customer_note` text COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_SHIPMENT_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_SHIPMENT_STORE_ID` (`store_id`),
  KEY `SALES_SHIPMENT_TOTAL_QTY` (`total_qty`),
  KEY `SALES_SHIPMENT_ORDER_ID` (`order_id`),
  KEY `SALES_SHIPMENT_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_UPDATED_AT` (`updated_at`),
  KEY `SALES_SHIPMENT_SEND_EMAIL` (`send_email`),
  KEY `SALES_SHIPMENT_EMAIL_SENT` (`email_sent`),
  CONSTRAINT `SALES_SHIPMENT_ORDER_ID_SALES_ORDER_ENTITY_ID` FOREIGN KEY (`order_id`) REFERENCES `grocery_bag_sales_order` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALES_SHIPMENT_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_shipment`
--

LOCK TABLES `grocery_bag_sales_shipment` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_shipment_comment`
--

DROP TABLE IF EXISTS `grocery_bag_sales_shipment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_shipment_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_SHIPMENT_COMMENT_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `grocery_bag_sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_shipment_comment`
--

LOCK TABLES `grocery_bag_sales_shipment_comment` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_shipment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_shipment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_shipment_grid`
--

DROP TABLE IF EXISTS `grocery_bag_sales_shipment_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_shipment_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_increment_id` varchar(32) NOT NULL COMMENT 'Order Increment Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `order_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Order Increment Id',
  `customer_name` varchar(128) NOT NULL COMMENT 'Customer Name',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `order_status` varchar(32) DEFAULT NULL COMMENT 'Order',
  `billing_address` varchar(255) DEFAULT NULL COMMENT 'Billing Address',
  `shipping_address` varchar(255) DEFAULT NULL COMMENT 'Shipping Address',
  `billing_name` varchar(128) DEFAULT NULL COMMENT 'Billing Name',
  `shipping_name` varchar(128) DEFAULT NULL COMMENT 'Shipping Name',
  `customer_email` varchar(128) DEFAULT NULL COMMENT 'Customer Email',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `payment_method` varchar(32) DEFAULT NULL COMMENT 'Payment Method',
  `shipping_information` varchar(255) DEFAULT NULL COMMENT 'Shipping Method Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `SALES_SHIPMENT_GRID_INCREMENT_ID_STORE_ID` (`increment_id`,`store_id`),
  KEY `SALES_SHIPMENT_GRID_STORE_ID` (`store_id`),
  KEY `SALES_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  KEY `SALES_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `SALES_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  KEY `SALES_SHIPMENT_GRID_ORDER_STATUS` (`order_status`),
  KEY `SALES_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  KEY `SALES_SHIPMENT_GRID_UPDATED_AT` (`updated_at`),
  KEY `SALES_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `SALES_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `SALES_SHIPMENT_GRID_BILLING_NAME` (`billing_name`),
  FULLTEXT KEY `FTI_086B40C8955F167B8EA76653437879B4` (`increment_id`,`order_increment_id`,`shipping_name`,`customer_name`,`customer_email`,`billing_address`,`shipping_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_shipment_grid`
--

LOCK TABLES `grocery_bag_sales_shipment_grid` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_shipment_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_shipment_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_shipment_item`
--

DROP TABLE IF EXISTS `grocery_bag_sales_shipment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_shipment_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `SALES_SHIPMENT_ITEM_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `grocery_bag_sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_shipment_item`
--

LOCK TABLES `grocery_bag_sales_shipment_item` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_shipment_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_shipment_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_shipment_track`
--

DROP TABLE IF EXISTS `grocery_bag_sales_shipment_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_shipment_track` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `track_number` text COMMENT 'Number',
  `description` text COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  KEY `SALES_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  KEY `SALES_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  KEY `SALES_SHIPMENT_TRACK_CREATED_AT` (`created_at`),
  CONSTRAINT `SALES_SHIPMENT_TRACK_PARENT_ID_SALES_SHIPMENT_ENTITY_ID` FOREIGN KEY (`parent_id`) REFERENCES `grocery_bag_sales_shipment` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Track';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_shipment_track`
--

LOCK TABLES `grocery_bag_sales_shipment_track` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_shipment_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_shipment_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_shipping_aggregated`
--

DROP TABLE IF EXISTS `grocery_bag_sales_shipping_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_shipping_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALES_SHPP_AGGRED_PERIOD_STORE_ID_ORDER_STS_SHPP_DESCRIPTION` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_SHIPPING_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_shipping_aggregated`
--

LOCK TABLES `grocery_bag_sales_shipping_aggregated` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_shipping_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_shipping_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sales_shipping_aggregated_order`
--

DROP TABLE IF EXISTS `grocery_bag_sales_shipping_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sales_shipping_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_C05FAE47282EEA68654D0924E946761F` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sales_shipping_aggregated_order`
--

LOCK TABLES `grocery_bag_sales_shipping_aggregated_order` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sales_shipping_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sales_shipping_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_salesrule`
--

DROP TABLE IF EXISTS `grocery_bag_salesrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_salesrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From',
  `to_date` date DEFAULT NULL COMMENT 'To',
  `uses_per_customer` int(11) NOT NULL DEFAULT '0' COMMENT 'Uses Per Customer',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `is_advanced` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Advanced',
  `product_ids` text COMMENT 'Product Ids',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int(10) unsigned NOT NULL COMMENT 'Discount Step',
  `apply_to_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Apply To Shipping',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `is_rss` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Rss',
  `coupon_type` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Coupon Type',
  `use_auto_generation` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Use Auto Generation',
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0' COMMENT 'User Per Coupon',
  `simple_free_shipping` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`rule_id`),
  KEY `SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_salesrule`
--

LOCK TABLES `grocery_bag_salesrule` WRITE;
/*!40000 ALTER TABLE `grocery_bag_salesrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_salesrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_salesrule_coupon`
--

DROP TABLE IF EXISTS `grocery_bag_salesrule_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_salesrule_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Coupon Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int(10) unsigned DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int(10) unsigned DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `expiration_date` timestamp NULL DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Coupon Code Creation Date',
  `type` smallint(6) DEFAULT '0' COMMENT 'Coupon Code Type',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `SALESRULE_COUPON_CODE` (`code`),
  UNIQUE KEY `SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  KEY `SALESRULE_COUPON_RULE_ID` (`rule_id`),
  CONSTRAINT `SALESRULE_COUPON_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `grocery_bag_salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_salesrule_coupon`
--

LOCK TABLES `grocery_bag_salesrule_coupon` WRITE;
/*!40000 ALTER TABLE `grocery_bag_salesrule_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_salesrule_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_salesrule_coupon_aggregated`
--

DROP TABLE IF EXISTS `grocery_bag_salesrule_coupon_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_salesrule_coupon_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `SALESRULE_COUPON_AGGRED_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `SALESRULE_COUPON_AGGREGATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_salesrule_coupon_aggregated`
--

LOCK TABLES `grocery_bag_salesrule_coupon_aggregated` WRITE;
/*!40000 ALTER TABLE `grocery_bag_salesrule_coupon_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_salesrule_coupon_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_salesrule_coupon_aggregated_order`
--

DROP TABLE IF EXISTS `grocery_bag_salesrule_coupon_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_salesrule_coupon_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_1094D1FBBCBB11704A29DEF3ACC37D2B` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  KEY `SALESRULE_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`),
  CONSTRAINT `SALESRULE_COUPON_AGGREGATED_ORDER_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_salesrule_coupon_aggregated_order`
--

LOCK TABLES `grocery_bag_salesrule_coupon_aggregated_order` WRITE;
/*!40000 ALTER TABLE `grocery_bag_salesrule_coupon_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_salesrule_coupon_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_salesrule_coupon_aggregated_updated`
--

DROP TABLE IF EXISTS `grocery_bag_salesrule_coupon_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_salesrule_coupon_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_666953BE863268C5ECE76E0CB390352A` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `GROCERY_BAG_SALESRULE_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  KEY `GROCERY_BAG_SALESRULE_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `FK_069046D459C20E1B3242C46153061ABD` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grocery Bag Salesrule Coupon Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_salesrule_coupon_aggregated_updated`
--

LOCK TABLES `grocery_bag_salesrule_coupon_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `grocery_bag_salesrule_coupon_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_salesrule_coupon_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_salesrule_coupon_usage`
--

DROP TABLE IF EXISTS `grocery_bag_salesrule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_salesrule_coupon_usage` (
  `coupon_id` int(10) unsigned NOT NULL COMMENT 'Coupon Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `SALESRULE_COUPON_USAGE_COUPON_ID_SALESRULE_COUPON_COUPON_ID` FOREIGN KEY (`coupon_id`) REFERENCES `grocery_bag_salesrule_coupon` (`coupon_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_COUPON_USAGE_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Usage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_salesrule_coupon_usage`
--

LOCK TABLES `grocery_bag_salesrule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `grocery_bag_salesrule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_salesrule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_salesrule_customer`
--

DROP TABLE IF EXISTS `grocery_bag_salesrule_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `times_used` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`rule_customer_id`),
  KEY `SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  KEY `SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`),
  CONSTRAINT `SALESRULE_CUSTOMER_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_CUSTOMER_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `grocery_bag_salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_salesrule_customer`
--

LOCK TABLES `grocery_bag_salesrule_customer` WRITE;
/*!40000 ALTER TABLE `grocery_bag_salesrule_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_salesrule_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_salesrule_customer_group`
--

DROP TABLE IF EXISTS `grocery_bag_salesrule_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_salesrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `SALESRULE_CSTR_GROUP_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `grocery_bag_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_CUSTOMER_GROUP_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `grocery_bag_salesrule` (`rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Customer Groups Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_salesrule_customer_group`
--

LOCK TABLES `grocery_bag_salesrule_customer_group` WRITE;
/*!40000 ALTER TABLE `grocery_bag_salesrule_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_salesrule_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_salesrule_label`
--

DROP TABLE IF EXISTS `grocery_bag_salesrule_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_salesrule_label` (
  `label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Label Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`),
  KEY `SALESRULE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `SALESRULE_LABEL_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `grocery_bag_salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_LABEL_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_salesrule_label`
--

LOCK TABLES `grocery_bag_salesrule_label` WRITE;
/*!40000 ALTER TABLE `grocery_bag_salesrule_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_salesrule_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_salesrule_product_attribute`
--

DROP TABLE IF EXISTS `grocery_bag_salesrule_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_salesrule_product_attribute` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `SALESRULE_PRD_ATTR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_PRD_ATTR_CSTR_GROUP_ID_CSTR_GROUP_CSTR_GROUP_ID` FOREIGN KEY (`customer_group_id`) REFERENCES `grocery_bag_customer_group` (`customer_group_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_PRODUCT_ATTRIBUTE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `grocery_bag_salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Product Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_salesrule_product_attribute`
--

LOCK TABLES `grocery_bag_salesrule_product_attribute` WRITE;
/*!40000 ALTER TABLE `grocery_bag_salesrule_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_salesrule_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_salesrule_website`
--

DROP TABLE IF EXISTS `grocery_bag_salesrule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_salesrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `SALESRULE_WEBSITE_RULE_ID_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `grocery_bag_salesrule` (`rule_id`) ON DELETE CASCADE,
  CONSTRAINT `SALESRULE_WEBSITE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Websites Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_salesrule_website`
--

LOCK TABLES `grocery_bag_salesrule_website` WRITE;
/*!40000 ALTER TABLE `grocery_bag_salesrule_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_salesrule_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_search_query`
--

DROP TABLE IF EXISTS `grocery_bag_search_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_search_query` (
  `query_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Num results',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `synonym_for` varchar(255) DEFAULT NULL COMMENT 'Synonym for',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `display_in_terms` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Display in terms',
  `is_active` smallint(6) DEFAULT '1' COMMENT 'Active status',
  `is_processed` smallint(6) DEFAULT '0' COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Updated at',
  PRIMARY KEY (`query_id`),
  UNIQUE KEY `SEARCH_QUERY_QUERY_TEXT_STORE_ID` (`query_text`,`store_id`),
  KEY `SEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY` (`query_text`,`store_id`,`popularity`),
  KEY `SEARCH_QUERY_STORE_ID` (`store_id`),
  KEY `SEARCH_QUERY_IS_PROCESSED` (`is_processed`),
  KEY `SEARCH_QUERY_SYNONYM_FOR` (`synonym_for`),
  CONSTRAINT `SEARCH_QUERY_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Search query table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_search_query`
--

LOCK TABLES `grocery_bag_search_query` WRITE;
/*!40000 ALTER TABLE `grocery_bag_search_query` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_search_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sendfriend_log`
--

DROP TABLE IF EXISTS `grocery_bag_sendfriend_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sendfriend_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer IP address',
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Log time',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`log_id`),
  KEY `SENDFRIEND_LOG_IP` (`ip`),
  KEY `SENDFRIEND_LOG_TIME` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sendfriend_log`
--

LOCK TABLES `grocery_bag_sendfriend_log` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sendfriend_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sendfriend_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sequence_creditmemo_0`
--

DROP TABLE IF EXISTS `grocery_bag_sequence_creditmemo_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sequence_creditmemo_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sequence_creditmemo_0`
--

LOCK TABLES `grocery_bag_sequence_creditmemo_0` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sequence_creditmemo_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sequence_creditmemo_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sequence_creditmemo_1`
--

DROP TABLE IF EXISTS `grocery_bag_sequence_creditmemo_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sequence_creditmemo_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sequence_creditmemo_1`
--

LOCK TABLES `grocery_bag_sequence_creditmemo_1` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sequence_creditmemo_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sequence_creditmemo_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sequence_invoice_0`
--

DROP TABLE IF EXISTS `grocery_bag_sequence_invoice_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sequence_invoice_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sequence_invoice_0`
--

LOCK TABLES `grocery_bag_sequence_invoice_0` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sequence_invoice_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sequence_invoice_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sequence_invoice_1`
--

DROP TABLE IF EXISTS `grocery_bag_sequence_invoice_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sequence_invoice_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sequence_invoice_1`
--

LOCK TABLES `grocery_bag_sequence_invoice_1` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sequence_invoice_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sequence_invoice_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sequence_order_0`
--

DROP TABLE IF EXISTS `grocery_bag_sequence_order_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sequence_order_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sequence_order_0`
--

LOCK TABLES `grocery_bag_sequence_order_0` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sequence_order_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sequence_order_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sequence_order_1`
--

DROP TABLE IF EXISTS `grocery_bag_sequence_order_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sequence_order_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sequence_order_1`
--

LOCK TABLES `grocery_bag_sequence_order_1` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sequence_order_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sequence_order_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sequence_shipment_0`
--

DROP TABLE IF EXISTS `grocery_bag_sequence_shipment_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sequence_shipment_0` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sequence_shipment_0`
--

LOCK TABLES `grocery_bag_sequence_shipment_0` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sequence_shipment_0` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sequence_shipment_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sequence_shipment_1`
--

DROP TABLE IF EXISTS `grocery_bag_sequence_shipment_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sequence_shipment_1` (
  `sequence_value` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sequence_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sequence_shipment_1`
--

LOCK TABLES `grocery_bag_sequence_shipment_1` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sequence_shipment_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sequence_shipment_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_session`
--

DROP TABLE IF EXISTS `grocery_bag_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_session` (
  `session_id` varchar(255) NOT NULL COMMENT 'Session Id',
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Database Sessions Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_session`
--

LOCK TABLES `grocery_bag_session` WRITE;
/*!40000 ALTER TABLE `grocery_bag_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_setup_module`
--

DROP TABLE IF EXISTS `grocery_bag_setup_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_setup_module` (
  `module` varchar(50) NOT NULL COMMENT 'Module',
  `schema_version` varchar(50) DEFAULT NULL COMMENT 'Schema Version',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data Version',
  PRIMARY KEY (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Module versions registry';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_setup_module`
--

LOCK TABLES `grocery_bag_setup_module` WRITE;
/*!40000 ALTER TABLE `grocery_bag_setup_module` DISABLE KEYS */;
INSERT INTO `grocery_bag_setup_module` VALUES ('Magento_AdminNotification','2.0.0','2.0.0'),('Magento_AdvancedPricingImportExport','2.0.0','2.0.0'),('Magento_Authorization','2.0.0','2.0.0'),('Magento_Authorizenet','2.0.0','2.0.0'),('Magento_Backend','2.0.0','2.0.0'),('Magento_Backup','2.0.0','2.0.0'),('Magento_Braintree','2.0.0','2.0.0'),('Magento_Bundle','2.0.1','2.0.1'),('Magento_BundleImportExport','2.0.0','2.0.0'),('Magento_CacheInvalidate','2.0.0','2.0.0'),('Magento_Captcha','2.0.0','2.0.0'),('Magento_Catalog','2.0.1','2.0.1'),('Magento_CatalogImportExport','2.0.0','2.0.0'),('Magento_CatalogInventory','2.0.0','2.0.0'),('Magento_CatalogRule','2.0.0','2.0.0'),('Magento_CatalogRuleConfigurable','2.0.0','2.0.0'),('Magento_CatalogSearch','2.0.0','2.0.0'),('Magento_CatalogUrlRewrite','2.0.0','2.0.0'),('Magento_CatalogWidget','2.0.0','2.0.0'),('Magento_Checkout','2.0.0','2.0.0'),('Magento_CheckoutAgreements','2.0.1','2.0.1'),('Magento_Cms','2.0.0','2.0.0'),('Magento_CmsUrlRewrite','2.0.0','2.0.0'),('Magento_Config','2.0.0','2.0.0'),('Magento_ConfigurableImportExport','2.0.0','2.0.0'),('Magento_ConfigurableProduct','2.0.0','2.0.0'),('Magento_Contact','2.0.0','2.0.0'),('Magento_Cookie','2.0.0','2.0.0'),('Magento_Cron','2.0.0','2.0.0'),('Magento_CurrencySymbol','2.0.0','2.0.0'),('Magento_Customer','2.0.5','2.0.5'),('Magento_CustomerImportExport','2.0.0','2.0.0'),('Magento_Deploy','2.0.0','2.0.0'),('Magento_Developer','2.0.0','2.0.0'),('Magento_Dhl','2.0.0','2.0.0'),('Magento_Directory','2.0.0','2.0.0'),('Magento_Downloadable','2.0.0','2.0.0'),('Magento_DownloadableImportExport','2.0.0','2.0.0'),('Magento_Eav','2.0.0','2.0.0'),('Magento_Email','2.0.0','2.0.0'),('Magento_EncryptionKey','2.0.0','2.0.0'),('Magento_Fedex','2.0.0','2.0.0'),('Magento_GiftMessage','2.0.0','2.0.0'),('Magento_GoogleAdwords','2.0.0','2.0.0'),('Magento_GoogleAnalytics','2.0.0','2.0.0'),('Magento_GoogleOptimizer','2.0.0','2.0.0'),('Magento_GroupedImportExport','2.0.0','2.0.0'),('Magento_GroupedProduct','2.0.0','2.0.0'),('Magento_ImportExport','2.0.1','2.0.1'),('Magento_Indexer','2.0.0','2.0.0'),('Magento_Integration','2.0.0','2.0.0'),('Magento_LayeredNavigation','2.0.0','2.0.0'),('Magento_Marketplace','1.0.0','1.0.0'),('Magento_MediaStorage','2.0.0','2.0.0'),('Magento_Msrp','2.0.0','2.0.0'),('Magento_Multishipping','2.0.0','2.0.0'),('Magento_NewRelicReporting','2.0.0','2.0.0'),('Magento_Newsletter','2.0.0','2.0.0'),('Magento_OfflinePayments','2.0.0','2.0.0'),('Magento_OfflineShipping','2.0.0','2.0.0'),('Magento_PageCache','2.0.0','2.0.0'),('Magento_Payment','2.0.0','2.0.0'),('Magento_Paypal','2.0.0','2.0.0'),('Magento_Persistent','2.0.0','2.0.0'),('Magento_ProductAlert','2.0.0','2.0.0'),('Magento_ProductVideo','2.0.0.1','2.0.0.1'),('Magento_Quote','2.0.0','2.0.0'),('Magento_Reports','2.0.0','2.0.0'),('Magento_RequireJs','2.0.0','2.0.0'),('Magento_Review','2.0.0','2.0.0'),('Magento_Rss','2.0.0','2.0.0'),('Magento_Rule','2.0.0','2.0.0'),('Magento_Sales','2.0.0','2.0.0'),('Magento_SalesRule','2.0.0','2.0.0'),('Magento_SalesSequence','2.0.0','2.0.0'),('Magento_SampleData','2.0.0','2.0.0'),('Magento_Search','2.0.1','2.0.1'),('Magento_SendFriend','2.0.0','2.0.0'),('Magento_Shipping','2.0.0','2.0.0'),('Magento_Sitemap','2.0.0','2.0.0'),('Magento_Store','2.0.0','2.0.0'),('Magento_Swagger','2.0.0','2.0.0'),('Magento_Swatches','2.0.0','2.0.0'),('Magento_Tax','2.0.1','2.0.1'),('Magento_TaxImportExport','2.0.0','2.0.0'),('Magento_Theme','2.0.0','2.0.0'),('Magento_Translation','2.0.0','2.0.0'),('Magento_Ui','2.0.0','2.0.0'),('Magento_Ups','2.0.0','2.0.0'),('Magento_UrlRewrite','2.0.0','2.0.0'),('Magento_User','2.0.1','2.0.1'),('Magento_Usps','2.0.0','2.0.0'),('Magento_Variable','2.0.0','2.0.0'),('Magento_Version','2.0.0','2.0.0'),('Magento_Webapi','2.0.0','2.0.0'),('Magento_Weee','2.0.0','2.0.0'),('Magento_Widget','2.0.0','2.0.0'),('Magento_Wishlist','2.0.0','2.0.0');
/*!40000 ALTER TABLE `grocery_bag_setup_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_shipping_tablerate`
--

DROP TABLE IF EXISTS `grocery_bag_shipping_tablerate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `website_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Destination Region Id',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(20) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Cost',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `UNQ_D60821CDB2AFACEE1566CFC02D0D4CAA` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shipping Tablerate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_shipping_tablerate`
--

LOCK TABLES `grocery_bag_shipping_tablerate` WRITE;
/*!40000 ALTER TABLE `grocery_bag_shipping_tablerate` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_shipping_tablerate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_sitemap`
--

DROP TABLE IF EXISTS `grocery_bag_sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_sitemap` (
  `sitemap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sitemap Id',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`sitemap_id`),
  KEY `SITEMAP_STORE_ID` (`store_id`),
  CONSTRAINT `SITEMAP_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='XML Sitemap';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_sitemap`
--

LOCK TABLES `grocery_bag_sitemap` WRITE;
/*!40000 ALTER TABLE `grocery_bag_sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_store`
--

DROP TABLE IF EXISTS `grocery_bag_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_store` (
  `store_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Store Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Sort Order',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Activity',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `STORE_CODE` (`code`),
  KEY `STORE_WEBSITE_ID` (`website_id`),
  KEY `STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  KEY `STORE_GROUP_ID` (`group_id`),
  CONSTRAINT `STORE_GROUP_ID_STORE_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `grocery_bag_store_group` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `STORE_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_store`
--

LOCK TABLES `grocery_bag_store` WRITE;
/*!40000 ALTER TABLE `grocery_bag_store` DISABLE KEYS */;
INSERT INTO `grocery_bag_store` VALUES (0,'admin',0,0,'Admin',0,1),(1,'default',1,1,'Default Store View',0,1);
/*!40000 ALTER TABLE `grocery_bag_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_store_group`
--

DROP TABLE IF EXISTS `grocery_bag_store_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_store_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Root Category Id',
  `default_store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Store Id',
  PRIMARY KEY (`group_id`),
  KEY `STORE_GROUP_WEBSITE_ID` (`website_id`),
  KEY `STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`),
  CONSTRAINT `STORE_GROUP_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Store Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_store_group`
--

LOCK TABLES `grocery_bag_store_group` WRITE;
/*!40000 ALTER TABLE `grocery_bag_store_group` DISABLE KEYS */;
INSERT INTO `grocery_bag_store_group` VALUES (0,0,'Default',0,0),(1,1,'Main Website Store',2,1);
/*!40000 ALTER TABLE `grocery_bag_store_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_store_website`
--

DROP TABLE IF EXISTS `grocery_bag_store_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_store_website` (
  `website_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Website Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Group Id',
  `is_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Defines Is Website Default',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `STORE_WEBSITE_CODE` (`code`),
  KEY `STORE_WEBSITE_SORT_ORDER` (`sort_order`),
  KEY `STORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Websites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_store_website`
--

LOCK TABLES `grocery_bag_store_website` WRITE;
/*!40000 ALTER TABLE `grocery_bag_store_website` DISABLE KEYS */;
INSERT INTO `grocery_bag_store_website` VALUES (0,'admin','Admin',0,0,0),(1,'base','Main Website',0,1,1);
/*!40000 ALTER TABLE `grocery_bag_store_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_tax_calculation`
--

DROP TABLE IF EXISTS `grocery_bag_tax_calculation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_tax_calculation` (
  `tax_calculation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `tax_calculation_rule_id` int(11) NOT NULL COMMENT 'Tax Calculation Rule Id',
  `customer_tax_class_id` smallint(6) NOT NULL COMMENT 'Customer Tax Class Id',
  `product_tax_class_id` smallint(6) NOT NULL COMMENT 'Product Tax Class Id',
  PRIMARY KEY (`tax_calculation_id`),
  KEY `TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  KEY `TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  KEY `TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  KEY `TAX_CALC_TAX_CALC_RATE_ID_CSTR_TAX_CLASS_ID_PRD_TAX_CLASS_ID` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`),
  CONSTRAINT `TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `grocery_bag_tax_class` (`class_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALCULATION_PRODUCT_TAX_CLASS_ID_TAX_CLASS_CLASS_ID` FOREIGN KEY (`product_tax_class_id`) REFERENCES `grocery_bag_tax_class` (`class_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALC_TAX_CALC_RATE_ID_TAX_CALC_RATE_TAX_CALC_RATE_ID` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `grocery_bag_tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALC_TAX_CALC_RULE_ID_TAX_CALC_RULE_TAX_CALC_RULE_ID` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `grocery_bag_tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_tax_calculation`
--

LOCK TABLES `grocery_bag_tax_calculation` WRITE;
/*!40000 ALTER TABLE `grocery_bag_tax_calculation` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_tax_calculation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_tax_calculation_rate`
--

DROP TABLE IF EXISTS `grocery_bag_tax_calculation_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Id',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country Id',
  `tax_region_id` int(11) NOT NULL COMMENT 'Tax Region Id',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint(6) DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int(10) unsigned DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int(10) unsigned DEFAULT NULL COMMENT 'Zip To',
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `TAX_CALCULATION_RATE_TAX_COUNTRY_ID_TAX_REGION_ID_TAX_POSTCODE` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `IDX_CA799F1E2CB843495F601E56C84A626D` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_tax_calculation_rate`
--

LOCK TABLES `grocery_bag_tax_calculation_rate` WRITE;
/*!40000 ALTER TABLE `grocery_bag_tax_calculation_rate` DISABLE KEYS */;
INSERT INTO `grocery_bag_tax_calculation_rate` VALUES (1,'US',12,'*','US-CA-*-Rate 1',8.2500,NULL,NULL,NULL),(2,'US',43,'*','US-NY-*-Rate 1',8.3750,NULL,NULL,NULL);
/*!40000 ALTER TABLE `grocery_bag_tax_calculation_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_tax_calculation_rate_title`
--

DROP TABLE IF EXISTS `grocery_bag_tax_calculation_rate_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  KEY `TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_37FB965F786AD5897BB3AE90470C42AB` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `grocery_bag_tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE,
  CONSTRAINT `TAX_CALCULATION_RATE_TITLE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate Title';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_tax_calculation_rate_title`
--

LOCK TABLES `grocery_bag_tax_calculation_rate_title` WRITE;
/*!40000 ALTER TABLE `grocery_bag_tax_calculation_rate_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_tax_calculation_rate_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_tax_calculation_rule`
--

DROP TABLE IF EXISTS `grocery_bag_tax_calculation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `calculate_subtotal` int(11) NOT NULL COMMENT 'Calculate off subtotal option',
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `TAX_CALCULATION_RULE_PRIORITY_POSITION` (`priority`,`position`),
  KEY `TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_tax_calculation_rule`
--

LOCK TABLES `grocery_bag_tax_calculation_rule` WRITE;
/*!40000 ALTER TABLE `grocery_bag_tax_calculation_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_tax_calculation_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_tax_class`
--

DROP TABLE IF EXISTS `grocery_bag_tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_tax_class` (
  `class_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Class Id',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Tax Class';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_tax_class`
--

LOCK TABLES `grocery_bag_tax_class` WRITE;
/*!40000 ALTER TABLE `grocery_bag_tax_class` DISABLE KEYS */;
INSERT INTO `grocery_bag_tax_class` VALUES (2,'Taxable Goods','PRODUCT'),(3,'Retail Customer','CUSTOMER');
/*!40000 ALTER TABLE `grocery_bag_tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_tax_order_aggregated_created`
--

DROP TABLE IF EXISTS `grocery_bag_tax_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_tax_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `TAX_ORDER_AGGRED_CREATED_PERIOD_STORE_ID_CODE_PERCENT_ORDER_STS` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `TAX_ORDER_AGGREGATED_CREATED_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_tax_order_aggregated_created`
--

LOCK TABLES `grocery_bag_tax_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `grocery_bag_tax_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_tax_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_tax_order_aggregated_updated`
--

DROP TABLE IF EXISTS `grocery_bag_tax_order_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_tax_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_AF40DB4A2DB51E62E7353336ACC17257` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `GROCERY_BAG_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_FC85DA1BDAA24C29D93E5BAE57345B76` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grocery Bag Tax Order Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_tax_order_aggregated_updated`
--

LOCK TABLES `grocery_bag_tax_order_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `grocery_bag_tax_order_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_tax_order_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_theme`
--

DROP TABLE IF EXISTS `grocery_bag_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_theme` (
  `theme_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme identifier',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Parent Id',
  `theme_path` varchar(255) DEFAULT NULL COMMENT 'Theme Path',
  `theme_title` varchar(255) NOT NULL COMMENT 'Theme Title',
  `preview_image` varchar(255) DEFAULT NULL COMMENT 'Preview Image',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Theme Featured',
  `area` varchar(255) NOT NULL COMMENT 'Theme Area',
  `type` smallint(6) NOT NULL COMMENT 'Theme type: 0:physical, 1:virtual, 2:staging',
  `code` text COMMENT 'Full theme code, including package',
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Core theme';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_theme`
--

LOCK TABLES `grocery_bag_theme` WRITE;
/*!40000 ALTER TABLE `grocery_bag_theme` DISABLE KEYS */;
INSERT INTO `grocery_bag_theme` VALUES (1,NULL,'Magento/backend','Magento 2 backend',NULL,0,'adminhtml',0,'Magento/backend'),(2,NULL,'Magento/blank','Magento Blank','preview_image_561f4fcc27406.jpeg',0,'frontend',0,'Magento/blank'),(3,2,'Magento/luma','Magento Luma','preview_image_561f4fcc37d73.jpeg',0,'frontend',0,'Magento/luma');
/*!40000 ALTER TABLE `grocery_bag_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_theme_file`
--

DROP TABLE IF EXISTS `grocery_bag_theme_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_theme_file` (
  `theme_files_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Theme files identifier',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme Id',
  `file_path` varchar(255) DEFAULT NULL COMMENT 'Relative path to file',
  `file_type` varchar(32) NOT NULL COMMENT 'File Type',
  `content` longtext NOT NULL COMMENT 'File Content',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `is_temporary` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is Temporary File',
  PRIMARY KEY (`theme_files_id`),
  KEY `THEME_FILE_THEME_ID_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `THEME_FILE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `grocery_bag_theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Core theme files';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_theme_file`
--

LOCK TABLES `grocery_bag_theme_file` WRITE;
/*!40000 ALTER TABLE `grocery_bag_theme_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_theme_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_translation`
--

DROP TABLE IF EXISTS `grocery_bag_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_translation` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key Id of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  `crc_string` bigint(20) NOT NULL DEFAULT '1591228201' COMMENT 'Translation String CRC32 Hash',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `TRANSLATION_STORE_ID_LOCALE_CRC_STRING_STRING` (`store_id`,`locale`,`crc_string`,`string`),
  CONSTRAINT `TRANSLATION_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_translation`
--

LOCK TABLES `grocery_bag_translation` WRITE;
/*!40000 ALTER TABLE `grocery_bag_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_ui_bookmark`
--

DROP TABLE IF EXISTS `grocery_bag_ui_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_ui_bookmark` (
  `bookmark_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Bookmark identifier',
  `user_id` int(10) unsigned NOT NULL COMMENT 'User Id',
  `namespace` varchar(255) NOT NULL COMMENT 'Bookmark namespace',
  `identifier` varchar(255) NOT NULL COMMENT 'Bookmark Identifier',
  `current` smallint(6) NOT NULL COMMENT 'Mark current bookmark per user and identifier',
  `title` varchar(255) DEFAULT NULL COMMENT 'Bookmark title',
  `config` longtext COMMENT 'Bookmark config',
  `created_at` datetime NOT NULL COMMENT 'Bookmark created at',
  `updated_at` datetime NOT NULL COMMENT 'Bookmark updated at',
  PRIMARY KEY (`bookmark_id`),
  KEY `UI_BOOKMARK_USER_ID_NAMESPACE_IDENTIFIER` (`user_id`,`namespace`,`identifier`),
  CONSTRAINT `UI_BOOKMARK_USER_ID_ADMIN_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `admin_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='Bookmark';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_ui_bookmark`
--

LOCK TABLES `grocery_bag_ui_bookmark` WRITE;
/*!40000 ALTER TABLE `grocery_bag_ui_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_ui_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_url_rewrite`
--

DROP TABLE IF EXISTS `grocery_bag_url_rewrite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rewrite Id',
  `entity_type` varchar(32) NOT NULL COMMENT 'Entity type code',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `redirect_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Redirect Type',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description',
  `is_autogenerated` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is rewrite generated automatically flag',
  `metadata` varchar(255) DEFAULT NULL COMMENT 'Meta data for url rewrite',
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  KEY `URL_REWRITE_TARGET_PATH` (`target_path`),
  KEY `URL_REWRITE_STORE_ID_ENTITY_ID` (`store_id`,`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3582 DEFAULT CHARSET=utf8 COMMENT='Url Rewrites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_url_rewrite`
--

LOCK TABLES `grocery_bag_url_rewrite` WRITE;
/*!40000 ALTER TABLE `grocery_bag_url_rewrite` DISABLE KEYS */;
INSERT INTO `grocery_bag_url_rewrite` VALUES (1,'cms-page',1,'no-route','cms/page/view/page_id/1',0,1,NULL,1,NULL),(2,'cms-page',2,'home','cms/page/view/page_id/2',0,1,NULL,1,NULL),(3,'cms-page',3,'enable-cookies','cms/page/view/page_id/3',0,1,NULL,1,NULL),(4,'cms-page',4,'privacy-policy-cookie-restriction-mode','cms/page/view/page_id/4',0,1,NULL,1,NULL),(21,'category',1337,'/rusk-biscuits.html','catalog/category/view/id/1337',0,1,NULL,1,NULL),(22,'category',1338,'/unclassified.html','catalog/category/view/id/1338',0,1,NULL,1,NULL),(1590,'product',26,'enfamil-a-stage-2-milk-powder-tin-800g.html','catalog/product/view/id/26',0,1,NULL,1,NULL),(1591,'product',26,'/enfamil-a-stage-2-milk-powder-tin-800g.html','catalog/product/view/id/26/category/886',0,1,NULL,1,'a:1:{s:11:\"category_id\";s:3:\"886\";}'),(1593,'product',27,'enfagrow-a-growing-milk-vani-800g.html','catalog/product/view/id/27',0,1,NULL,1,NULL),(1594,'product',27,'/enfagrow-a-growing-milk-vani-800g.html','catalog/product/view/id/27/category/886',0,1,NULL,1,'a:1:{s:11:\"category_id\";s:3:\"886\";}'),(1596,'product',28,'enfagrow-a-4-tin-800g.html','catalog/product/view/id/28',0,1,NULL,1,NULL),(1597,'product',28,'/enfagrow-a-4-tin-800g.html','catalog/product/view/id/28/category/886',0,1,NULL,1,'a:1:{s:11:\"category_id\";s:3:\"886\";}'),(1599,'product',29,'enfamil-a-2-milk-powder-400g.html','catalog/product/view/id/29',0,1,NULL,1,NULL),(1600,'product',29,'/enfamil-a-2-milk-powder-400g.html','catalog/product/view/id/29/category/886',0,1,NULL,1,'a:1:{s:11:\"category_id\";s:3:\"886\";}'),(1602,'product',30,'anchor-pediapro-2-5-year-child-1kg.html','catalog/product/view/id/30',0,1,NULL,1,NULL),(1603,'product',30,'/anchor-pediapro-2-5-year-child-1kg.html','catalog/product/view/id/30/category/886',0,1,NULL,1,'a:1:{s:11:\"category_id\";s:3:\"886\";}'),(1605,'product',31,'enfagrow-a-growing-milk-vani-400g.html','catalog/product/view/id/31',0,1,NULL,1,NULL),(1606,'product',31,'/enfagrow-a-growing-milk-vani-400g.html','catalog/product/view/id/31/category/886',0,1,NULL,1,'a:1:{s:11:\"category_id\";s:3:\"886\";}'),(1608,'product',32,'nan-stage-2-h-a-milk-powder-400g.html','catalog/product/view/id/32',0,1,NULL,1,NULL),(1609,'product',32,'/nan-stage-2-h-a-milk-powder-400g.html','catalog/product/view/id/32/category/886',0,1,NULL,1,'a:1:{s:11:\"category_id\";s:3:\"886\";}'),(1611,'product',33,'enfagrow-a-4-tin-400g.html','catalog/product/view/id/33',0,1,NULL,1,NULL),(1612,'product',33,'/enfagrow-a-4-tin-400g.html','catalog/product/view/id/33/category/886',0,1,NULL,1,'a:1:{s:11:\"category_id\";s:3:\"886\";}'),(1614,'product',34,'sma-gold-3-milk-powder-tin-400g.html','catalog/product/view/id/34',0,1,NULL,1,NULL),(1615,'product',34,'/sma-gold-3-milk-powder-tin-400g.html','catalog/product/view/id/34/category/886',0,1,NULL,1,'a:1:{s:11:\"category_id\";s:3:\"886\";}'),(1617,'product',35,'cow-gate-premium-400g.html','catalog/product/view/id/35',0,1,NULL,1,NULL),(1618,'product',35,'/cow-gate-premium-400g.html','catalog/product/view/id/35/category/886',0,1,NULL,1,'a:1:{s:11:\"category_id\";s:3:\"886\";}'),(1620,'product',36,'nan-stage-3-milk-powder-tin-400g.html','catalog/product/view/id/36',0,1,NULL,1,NULL),(1621,'product',36,'/nan-stage-3-milk-powder-tin-400g.html','catalog/product/view/id/36/category/886',0,1,NULL,1,'a:1:{s:11:\"category_id\";s:3:\"886\";}'),(1622,'category',886,'.html','catalog/category/view/id/886',0,1,NULL,1,NULL),(1623,'product',37,'sma-gold-1-milk-powder-tin-400g.html','catalog/product/view/id/37',0,1,NULL,1,NULL),(1624,'product',37,'/sma-gold-1-milk-powder-tin-400g.html','catalog/product/view/id/37/category/886',0,1,NULL,1,'a:1:{s:11:\"category_id\";s:3:\"886\";}'),(3563,'category',887,'cereals.html','catalog/category/view/id/887',0,1,NULL,1,NULL),(3572,'category',1339,'asdasdasd.html','catalog/category/view/id/1339',0,1,NULL,1,NULL),(3579,'category',1340,'/dfgdfg.html','catalog/category/view/id/1340',0,1,NULL,1,NULL);
/*!40000 ALTER TABLE `grocery_bag_url_rewrite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_variable`
--

DROP TABLE IF EXISTS `grocery_bag_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_variable` (
  `variable_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `VARIABLE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_variable`
--

LOCK TABLES `grocery_bag_variable` WRITE;
/*!40000 ALTER TABLE `grocery_bag_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_variable_value`
--

DROP TABLE IF EXISTS `grocery_bag_variable_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_variable_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Value Id',
  `variable_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Variable Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `plain_value` text COMMENT 'Plain Text Value',
  `html_value` text COMMENT 'Html Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  KEY `VARIABLE_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `VARIABLE_VALUE_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE CASCADE,
  CONSTRAINT `VARIABLE_VALUE_VARIABLE_ID_VARIABLE_VARIABLE_ID` FOREIGN KEY (`variable_id`) REFERENCES `grocery_bag_variable` (`variable_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_variable_value`
--

LOCK TABLES `grocery_bag_variable_value` WRITE;
/*!40000 ALTER TABLE `grocery_bag_variable_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_variable_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_weee_tax`
--

DROP TABLE IF EXISTS `grocery_bag_weee_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_weee_tax` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT 'State',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`value_id`),
  KEY `WEEE_TAX_WEBSITE_ID` (`website_id`),
  KEY `WEEE_TAX_ENTITY_ID` (`entity_id`),
  KEY `WEEE_TAX_COUNTRY` (`country`),
  KEY `WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `WEEE_TAX_ATTRIBUTE_ID_EAV_ATTRIBUTE_ATTRIBUTE_ID` FOREIGN KEY (`attribute_id`) REFERENCES `grocery_bag_eav_attribute` (`attribute_id`) ON DELETE CASCADE,
  CONSTRAINT `WEEE_TAX_COUNTRY_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country`) REFERENCES `grocery_bag_directory_country` (`country_id`) ON DELETE CASCADE,
  CONSTRAINT `WEEE_TAX_ENTITY_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `WEEE_TAX_WEBSITE_ID_STORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `grocery_bag_store_website` (`website_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Tax';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_weee_tax`
--

LOCK TABLES `grocery_bag_weee_tax` WRITE;
/*!40000 ALTER TABLE `grocery_bag_weee_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_weee_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_widget`
--

DROP TABLE IF EXISTS `grocery_bag_widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_widget` (
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Widget Id',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text COMMENT 'Parameters',
  PRIMARY KEY (`widget_id`),
  KEY `WIDGET_WIDGET_CODE` (`widget_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_widget`
--

LOCK TABLES `grocery_bag_widget` WRITE;
/*!40000 ALTER TABLE `grocery_bag_widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_widget_instance`
--

DROP TABLE IF EXISTS `grocery_bag_widget_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_widget_instance` (
  `instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Instance Id',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `theme_id` int(10) unsigned NOT NULL COMMENT 'Theme id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text COMMENT 'Widget parameters',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  PRIMARY KEY (`instance_id`),
  KEY `WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` (`theme_id`),
  CONSTRAINT `WIDGET_INSTANCE_THEME_ID_THEME_THEME_ID` FOREIGN KEY (`theme_id`) REFERENCES `grocery_bag_theme` (`theme_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of Widget for Package Theme';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_widget_instance`
--

LOCK TABLES `grocery_bag_widget_instance` WRITE;
/*!40000 ALTER TABLE `grocery_bag_widget_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_widget_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_widget_instance_page`
--

DROP TABLE IF EXISTS `grocery_bag_widget_instance_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_widget_instance_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Page Id',
  `instance_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Id',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Container',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template',
  PRIMARY KEY (`page_id`),
  KEY `WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`),
  CONSTRAINT `WIDGET_INSTANCE_PAGE_INSTANCE_ID_WIDGET_INSTANCE_INSTANCE_ID` FOREIGN KEY (`instance_id`) REFERENCES `grocery_bag_widget_instance` (`instance_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instance of Widget on Page';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_widget_instance_page`
--

LOCK TABLES `grocery_bag_widget_instance_page` WRITE;
/*!40000 ALTER TABLE `grocery_bag_widget_instance_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_widget_instance_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_widget_instance_page_layout`
--

DROP TABLE IF EXISTS `grocery_bag_widget_instance_page_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_widget_instance_page_layout` (
  `page_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Page Id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  UNIQUE KEY `WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID_PAGE_ID` (`layout_update_id`,`page_id`),
  KEY `WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`),
  CONSTRAINT `WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID_WIDGET_INSTANCE_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `grocery_bag_widget_instance_page` (`page_id`) ON DELETE CASCADE,
  CONSTRAINT `WIDGET_INSTANCE_PAGE_LYT_LYT_UPDATE_ID_LYT_UPDATE_LYT_UPDATE_ID` FOREIGN KEY (`layout_update_id`) REFERENCES `grocery_bag_layout_update` (`layout_update_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_widget_instance_page_layout`
--

LOCK TABLES `grocery_bag_widget_instance_page_layout` WRITE;
/*!40000 ALTER TABLE `grocery_bag_widget_instance_page_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_widget_instance_page_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_wishlist`
--

DROP TABLE IF EXISTS `grocery_bag_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `shared` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date',
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `WISHLIST_SHARED` (`shared`),
  CONSTRAINT `WISHLIST_CUSTOMER_ID_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `grocery_bag_customer_entity` (`entity_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist main Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_wishlist`
--

LOCK TABLES `grocery_bag_wishlist` WRITE;
/*!40000 ALTER TABLE `grocery_bag_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_wishlist_item`
--

DROP TABLE IF EXISTS `grocery_bag_wishlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID',
  `wishlist_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Wishlist ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty',
  PRIMARY KEY (`wishlist_item_id`),
  KEY `WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  KEY `WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  KEY `WISHLIST_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `WISHLIST_ITEM_PRODUCT_ID_CATALOG_PRODUCT_ENTITY_ENTITY_ID` FOREIGN KEY (`product_id`) REFERENCES `grocery_bag_catalog_product_entity` (`entity_id`) ON DELETE CASCADE,
  CONSTRAINT `WISHLIST_ITEM_STORE_ID_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `grocery_bag_store` (`store_id`) ON DELETE SET NULL,
  CONSTRAINT `WISHLIST_ITEM_WISHLIST_ID_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `grocery_bag_wishlist` (`wishlist_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_wishlist_item`
--

LOCK TABLES `grocery_bag_wishlist_item` WRITE;
/*!40000 ALTER TABLE `grocery_bag_wishlist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_wishlist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocery_bag_wishlist_item_option`
--

DROP TABLE IF EXISTS `grocery_bag_wishlist_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grocery_bag_wishlist_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `wishlist_item_id` int(10) unsigned NOT NULL COMMENT 'Wishlist Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `FK_A014B30B04B72DD0EAB3EECD779728D6` (`wishlist_item_id`),
  CONSTRAINT `FK_A014B30B04B72DD0EAB3EECD779728D6` FOREIGN KEY (`wishlist_item_id`) REFERENCES `grocery_bag_wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist Item Option Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocery_bag_wishlist_item_option`
--

LOCK TABLES `grocery_bag_wishlist_item_option` WRITE;
/*!40000 ALTER TABLE `grocery_bag_wishlist_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `grocery_bag_wishlist_item_option` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-16 16:57:51
