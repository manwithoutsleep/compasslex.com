USE `compasslex02`;

DELETE FROM `credentials` WHERE `counselorid` = 1;

INSERT INTO `credentials` (`counselorid`, `content`) VALUES
(1, 'M.Ed. in Counseling, Stephens College, Columbia, MO'),
(1, 'Ph.D. in Counseling Education and Supervision, University of the Cumberlands, Williamsburg, KY'),
(1, 'B.A. in Theology, Ambassador College, Pasadena, CA'),
(1, 'Externship in Emotionally Focused Couples Therapy, Chicago Center for EFT'),
(1, 'Licensed Professional Clinical Counselor (LPCC)'),
(1, 'Certified Clinical Trauma Professional (CCTP)'),
(3, 'Marriage and Family Therapist, (MFT)');

UPDATE `titles` SET `content` = 'M. A., Marriage and Family Therapist' WHERE `id` = 4 AND `counselorid` = 3;

INSERT INTO `insurances` (`counselorid`, `content`) VALUES
(3, 'Aetna'),
(3, 'Anthem Blue Cross/Blue Shield'),
(3, 'Cigna'),
(3, 'Humana'),
(3, 'Passport'),
(3, 'Wellcare');

UPDATE `credentials` SET `content` = 'M.A. in Marriage & Family Counseling, Asbury Theological Seminary, KY' WHERE `id` = 10 AND `counselorid` = 3;

ALTER TABLE `counselors` ADD COLUMN `isactive` bit NOT NULL DEFAULT 1 AFTER `id`;

ALTER TABLE `credentials` ADD COLUMN `sortorder` int NOT NULL DEFAULT 1 AFTER `counselorid`;
ALTER TABLE `credentials` ADD COLUMN `isactive` bit NOT NULL DEFAULT 1 AFTER `id`;

ALTER TABLE `insurances` ADD COLUMN `sortorder` int NOT NULL DEFAULT 1 AFTER `counselorid`;
ALTER TABLE `insurances` ADD COLUMN `isactive` bit NOT NULL DEFAULT 1 AFTER `id`;

ALTER TABLE `memberships` ADD COLUMN `sortorder` int NOT NULL DEFAULT 1 AFTER `counselorid`;
ALTER TABLE `memberships` ADD COLUMN `isactive` bit NOT NULL DEFAULT 1 AFTER `id`;

ALTER TABLE `titles` ADD COLUMN `sortorder` int NOT NULL DEFAULT 1 AFTER `counselorid`;
ALTER TABLE `titles` ADD COLUMN `isactive` bit NOT NULL DEFAULT 1 AFTER `id`;

UPDATE `credentials` SET `sortorder` = 2 WHERE `id` = 43;
UPDATE `credentials` SET `sortorder` = 3 WHERE `id` = 44;
UPDATE `credentials` SET `sortorder` = 4 WHERE `id` = 45;
UPDATE `credentials` SET `sortorder` = 5 WHERE `id` = 46;
UPDATE `credentials` SET `sortorder` = 6 WHERE `id` = 47;
UPDATE `credentials` SET `sortorder` = 7 WHERE `id` = 48;

UPDATE `credentials` SET `sortorder` = 2 WHERE `id` = 11;
UPDATE `credentials` SET `sortorder` = 3 WHERE `id` = 12;
UPDATE `credentials` SET `sortorder` = 4 WHERE `id` = 13;
UPDATE `credentials` SET `sortorder` = 5 WHERE `id` = 14;
UPDATE `credentials` SET `sortorder` = 6 WHERE `id` = 15;

UPDATE `credentials` SET `sortorder` = 2 WHERE `id` = 17;
UPDATE `credentials` SET `sortorder` = 3 WHERE `id` = 18;
UPDATE `credentials` SET `sortorder` = 4 WHERE `id` = 19;
UPDATE `credentials` SET `sortorder` = 5 WHERE `id` = 20;

UPDATE `credentials` SET `sortorder` = 2 WHERE `id` = 28;
UPDATE `credentials` SET `sortorder` = 3 WHERE `id` = 29;
UPDATE `credentials` SET `sortorder` = 4 WHERE `id` = 30;
UPDATE `credentials` SET `sortorder` = 5 WHERE `id` = 31;
UPDATE `credentials` SET `sortorder` = 6 WHERE `id` = 32;

UPDATE `credentials` SET `sortorder` = 2 WHERE `id` = 34;
UPDATE `credentials` SET `sortorder` = 3 WHERE `id` = 35;

UPDATE `credentials` SET `sortorder` = 2 WHERE `id` = 37;

