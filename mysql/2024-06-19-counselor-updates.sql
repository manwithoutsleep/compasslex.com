-- WHERE `counselorid` = 6;

USE `compasslex02-dev`;

UPDATE `credentials` SET `content` = 'Licensed Professional Clinical Counselor (LPCC)' WHERE `id` = 35;

UPDATE `titles` SET `content` = 'M. A., LPCC' WHERE `id` = 7;

SELECT * FROM `credentials` WHERE `counselorid` = 6;
SELECT * FROM `titles` WHERE `counselorid` = 6;

