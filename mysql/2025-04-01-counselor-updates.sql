USE `compasslex02-dev`;
USE `compasslex02`;
USE `compasslex_stage`;

UPDATE `counselors` SET `isactive` = 0 WHERE `id` = 6;
UPDATE `counselors` SET `isactive` = 0 WHERE `id` = 9;

LOCK TABLES `counselors` WRITE;
/*!40000 ALTER TABLE `counselors` DISABLE KEYS */;
INSERT INTO `counselors`
(`id`,
`isactive`,
`email`,
`firstname`,
`lastname`,
`phone`,
`practitionerid`,
`appointmentlink`,
`directoryid`,
`sortorder`,
`shortdescription`,
`longdescription`)
VALUES
(2,
0,
'kelsi@compasslex.com',
'Kelsi',
'Butcher',
'(859) 625-4200',
31076,
'https://api.portal.therapyappointment.com/n/public/clientRegistration?therapistId=18877676F3364830BE603CDF059494A4',
'18877676F3364830BE603CDF059494A4',
6,
'Our counseling relationship will be based on trust and respect. Throughout sessions, we will work together to identify your goals for counseling and how to move forward to meet those goals. The most important thing to remember: You can do this!.....and I would love to help.',
'<p>Hey there! I\'m Kelsi.</p><p>After obtaining an undergraduate degree in Psychology, I completed the Master\'s program for Counselor Education at Eastern Kentucky University.</p><p>In addition to my counseling education focusing on clinical skills, I have a deep passion for how the Christian faith intersects with the challenges we face. Following 3 months of intensive training in Christian counseling, I have served for the past 3 years as a lay counselor for a local church.</p><p>Something important that I have learned is that although we can handle some situations in our lives, there are times that we need to seek outside help. I am dedicated to providing all my clients with a safe and confidential environment to discuss whatever you may be wrestling with and providing tools to overcome challenges. Although equipped to handle a wide variety of issues, my focus areas include anxiety, depression, relationship issues, substance abuse, and trauma. I have a special heart for children and adolescents who may be struggling.</p><p>Please let me know how I can be a support to you. Together we can work to identify your goals for counseling and how to move forward to meet those goals. You can do this!.......and I would love to help.</p>'),
(11,
0,
'melissa@compasslex.com',
'Melissa',
'Wagner',
'(859) 401-0685',
0,
'https://api.portal.therapyappointment.com/n/public/clientRegistration?therapistId=BFA6D9B1BFEE459593B2515532871A92',
'BFA6D9B1BFEE459593B2515532871A92',
7,
'We often find ourselves in broken places both in ourselves and in our relationships.  The good news is that we can be intentional about pursuing healing.  Sometimes we need outside assistance to help us figure out what we want our life to be and how we can get there. I am committed to creating a non-judgmental space to work toward holistic healing.',
'<p>I graduated from Asbury Theological Seminary with a Masters in Mental Health Counseling and a Masters in Theological Studies with a concentration in Spiritual Formation.  I pursued these two separate degrees in order to help people develop and grow towards a whole and integrated self.  I am passionate about bridging together all facets of human life including the physical, mental, emotional, spiritual, and relational. I want people to find wholeness, health and healing in a complete way.</p><p>My primary modality is Relational Psychodynamic Therapy because I believe relationships are at the heart of what it means to be human.  I also believe our childhood upbringing plays a large role in shaping the trajectory of our lives although we can be intentional about changing that trajectory with applied and consistent effort in therapy.  In addition, I pull from other theories such as Internal Family Systems and Acceptance and Commitment Therapy because no therapeutic style is one size fits all, and I want to utilize the best approach for each client.</p><p>When I am not counseling, I enjoy spending time with my family playing games, being outdoors in the woods, riding my motorcycle, or making music with my instruments.  I love reading (anything with a good story!) and I\'m currently working on writing two books (one fiction and the other focusing on the merging of theology and science).</p><p>If you are looking for change, healing, or growth I would be honored to assist you as we partner together to build the life that you are working towards.</p>'),
(12,
0,
'alison@compasslex.com',
'Alison',
'Tiemeyer',
'(859) 583-2717',
0,
'https://api.portal.therapyappointment.com/n/public/clientRegistration?therapistId=E71F9BD1267245A0B7483AC5D9416911',
'E71F9BD1267245A0B7483AC5D9416911',
8,
'There are times in life when heaviness, complexity, and pain feel too burdensome to handle alone. Are you looking to heal from past trauma? Repair your relationship? Discover new confidence in yourself? Process your story? It would be an honor to walk alongside you on the journey. You are brave to reach out and inquire about therapy. And you will be so thankful you started one year from now. It would be a great privilege to hold space for honest conversation and lasting growth.',
'<p>With a deep desire for relational and healing work, I earned a Bachelors in Psychology from the University of Kentucky and went on to complete a Masters in Marriage & Family Therapy at Campbellsville University. My desire as a therapist is to partner with clients on their journey to holistic wellness, relational healing, and wholehearted living.</p><p>My integrative approach to therapy is heavily influenced by Internal Family Systems, as well as EMDR, DBT, Gottman, and Narrative therapies. Above all else, I consider myself client-centered and truly desire to connect with the individual person (or people!) across from me in a relational, down-to-earth way. I have worked with individuals of all ages, couples, and whole family systems throughout the years. I have experience working with anxiety, depression, grief, divorce, infidelity, trauma, PTSD, codependency, domestic violence, and family conflict.</p><p>When I\'m not counseling, you can find me cooking, reading, hiking, or playing with my three children.</p><p>It would be a privilege to walk alongside as you heal, process, and discover lasting freedom. We are not meant to handle the complexities of life alone. Contact me for more information or to get started.</p>');
/*!40000 ALTER TABLE `counselors` ENABLE KEYS */;
UNLOCK TABLES;