UPDATE `credentials` SET `sortorder` = 2 WHERE `id` = 40;
UPDATE `credentials` SET `sortorder` = 3 WHERE `id` = 41;

UPDATE `insurances` SET `sortorder` = 1 WHERE `counselorid` = 1 AND `content` = 'Aetna';
UPDATE `insurances` SET `sortorder` = 2 WHERE `counselorid` = 1 AND `content` = 'Anthem Blue Cross/Blue Shield';
UPDATE `insurances` SET `sortorder` = 3 WHERE `counselorid` = 1 AND `content` = 'Cigna';
UPDATE `insurances` SET `sortorder` = 4 WHERE `counselorid` = 1 AND `content` = 'Humana';
UPDATE `insurances` SET `sortorder` = 5 WHERE `counselorid` = 1 AND `content` = 'Passport';
UPDATE `insurances` SET `sortorder` = 6 WHERE `counselorid` = 1 AND `content` = 'Wellcare';

UPDATE `insurances` SET `sortorder` = 1 WHERE `counselorid` = 3 AND `content` = 'Aetna';
UPDATE `insurances` SET `sortorder` = 2 WHERE `counselorid` = 3 AND `content` = 'Anthem Blue Cross/Blue Shield';
UPDATE `insurances` SET `sortorder` = 3 WHERE `counselorid` = 3 AND `content` = 'Cigna';
UPDATE `insurances` SET `sortorder` = 4 WHERE `counselorid` = 3 AND `content` = 'Humana';
UPDATE `insurances` SET `sortorder` = 5 WHERE `counselorid` = 3 AND `content` = 'Passport';
UPDATE `insurances` SET `sortorder` = 6 WHERE `counselorid` = 3 AND `content` = 'Wellcare';

UPDATE `insurances` SET `sortorder` = 1 WHERE `counselorid` = 4 AND `content` = 'Aetna Better Health';
*UPDATE `insurances` SET `sortorder` = 2 WHERE `counselorid` = 4 AND `content` = 'Anthem BCBS Medicaid';
*UPDATE `insurances` SET `sortorder` = 3 WHERE `counselorid` = 4 AND `content` = 'Anthem Blue Cross/Blue Shield';
UPDATE `insurances` SET `sortorder` = 4 WHERE `counselorid` = 4 AND `content` = 'Humana Medicaid';
UPDATE `insurances` SET `sortorder` = 5 WHERE `counselorid` = 4 AND `content` = 'Passport';
UPDATE `insurances` SET `sortorder` = 6 WHERE `counselorid` = 4 AND `content` = 'Wellcare';

UPDATE `insurances` SET `sortorder` = 1 WHERE `counselorid` = 5 AND `content` = 'Aetna Better Health';
*UPDATE `insurances` SET `sortorder` = 2 WHERE `counselorid` = 5 AND `content` = 'Anthem Blue Cross/Blue Shield';
UPDATE `insurances` SET `sortorder` = 3 WHERE `counselorid` = 5 AND `content` = 'Anthem Medicaid';
UPDATE `insurances` SET `sortorder` = 4 WHERE `counselorid` = 5 AND `content` = 'Humana Medicaid';
UPDATE `insurances` SET `sortorder` = 5 WHERE `counselorid` = 5 AND `content` = 'Passport';
UPDATE `insurances` SET `sortorder` = 6 WHERE `counselorid` = 5 AND `content` = 'Wellcare';

UPDATE `insurances` SET `sortorder` = 1 WHERE `counselorid` = 6 AND `content` = 'Aetna Better Health';
*UPDATE `insurances` SET `sortorder` = 2 WHERE `counselorid` = 6 AND `content` = 'Anthem Blue Cross/Blue Shield';
UPDATE `insurances` SET `sortorder` = 3 WHERE `counselorid` = 6 AND `content` = 'Anthem Medicaid';
UPDATE `insurances` SET `sortorder` = 4 WHERE `counselorid` = 6 AND `content` = 'Humana Medicaid';
UPDATE `insurances` SET `sortorder` = 5 WHERE `counselorid` = 6 AND `content` = 'Passport';
UPDATE `insurances` SET `sortorder` = 6 WHERE `counselorid` = 6 AND `content` = 'Wellcare';

