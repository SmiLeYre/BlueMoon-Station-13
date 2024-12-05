--
-- Table structure for table `whitelist`.
--
DROP TABLE IF EXISTS `whitelist_temp`;
--
CREATE TABLE `whitelist_temp` AS SELECT `id`, `ckey` FROM `whitelist`;
--
DROP TABLE IF EXISTS `whitelist`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ckey` varchar(32) NOT NULL,
  `manager` VARCHAR(32) NOT NULL,
  `manager_id` VARCHAR(32) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `last_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
	`comment` VARCHAR(4000),
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ckey` (`ckey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--
INSERT INTO `whitelist` (`id`, `ckey`, `manager`, `manager_id`, `comment`)
SELECT `id`, `ckey`, 'SQL Import Script', '0', 'SQL Import Script' FROM `whitelist_temp`;
--
SELECT IFNULL(MAX(`id`), 0) + 1 INTO @next_auto_increment FROM `whitelist`;
SET @alter_sql = CONCAT('ALTER TABLE `whitelist` AUTO_INCREMENT = ', @next_auto_increment, ';');
PREPARE stmt FROM @alter_sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
--
DROP TABLE IF EXISTS `whitelist_temp`;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `whitelist_log`.
--
DROP TABLE IF EXISTS `whitelist_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whitelist_log` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ckey` VARCHAR(32) NOT NULL,
	`manager` VARCHAR(32) NOT NULL,
	`manager_id` VARCHAR(32) NOT NULL,
  `action` ENUM('ADDED', 'REMOVED') NOT NULL DEFAULT 'ADDED',
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`comment` VARCHAR(4000),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Trigger structure for trigger `log_whitelist_additions`.
--
DROP TRIGGER IF EXISTS `log_whitelist_additions`;
CREATE TRIGGER `log_whitelist_additions`
AFTER INSERT ON `whitelist`
FOR EACH ROW
INSERT INTO whitelist_log (ckey, manager, manager_id, `action`, comment) VALUES (NEW.ckey, NEW.manager, NEW.manager_id, 'ADDED', NEW.comment);


--
-- Trigger structure for trigger `log_whitelist_changes`.
--
DROP TRIGGER IF EXISTS `log_whitelist_changes`;
DELIMITER //
CREATE TRIGGER `log_whitelist_changes`
AFTER UPDATE ON `whitelist`
FOR EACH ROW
BEGIN
 IF NEW.deleted = 1 THEN
  INSERT INTO whitelist_log (ckey, manager, manager_id, `action`, comment) VALUES (NEW.ckey, NEW.manager, NEW.manager_id, 'REMOVED', NEW.comment);
 ELSE
  INSERT INTO whitelist_log (ckey, manager, manager_id, `action`, comment) VALUES (NEW.ckey, NEW.manager, NEW.manager_id, 'ADDED', NEW.comment);
 END IF;
END; //
DELIMITER ;