-- 11 Melissa
-- 12 Alison

LOCK TABLES `credentials` WRITE;
/*!40000 ALTER TABLE `credentials` DISABLE KEYS */;
INSERT INTO `credentials`
(`isactive`,`counselorid`,`sortorder`,`content`)
VALUES
(1,2,1,'B.A. of Psychology, Eastern Kentucky University'),
(1,2,2,'M.A. in Counseling, Eastern Kentucky University'),
(1,2,3,'Licensed Professional Counseling Associate (LPCA)'),
(1,2,4,'Post-graduate training in Gottman Method of Couples Therapy'),
(1,11,1,'B.A. Christian Ministries, Asbury University, Wilmore, KY'),
(1,11,2,'M.A. Theological Studies, Asbury Theological Seminary, Wilmore, KY'),
(1,11,3,'M.A. Mental Health Counseling, Asbury Theological Seminary, WIlmore, KY'),
(1,11,4,'Licensed Professional Counselor Associate, LPCA'),
(1,11,5,'Certified Facilitator - Prepare and Enrich Couples Counseling'),
(1,11,6,'Certified Birkman Method for Workplace Strengths/Relationships'),
(1,12,1,'B.A. in Psychology, University of Kentucky, Lexington, KY'),
(1,12,2,'M.A. in Marriage & Family Therapy, Campbellsville University, Louisville, KY'),
(1,12,3,'Marriage & Family Therapy Associate (MFTA)'),
(1,12,4,'Gottman Couples Therapy Certified, Level 1'),
(1,12,5,'EMDR Certified');
/*!40000 ALTER TABLE `credentials` ENABLE KEYS */;
UNLOCK TABLES;

-- 11 Melissa
-- 12 Alison

LOCK TABLES `insurances` WRITE;
/*!40000 ALTER TABLE `insurances` DISABLE KEYS */;
INSERT INTO `insurances`
(`isactive`,`counselorid`,`sortorder`,`content`)
VALUES
(1,2,1,'Aetna Better Health'),
(1,2,2,'Passport'),
(1,2,3,'Wellcare'),
(1,2,4,'Humana Medicaid'),
(1,2,5,'Anthem Medicaid'),
(1,11,1,'Aetna Better Health Medicaid'),
(1,11,2,'Humana Medicaid'),
(1,11,3,'Passport Medicaid'),
(1,11,4,'Wellcare Medicaid'),
(1,11,5,'Anthem Blue Cross/Blue Shield'),
(1,12,1,'Aetna Better Health Medicaid'),
(1,12,2,'Humana Medicaid'),
(1,12,3,'Passport Medicaid'),
(1,12,4,'Wellcare Medicaid'),
(1,12,5,'Anthem Blue Cross/Blue Shield');
/*!40000 ALTER TABLE `insurances` ENABLE KEYS */;
UNLOCK TABLES;

-- 11 Melissa
-- 12 Alison

LOCK TABLES `memberships` WRITE;
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
INSERT INTO `memberships`
(`isactive`,`counselorid`,`sortorder`,`content`)
VALUES
(1,2,1,'Kentucky Counseling Association (KCA)'),
(1,2,2,'National Alliance on Mental Illness (NAMI)'),
(1,2,3,'The International Honor Society in Psychology'),
(1,11,1,'Kentucky Counseling Association (KCA)'),
(1,11,2,'Christian Association for Psychological Studies (CAPS)'),
(1,11,3,'Kentucky Psychology Association (KPA)'),
(1,12,1,'American Association for Marriage and Family Therapy (AAMFT)');
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;
UNLOCK TABLES;

