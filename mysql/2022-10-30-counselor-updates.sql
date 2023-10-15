USE `compasslex.com`;

UPDATE `counselors` SET `directoryid` = 'BABFFA046D6D4352BE7E690588F5D186' WHERE  `id` = 7;
UPDATE `counselors` SET `directoryid` = '8A05D144DE88454B82D2156BCFCAFA99' WHERE  `id` = 8;

UPDATE `counselors` SET `shortdescription` = 'You never know when you\'re going to wake up to find your world has changed. Grief,
heartache, separation, or sadness within? Tension, anger, frustration or feeling
invisible to your spouse or other family members? Our work together will be to help
you see what has shifted in your world and learn how to move forward in new ways
toward healing and wholeness with yourself, your spouse, or your family.' WHERE `id` = 8;

DELETE FROM `credentials` WHERE `counselorid` = 8 AND `content` = 'Licensed Professional Counselor Associate (LPCA)';
