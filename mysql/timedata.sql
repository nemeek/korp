CREATE TABLE IF NOT EXISTS `timedata` (
   `corpus` varchar(64) NOT NULL DEFAULT '',
   `datefrom` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
   `dateto` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
   `tokens` int(11) NOT NULL DEFAULT 0,
 PRIMARY KEY (`corpus`, `datefrom`, `dateto`))  default charset = utf8 ;
CREATE TABLE IF NOT EXISTS `timedata_date` (
   `corpus` varchar(64) NOT NULL DEFAULT '',
   `datefrom` date NOT NULL DEFAULT '1000-01-01',
   `dateto` date NOT NULL DEFAULT '1000-01-01',
   `tokens` int(11) NOT NULL DEFAULT 0,
 PRIMARY KEY (`corpus`, `datefrom`, `dateto`))  default charset = utf8 ;
 