-- 11 Melissa
-- 12 Alison

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles`
(`isactive`,`counselorid`,`sortorder`,`content`)
VALUES
(1,2,1,'M. A., LPCA'),
(1,11,1,'M.A., LPCA'),
(1,12,1,'M. A., Marriage and Family Therapist Associate');
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;

UPDATE `counselors` SET
`phone` = '(859) 625-4200',
`appointmentlink` = 'https://api.portal.therapyappointment.com/n/public/clientRegistration?therapistId=18877676F3364830BE603CDF059494A4',
`directoryid` = '18877676F3364830BE603CDF059494A4'
WHERE `id` = 2;

UPDATE `counselors` SET
`phone` = '(859) 401-0685',
`appointmentlink` = 'https://api.portal.therapyappointment.com/n/public/clientRegistration?therapistId=BFA6D9B1BFEE459593B2515532871A92',
`directoryid` = 'BFA6D9B1BFEE459593B2515532871A92'
WHERE `id` = 11;

UPDATE `counselors` SET
`phone` = '(859) 583-2717',
`appointmentlink` = 'https://api.portal.therapyappointment.com/n/public/clientRegistration?therapistId=E71F9BD1267245A0B7483AC5D9416911',
`directoryid` = 'E71F9BD1267245A0B7483AC5D9416911'
WHERE `id` = 12;

DELETE FROM `credentials` WHERE `counselorid` IN (11,12);
DELETE FROM `insurances` WHERE `counselorid` IN (11,12);
DELETE FROM `memberships` WHERE `counselorid` IN (11,12);
DELETE FROM `titles` WHERE `counselorid` IN (11,12);

INSERT INTO `credentials`
(`isactive`,`counselorid`,`sortorder`,`content`)
VALUES
(1,11,1,'B.A. Christian Ministries, Asbury University, Wilmore, KY'),
(1,11,2,'M.A. Theological Studies, Asbury Theological Seminary, Wilmore, KY'),
(1,11,3,'M.A. Mental Health Counseling, Asbury Theological Seminary, WIlmore, KY'),
(1,11,4,'Licensed Professional Counselor Associate, LPCA'),
(1,11,5,'Certified Facilitator - Prepare and Enrich Couples Counseling'),
(1,11,6,'Certified Birkman Method for Workplace Strengths/Relationships'),
(1,12,1,'B.A. in Psychology, University of Kentucky, Lexington, KY'),
(1,12,2,'M.A. in Marriage & Family Therapy, Campbellsville University, Louisville, KY'),
(1,12,3,'Marriage & Family Therapy Associate (MFTA)'),
(1,12,4,'Gottman Couples Therapy Certified, Level 1'),
(1,12,5,'EMDR Certified');

INSERT INTO `insurances`
(`isactive`,`counselorid`,`sortorder`,`content`)
VALUES
(1,11,1,'Aetna Better Health Medicaid'),
(1,11,2,'Humana Medicaid'),
(1,11,3,'Passport Medicaid'),
(1,11,4,'Wellcare Medicaid'),
(1,11,5,'Anthem Blue Cross/Blue Shield'),
(1,12,1,'Aetna Better Health Medicaid'),
(1,12,2,'Humana Medicaid'),
(1,12,3,'Passport Medicaid'),
(1,12,4,'Wellcare Medicaid'),
(1,12,5,'Anthem Blue Cross/Blue Shield');

INSERT INTO `memberships`
(`isactive`,`counselorid`,`sortorder`,`content`)
VALUES
(1,11,1,'Kentucky Counseling Association (KCA)'),
(1,11,2,'Christian Association for Psychological Studies (CAPS)'),
(1,11,3,'Kentucky Psychology Association (KPA)'),
(1,12,1,'American Association for Marriage and Family Therapy (AAMFT)');

INSERT INTO `titles`
(`isactive`,`counselorid`,`sortorder`,`content`)
VALUES
(1,11,1,'M.A., LPCA'),
(1,12,1,'M. A., Marriage and Family Therapist Associate');

UPDATE `counselors` SET `sortorder` = 9999 WHERE `isactive` = 0;
UPDATE `counselors` SET `sortorder` = 1 WHERE `id` = 10;
UPDATE `counselors` SET `sortorder` = 2 WHERE `id` = 7;
UPDATE `counselors` SET `sortorder` = 3 WHERE `id` = 8;
UPDATE `counselors` SET `sortorder` = 4 WHERE `id` = 4;
UPDATE `counselors` SET `sortorder` = 5 WHERE `id` = 2;
UPDATE `counselors` SET `sortorder` = 6 WHERE `id` = 11;
UPDATE `counselors` SET `sortorder` = 7 WHERE `id` = 12;
UPDATE `counselors` SET `sortorder` = 8 WHERE `id` = 3;
UPDATE `counselors` SET `sortorder` = 99 WHERE `id` = 1;

UPDATE `counselors` SET `isactive` = 1 WHERE `id` = 2;
UPDATE `counselors` SET `isactive` = 1 WHERE `id` = 11;
UPDATE `counselors` SET `isactive` = 1 WHERE `id` = 12;

UPDATE `counselors` SET `email` = 'katrina@compasslex.com' WHERE `email` = 'Katrina@compasslex.com';
UPDATE `counselors` SET `email` = 'julie@compasslex.com' WHERE `email` = 'Julie@compasslex.com';
UPDATE `counselors` SET `email` = 'linda@compasslex.com' WHERE `email` = 'Linda@compasslex.com';

-- 200x206 Contact Us
-- 182x235 Meet Us
-- 221x276 Read More
