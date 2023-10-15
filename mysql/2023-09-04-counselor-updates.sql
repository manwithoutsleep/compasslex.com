USE `compasslex02-dev`;

USE `compasslex02`;

UPDATE `counselors` SET `longdescription` = 
'<p>Hi, I\'m Weston.</p><p>I earned my Master\'s degree in Clinical Mental Health Counseling from the University of the Cumberlands. After graduating with an undergraduate degree in education, I subsequently realized the last thing I wanted to do with my life was become a teacher. After some time, I discovered that a career in which I could get to know people on a deep and genuine level would be a good fit for me. My own experience with darkness has been one that brought me to seek professional help and has grown a desire in me for others to experience the healing and transformation that I have through counseling. Upon reflection of my life, I have learned that suffering and pain can be a gift from God. I have always been comfortable in conversations that may seem a bit heavy on the outside looking in and find joy in experiencing this with my clients.</p><p>My philosophical approach to the therapeutic relationship is an integrated one which is heavily driven by a mode of therapy labeled Internal Family Systems (IFS). This type of therapy holds the belief that our true self can be accessed through the unburdening of emotions, memories, and beliefs associated with our deepest hurts. I also offer EMDR (Eye Movement Desensitization and Reprocessing) therapy, which is a tool that offers a tangible way to heal from the symptoms and distress that are the result of trauma and adverse life experiences. My experience includes working with those who have faced challenges with PTSD, depression, anxiety, relationship issues, suicidal ideation/self-harm, homicidal ideation, anger, and chronic pain.</p><p>Whether you find yourself in pain, confused, outraged, numb, apathetic, etc., I can assure you that all parts of your being are welcome. It would genuinely be a joy for me to journey with you as you navigate your own unique circumstances, whatever they might be.</p>' WHERE `id` = 7;

UPDATE `credentials` SET `content` = 'Ph.D in Counseling, Stephens College, Columbia, MO' WHERE `id` = 1 AND `counselorid` = 1;
UPDATE `titles` SET `content` = 'Ph.D, LPCC-S' WHERE `id` = 1 AND `counselorid` = 1;

UPDATE `credentials` SET `content` = 'Licensed Professional Clinical Counselor (LPCC)' WHERE `id` = 18 AND `counselorid` = 4;
UPDATE `titles` SET `content` = 'M.A., LPCC' WHERE `id` = 5 AND `counselorid` = 4;

INSERT INTO `counselors` (
`id`,
`email`,
`firstname`,
`lastname`,
`longdescription`,
`phone`,
`practitionerid`,
`shortdescription`,
`directoryid`,
`sortorder`
) VALUES (
3,
'Julie@compasslex.com',
'Julie',
'Marchman',
'<p>Hey there! I\'m Julie.</p><p>Following my undergraduate degree in counseling psychology, I was accepted into the master\'s program at Asbury Theological Seminary and joined Compass Christian Counseling as an intern. I am a member of the American Association of Marriage and Family Therapy and the Kentucky Counseling Association. My experience also comprises internships at Asbury University and Asbury Theological Seminary counseling centers. I am trained in premarital counseling and have pursued advanced training in Emotionally Focused Therapy to assist couples and families in resolving distress and creating more satisfying connections.</p><p>I previously served for two decades as a lay counselor in the church where I offered a faith-based model to individuals, couples, and families for emotional healing. I also served as a key-note speaker at conferences and retreats especially addressing sexual addiction, relational and parenting issues, as well as spiritual formation. I have also facilitated support groups for pregnancy loss and grief recovery.</p><p>Life is tough! Seeking therapy is a wise step. My counseling approach rests on the belief that reaching out for help is a sign of courage and strength. It is normal to need help in difficult times. I am passionate about working with individuals, couples, and families to help them overcome their hurdles. I use a collaborative and respectful style and am committed to creating a therapeutic relationship built on authenticity, trust, and acceptance.</p><p>I would be honored to work with you, so please feel free reach out with any questions about the process.</p>',
'(770) 262-0635',
32663,
'Sometimes stress, trauma, hurts, and fears simply pile up. Ultimately, we all seek to improve our mental and emotional well-being and counseling has been proven effective. There\'s hope and reaching out is the first step. I am committed to listening and understanding your point of view while working to help you heal, grow, and find solutions. I would be honored to walk the process with you.',
'',
5);

INSERT INTO `credentials` VALUES
(10,3,'M.A. in Marriage & Family Counseling, Asbury Theological Seminary, KY (Aug. 2020)'),
(11,3,'B.A. in Counseling Psychology, Toccoa Falls College, GA'),
(12,3,'Externship and Core Skills training in Emotionally Focused Couple Therapy (EFT)'),
(13,3,'Training in Emotionally Focused Therapy (EFT) for Trauma Recovery'),
(14,3,'Training in Emotionally Focused Family Therapy (EFFT)'),
(15,3,'Certified Facilitator in PREPARE/ENRICH Marital & Premarital Counseling');

INSERT INTO `memberships` VALUES
(6,3,'American Association of Marriage and Family Therapists (AAMFT)'),
(7,3,'Kentucky Counselors Association (KCA)'),
(8,3,'International Centre for Excellence in Emotionally Focused Therapy (ICEEFT)');

INSERT INTO `titles` VALUES
(4,3,'M.A. Marriage & Family Counseling (Aug. 2020)');

UPDATE `counselors` SET `sortorder` = 5 WHERE `id` = 4;
UPDATE `counselors` SET `sortorder` = 6 WHERE `id` = 3;