UPDATE `insurances` SET `sortorder` = 1 WHERE `counselorid` = 7 AND `content` = 'Aetna Better Health';
*UPDATE `insurances` SET `sortorder` = 2 WHERE `counselorid` = 7 AND `content` = 'Anthem Blue Cross/Blue Shield';
UPDATE `insurances` SET `sortorder` = 3 WHERE `counselorid` = 7 AND `content` = 'Anthem Medicaid';
UPDATE `insurances` SET `sortorder` = 4 WHERE `counselorid` = 7 AND `content` = 'Humana Medicaid';
UPDATE `insurances` SET `sortorder` = 5 WHERE `counselorid` = 7 AND `content` = 'Passport';
UPDATE `insurances` SET `sortorder` = 6 WHERE `counselorid` = 7 AND `content` = 'Wellcare';

UPDATE `insurances` SET `sortorder` = 1 WHERE `counselorid` = 8 AND `content` = 'Aetna Better Health';
*UPDATE `insurances` SET `sortorder` = 2 WHERE `counselorid` = 8 AND `content` = 'Anthem Blue Cross/Blue Shield';
UPDATE `insurances` SET `sortorder` = 3 WHERE `counselorid` = 8 AND `content` = 'Anthem Medicaid';
UPDATE `insurances` SET `sortorder` = 4 WHERE `counselorid` = 8 AND `content` = 'Humana Medicaid';
UPDATE `insurances` SET `sortorder` = 5 WHERE `counselorid` = 8 AND `content` = 'Passport';
UPDATE `insurances` SET `sortorder` = 6 WHERE `counselorid` = 8 AND `content` = 'Wellcare';

UPDATE `insurances` SET `sortorder` = 2 AND `content` = 'Anthem Blue Cross/Blue Shield' WHERE `content` = 'Anthem BlueCross/BlueShield';



UPDATE `memberships` SET `sortorder` = 1 WHERE `counselorid` = 1 AND `content` = 'American Association of Christian Counselors (AACC)';
UPDATE `memberships` SET `sortorder` = 2 WHERE `counselorid` = 1 AND `content` = 'American Counseling Association (ACA)';

UPDATE `memberships` SET `sortorder` = 1 WHERE `counselorid` = 3 AND `content` = 'American Association of Marriage and Family Therapists (AAMFT)';
UPDATE `memberships` SET `sortorder` = 2 WHERE `counselorid` = 3 AND `content` = 'International Centre for Excellence in Emotionally Focused Therapy (ICEEFT)';
UPDATE `memberships` SET `sortorder` = 3 WHERE `counselorid` = 3 AND `content` = 'Kentucky Counselors Association (KCA)';

UPDATE `memberships` SET `sortorder` = 1 WHERE `counselorid` = 4 AND `content` = 'American Counseling Association (ACA)';
UPDATE `memberships` SET `sortorder` = 2 WHERE `counselorid` = 4 AND `content` = 'Christian Association for Psychological Studies (CAPS)';
UPDATE `memberships` SET `sortorder` = 3 WHERE `counselorid` = 4 AND `content` = 'Kentucky Counseling Association (KCA)';

UPDATE `memberships` SET `sortorder` = 1 WHERE `counselorid` = 5 AND `content` = 'American Counseling Association (ACA)';
UPDATE `memberships` SET `sortorder` = 2 WHERE `counselorid` = 5 AND `content` = 'Christian Association for Psychological Studies (CAPS)';
UPDATE `memberships` SET `sortorder` = 3 WHERE `counselorid` = 5 AND `content` = 'Kentucky Counseling Association (KCA)';

UPDATE `memberships` SET `sortorder` = 1 WHERE `counselorid` = 6 AND `content` = 'American Counseling Association (ACA)';
UPDATE `memberships` SET `sortorder` = 2 WHERE `counselorid` = 6 AND `content` = 'Christian Association for Psychological Studies (CAPS)';
UPDATE `memberships` SET `sortorder` = 3 WHERE `counselorid` = 6 AND `content` = 'Kentucky Counseling Association (KCA)';

UPDATE `memberships` SET `sortorder` = 1 WHERE `counselorid` = 7 AND `content` = 'American Counseling Association (ACA)';
UPDATE `memberships` SET `sortorder` = 2 WHERE `counselorid` = 7 AND `content` = 'Kentucky Counseling Association (KCA)';

UPDATE `memberships` SET `sortorder` = 1 WHERE `counselorid` = 8 AND `content` = 'American Counseling Association (ACA)';
UPDATE `memberships` SET `sortorder` = 2 WHERE `counselorid` = 8 AND `content` = 'Christian Association for Psychological Studies (CAPS)';
UPDATE `memberships` SET `sortorder` = 3 WHERE `counselorid` = 8 AND `content` = 'International Association of Marriage and Family Counselors (IAMFC)';
UPDATE `memberships` SET `sortorder` = 4 WHERE `counselorid` = 8 AND `content` = 'Kentucky Counseling Association (KCA)';
