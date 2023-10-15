USE `compasslex`;

INSERT INTO `newsletters` (`year`, `quarter`, `title`, `description`) VALUES (2021,2,'Why Self-Care Isn\'t Selfish',NULL),(2021,3,'How Good Are Your Listening Skills?',NULL);

UPDATE `counselors` SET `shortdescription` = '' WHERE `id` = 5;