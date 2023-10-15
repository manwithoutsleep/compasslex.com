INSERT INTO `counselors` (`email`,`firstname`,`lastname`,`longdescription`,`phone`,`practitionerid`,`shortdescription`) VALUES (
'Katrina@compasslex.com',
'Katrina',
'Cowen',
'<p>Hi, I\'m Katrina</p><p>I earned my Master\'s Degree in Mental Health Counseling from Asbury Theological Seminary, having returned to school after many years devoted to raising my three sons and two daughters, along with my husband of 32 years. My years of experience in discipleship ministry and mentoring in my church brought me face to face with the honest questions that people ask as they confront life\'s struggles. My own experiences with suffering and challenging transitions led me to pursue a degree in counseling, hoping to help others as I have been helped.</p><p>In my counseling work I collaborate with the client to meet him or her right where they are, conceptualize where they want to be, then plan and implement the steps to reach the goal. I favor an integrative approach that utilizes several evidence-based treatment modalities including acceptance and commitment therapy, cognitive-behavioral practices, narrative therapy and mindfulness. My past clients have included those navigating issues of anxiety, depression, grief and loss, relationship conflict, obsessive-compulsive disorder, sexual abuse and trauma, and sexual identity. I have conducted pre-marital counseling using the Prepare/Enrich assessment, and have led group therapy.</p><p>Perhaps you too are facing life transitions, relational struggles or personal suffering. Perhaps a traumatic event from your past has re-surfaced, creating distress and distraction in your present life. I am deeply committed to helping you make meaning from your suffering, find redemptive purpose even in tragic circumstances, and live with authenticity. Contact me, and let\'s get started on your healing journey.</p>',
'(859) 694-0025',
34732,
'Disillusionment and suffering are inevitable parts of every life; wounding from the past has a way of rearing its head when you least expect it, creating anxiety, depression, relational difficulties and much more. God has always been in the business of redeeming broken things, and that means restoration is possible for you! I understand that asking for help feels risky, and I applaud your courage in getting this far - I want to provide a safe space for you to explore your story and its impact on your life.');

UPDATE `counselors` SET
`shortdescription` = 'When life gets tough, seeking therapy is a sign of wisdom. It is good to reach out for help in difficult times. I use a compassionate and collaborative approach to help individuals, couples, and families overcome their hurdles. I am committed to creating a therapeutic relationship built on authenticity, trust, and acceptance and would be honored to help you live into a better future.',
`longdescription` = '<p>Following my undergraduate work in counseling psychology, I completed my master\'s in marriage and family therapy at Asbury Theological Seminary. My experience comprises internships at Asbury University and Asbury Theological Seminary counseling centers as well as Compass Christian Counseling. I have also led grief recovery and pregnancy loss support groups. I am trained in premarital counseling and have pursued advanced training in Emotionally Focused Therapy to assist couples, families, and individuals for treating mood disorders, trauma, and relationship distress.</p><p>I previously served for two decades as a lay counselor in the church and offered a faith-based model to individuals, couples, and families for emotional healing and spiritual formation. I also served as a key-note speaker at conferences and retreats especially addressing sexual addictions, relational struggles, and parenting issues.</p><p>When life gets hard, we seek to improve our well-being. Counseling has been proven effective. There\'s hope for a better future and reaching out is the first step. I am committed to listening and understanding your point of view while working to help you heal, grow, and find solutions.</p><p>I would be honored to work with you.</p>'
WHERE `id` = 3;

INSERT INTO `titles` (`counselorid`,`content`) VALUES (4,'M.A., LPC');

UPDATE `titles` SET `content` = 'M. Ed., LPCC-S' WHERE `id` = 1;

UPDATE `titles` SET `content` = 'M. A., Marriage & Family Therapist Associate' WHERE `id` = 4;

DELETE FROM `credentials` WHERE `counselorid` = 4;
INSERT INTO `credentials` (`counselorid`,`content`) VALUES
(4,'M.A. in Mental Health Counseling, Asbury Theological Seminary, Wilmore, KY'),
(4,'B.S. in Medical Technology, Morehead State University, Morehead, KY'),
(4,'Licensed Professional Counselor Associate (LPCA)'),
(4,'Allender Center Training Certificate - Level 1, Seattle, WA'),
(4,'Acceptance and Commitment Therapy Boot Camp, Philadelphia, PA');

DELETE FROM `memberships` WHERE `counselorid` = 4;
INSERT INTO `memberships` (`counselorid`,`content`) VALUES
(4,'American Counseling Association (ACA)'),
(4,'Kentucky Counseling Association (KCA)'),
(4,'Christian Association for Psychological Studies (CAPS)');

DELETE FROM `insurances` WHERE `counselorid` = 4;
INSERT INTO `insurances` (`counselorid`,`content`) VALUES
(4,'Aetna Better Health'),
(4,'Anthem BCBS Medicaid'),
(4,'Humana Medicaid'),
(4,'Passport'),
(4,'Wellcare');

DELETE FROM `credentials` WHERE `counselorid` = 3;
INSERT INTO `credentials` (`counselorid`,`content`) VALUES
(3,'M.A. in Marriage & Family Counseling, Asbury Theological Seminary, KY'),
(3,'B.A. in Counseling Psychology, Toccoa Falls College, GA'),
(3,'Certificate in Emotionally Focused Couple Therapy (EFT) Externship and Core Skills I-IV'),
(3,'Certificate in Emotionally Focused Therapy (EFT) for Trauma Recovery'),
(3,'Certificate in Emotionally Focused Family Therapy (EFFT)'),
(3,'Certified Facilitator in PREPARE/ENRICH Marital & Premarital Counseling');

DELETE FROM `memberships` WHERE `counselorid` = 3;
INSERT INTO `memberships` (`counselorid`,`content`) VALUES
(3,'American Association of Marriage and Family Therapists (AAMFT)'),
(3,'International Centre for Excellence in Emotionally Focused Therapy (ICEEFT)'),
(3,'Kentucky Counselors Association (KCA)');
