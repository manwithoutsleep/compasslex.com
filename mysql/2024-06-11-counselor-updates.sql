UPDATE `counselors` SET `isactive` = 0 WHERE `id` = 5;
UPDATE `counselors` SET `lastname` = 'Morgan' WHERE `id` = 9;

UPDATE `credentials` SET `sortorder` = 1 WHERE `counselorid` = 1 AND `sortorder` = 2;
UPDATE `credentials` SET `sortorder` = 2 WHERE `id` = 43;
