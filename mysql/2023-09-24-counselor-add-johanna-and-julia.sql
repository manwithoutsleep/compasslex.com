USE `compasslex02`;

INSERT INTO `counselors`
(`id`,
`isactive`,
`email`,
`firstname`,
`lastname`,
`longdescription`,
`phone`,
`practitionerid`,
`shortdescription`,
`directoryid`,
`sortorder`)
VALUES
(9,
0,
'julia@compasslex.com',
'Julia',
'Beier',
'<p>Life is hard, and we sometimes need help in navigating the struggles of life. I truly believe that life is not meant to be done alone, and therapy can provide a resource for those feeling alone in their struggles and pain.</p>
<p>I have provided therapy for individuals, couples, and families who were experiencing many different stressors and struggles from relational difficulties to anxiety and depression.</p>
<p>My main focus is on helping you understand the stories that you tell about yourself and helping you process and regain control of your own story. My therapeutic approach uses a combination of several different models and philosophies including Narrative therapy, cognitive-behavioral therapy (CBT), family systems theory, and attachment theory.</p>
<p>In addition to my therapeutic philosophies, I believe that God is present in all our lives and stories as well. For me, this gives a deep meaning to life, and I am honored to be a part of that meaning as a therapist. If you are wondering if therapy might be a helpful resource for you, please don\'t hesitate to reach out and we can see if I may be a good fit for you.</p>',
'(307) 670-3805',
0,
'We are not meant to take on the struggles of life alone. It would be my honor to come alongside you as you go through the heartaches of life and seek the meaning and beauty in your story that may feel lost. I am committed to being with you as we together explore new ways to process and experience life and the difficulties that come with it.',
'1DBD2929C4A042339ED963F3F8BD41DE',
1),
(10,
0,
'joanna@compasslex.com',
'Joanna',
'Tidei',
'<p>After earning two undergraduate degrees in Human Services and Counseling and Christian Ministries, I went on to earn a Master\'s degree in Mental Health Counseling from Asbury Theological Seminary. My goal is to partner with individuals and families in their pursuit of holistic wellness. Life is often full of difficulty and having support while navigating those challenges can be highly beneficial. I’m dedicated to working with children, adolescents, and adults to identify meaningful life goals and work towards achieving them.</p>
<p>My integrative approach is heavily informed by acceptance and commitment therapy, which combines mindfulness and behavioral change in a way that allows individuals to work towards a flourishing life. I also incorporate aspects of cognitive-behavioral therapy and dialectical-behavioral therapy into my conceptualization. In the past, I have partnered with adults and children facing a variety of issues, including anxiety, depression, trauma history, grief, relational difficulties, and behavioral difficulties. I believe it\'s extremely important for individuals to feel safe and cared for in counseling, which is why I work to create a nurturing environment where you can thrive.</p>
<p>My hope is that together, we will be able to take another step forward on your journey towards the life you want to live. Contact me today to begin working with you or your child.</p>',
'(502) 604-8692',
0,
'Life is often full of difficulty and having support while navigating those challenges can be highly beneficial. I believe it\'s extremely important for individuals to feel safe and cared for in counseling, which is why I work to create a nurturing environment where you can thrive and live the life you want to live.',
'141460F3FF91458E8FD61F6CD8391B22',
1);

INSERT INTO `credentials`
(`counselorid`, `sortorder`, `isactive`, `content`)
VALUES
(9, 0, 1, 'Ph.D. Student in Family Sciences with emphasis in Adolescent Development, University of Kentucky'),
(9, 0, 1, 'M.S. in Family Sciences with emphasis in Couple and Family Therapy, University of Kentucky'),
(9, 0, 1, 'B.S. in Psychology, Missouri Western State University'),
(9, 0, 1, 'Marriage and Family Therapy Associate (MFTA)'),
(10, 1, 1, 'M.A. in Mental Health Counseling, Asbury Theological Seminary, Wilmore, KY'),
(10, 2, 1, 'B.A in Human Services and Counseling, Lindsey Wilson College, Columbia, KY'),
(10, 3, 1, 'B.A in Christian Ministries, Lindsey Wilson College, Columbia, KY'),
(10, 4, 1, 'Certified facilitator, PREPARE/ENRICH premarital and marital counseling'),
(10, 5, 1, 'Licensed Professional Counselor Associate (LPCA)');

INSERT INTO `insurances`
(`counselorid`, `sortorder`, `isactive`, `content`)
VALUES
(9, 1, 1, 'Aetna Better Health'),
(9, 1, 1, 'Anthem Blue Cross/Blue Shield'),
(9, 1, 1, 'Anthem Medicaid'),
(9, 1, 1, 'Humana Medicaid'),
(9, 1, 1, 'Passport'),
(9, 1, 1, 'Wellcare'),
(10, 1, 1, 'Aetna Better Health'),
(10, 2, 1, 'Anthem Blue Cross/Blue Shield'),
(10, 3, 1, 'Anthem Medicaid'),
(10, 4, 1, 'Humana Medicaid'),
(10, 5, 1, 'Passport'),
(10, 6, 1, 'Wellcare');

INSERT INTO `memberships`
(`counselorid`, `sortorder`, `isactive`, `content`)
VALUES
(10, 1, 1, 'American Counseling Association (ACA)');

INSERT INTO `titles`
(`counselorid`, `sortorder`, `isactive`, `content`)
VALUES
(9, 1, 1, 'M.S., Marriage and Family Therapist Associate'),
(10, 1, 1, 'M.A., LPCA');

UPDATE `counselors` SET `sortorder` = 1 WHERE `id` = 10; -- Joanna
UPDATE `counselors` SET `sortorder` = 2 WHERE `id` =  9; -- Julia
UPDATE `counselors` SET `sortorder` = 3 WHERE `id` =  7; -- Weston
UPDATE `counselors` SET `sortorder` = 4 WHERE `id` =  8; -- Martha
UPDATE `counselors` SET `sortorder` = 5 WHERE `id` =  5; -- Elzaba
UPDATE `counselors` SET `sortorder` = 6 WHERE `id` =  6; -- Matt
UPDATE `counselors` SET `sortorder` = 7 WHERE `id` =  4; -- Katrina
UPDATE `counselors` SET `sortorder` = 8 WHERE `id` =  3; -- Julie
UPDATE `counselors` SET `sortorder` = 9 WHERE `id` =  1; -- Linda

UPDATE `counselors` SET `isactive` = 1 WHERE `id` =  9;
UPDATE `counselors` SET `isactive` = 1 WHERE `id` = 10;
