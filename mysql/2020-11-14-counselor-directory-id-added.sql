USE `compasslex.com`;

ALTER TABLE `counselors` ADD COLUMN `directoryid` VARCHAR(50) NOT NULL;

UPDATE `counselors` SET `directoryid` = '57ce6b51112913da2fc6b3534f14a3b1' WHERE firstname LIKE 'julie';
UPDATE `counselors` SET `directoryid` = '55a158cbbb159d09dff1889c40b3af5d' WHERE firstname LIKE 'linda';
UPDATE `counselors` SET `directoryid` = 'ca134d0122c9c6ec7a420e884d9d8df7' WHERE firstname LIKE 'katrina';
UPDATE `counselors` SET `directoryid` = '08aebf96a3e8f4c8dc326ea24948a495' WHERE firstname LIKE 'kelsi';
