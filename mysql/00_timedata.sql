-- SET SQL_MODE='ALLOW_INVALID_DATES';
SET sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION,ALLOW_INVALID_DATES';
CREATE TABLE IF NOT EXISTS `timedata` (
   `corpus` varchar(64) NOT NULL DEFAULT '',
   `datefrom` datetime DEFAULT '0000-00-00 00:00:00',
   `dateto` datetime DEFAULT '0000-00-00 00:00:00',
   `tokens` int(11) NOT NULL DEFAULT 0,
 PRIMARY KEY (`corpus`, `datefrom`, `dateto`))  default charset = utf8 ;
CREATE TABLE IF NOT EXISTS `timedata_date` (
   `corpus` varchar(64) NOT NULL DEFAULT '',
   `datefrom` date NOT NULL DEFAULT '0000-00-00',
   `dateto` date NOT NULL DEFAULT '0000-00-00',
   `tokens` int(11) NOT NULL DEFAULT 0,
 PRIMARY KEY (`corpus`, `datefrom`, `dateto`))  default charset = utf8 ;
 
