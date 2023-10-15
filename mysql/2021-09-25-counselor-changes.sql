USE `compasslex`;

UPDATE `counselors` SET `shortdescription` = 'The burdens of life are many and unique to each one of us. When these burdens give little space for our true selves to lead, disrupting the awareness of one\'s own brilliance and the beauty around them, counseling makes so much sense. Where do you imagine your true self leading you? It\'s a privilege to provide a clinical setting to befriend these burdens with the compassion they deserve so they can be known, healed, and redeemed.' WHERE `id` = 6;

ALTER TABLE `counselors` ADD COLUMN `sortorder` INT NOT NULL DEFAULT 0;

UPDATE `counselors` SET `sortorder` = 1 WHERE `id` = 3;
UPDATE `counselors` SET `sortorder` = 2 WHERE `id` = 4;
UPDATE `counselors` SET `sortorder` = 3 WHERE `id` = 5;
UPDATE `counselors` SET `sortorder` = 4 WHERE `id` = 6;
UPDATE `counselors` SET `sortorder` = 5 WHERE `id` = 2;
UPDATE `counselors` SET `sortorder` = 6 WHERE `id` = 1;
