USE `compasslex.com`;

INSERT INTO `counselors`
(`id`,
`email`,
`firstname`,
`lastname`,
`longdescription`,
`phone`,
`practitionerid`,
`shortdescription`,
`directoryid`)
VALUES
(5,
'elzaba@compasslex',
'Elzaba',
'Anderson',
'<p>Hi, I\'m Elzaba.</p><p>I earned my Masters degree from Asbury Theological Seminary in Mental Health Counseling. I am currently a member of the American Counseling Association, Kentucky Counseling Association and the Christians Association for Psychological Studies. Over the years, my life experiences have created a deep curiosity within me about the narratives and stories of people. My own counseling journey was transformational and this led me to pursuing a counseling degree in the hopes of walking alongside the powerful stories and narratives of my clients.</p><p>My counseling philosophy utilizes an integrative approach coupled with several evidence-based treatment modalities including attachment theory, cognitive behavioral therapy (CBT), acceptance and commitment therapy (ACT), as well as interventions including mindfulness practices and breathing techniques. Collaboration with the client to develop goals that can be implemented together is of utmost importance. My past work with clients have included navigating issues of depression, self-esteem, anxiety, eating dissorders, life transitions, relationships, obsessive compusive disorder, sexual abuse and trauma.</p><p>I consider this work a sacred privilege and I am committed to listening, and helping clients find meaning and purpose in the midst of hardship and brokenness. Stories matter and I look forward to working alongside clients in this journey of healing and toward a greater sense of well-being.',
'(859) 429-0086',
00000,
'I consider this work a sacred privilege and I am committed to listening, and helping clients find meaning and purpose in the midst of hardship and brokenness. Stories matter and I look forward to working alongside clients in this journey of healing and toward a greater sense of well-being.',
'D4F4C9B10475442D94CF6BCE974276DC'),
(6,
'matt@compasslex',
'Matt',
'Ladwig',
'<p>Hi, I\'m Matt</p><p>I earned my Master\'s Degree in Mental Health Counseling from Asbury Theological Seminary after being called from a career in higher education. One morning while at my office job I found a man who had overdosed and died, which led me to seek out ways to support survivors of addiction. That experience paired with my own healing encounter with depression, guilt, and shame over the years encouraged me to pursue this field. I completed my degree while working full-time with three children. What a wild ride! God has used himself, the loving and tremendous support of my wife, my friends, church community, and education to continually form me.</p><p>The courage it takes to begin the work of counseling is truly remarkable, and that very courage is the foundation of my work with clients. I favor a strength-based, evidenced-based approach called Internal Family Systems (IFS). As an IFS-informed therapist, I believe when our core, true selves can be compassionately introduced to the hurt parts of us, unity and healing occurs. I also integrate Dialectical Behavior Therapy (DBT), Motivational Interviewing, and Acceptance and Commitment Therapy (ACT) approaches to collaborate with clients toward their goals.</p><p>My past clients have included couples, individuals, groups, those surviving an addiction, living with anxiety and/or depression, navigating a relational conflict, grief, sexual identity, trauma, and those seeking a safe space to understand themselves and where they fit into all of this.</p><p>Please come however you are with whatever you have left. Perhaps you are shamed, weary, or just stuck. The courage to be known and to present yourself in weakness has a lot more to say to you. "The clouds you so much dread are actually big with mercy and shall break in blessings - (yeah, blessings) - upon your head" (William Cowper, 1774). It would be my privilege to work with you!</p>
',
'(859) 475-4150',
00000,
'The burdens of life are many and unique to each one of us. When these burdens give little space for our true selves to lead, disrupting the awareness of one\'s own brilliance and the beauty around them, counseling makes so much sense. Where do you imagine your true self leading you? Perhaps, to more whole-hearted relationships, increased job satisfaction, freedom from addiction, diminished anxiety and/or depression, or to a truer perspective of God himself. It\'s a privilege to provide a clinical setting to befriend these burdens with the compassion they deserve so they can be known, healed, and redeemed.',
'4964D704A1474386A9B66D8EEC8E34E1');

INSERT INTO `credentials` (`counselorid`, `content`) VALUES (5, 'M.A. in Mental Health Counseling, Asbury Theological Seminary, Wilmore, KY');
INSERT INTO `credentials` (`counselorid`, `content`) VALUES (5, 'M.A in Diplomacy and International Commerce, University of Kentucky, Lexington, KY');
INSERT INTO `credentials` (`counselorid`, `content`) VALUES (5, 'B.A in Business Administration, Asbury University, Wilmore, KY');
INSERT INTO `credentials` (`counselorid`, `content`) VALUES (5, 'Licensed Professional Counselor (LPCA)');
INSERT INTO `credentials` (`counselorid`, `content`) VALUES (5, 'Completed Level 1 Training in Gottman Method Couples Therapy');
INSERT INTO `credentials` (`counselorid`, `content`) VALUES (5, 'Story Sage Certified, Allender Center, Seattle, WA');

INSERT INTO `credentials` (`counselorid`, `content`) VALUES (6, 'M.A. Mental Health Counseling, Asbury Theological Seminary, Wilmore, KY');
INSERT INTO `credentials` (`counselorid`, `content`) VALUES (6, 'B.A. History, English, and Creative Writing, Centre College, Danville, KY');
INSERT INTO `credentials` (`counselorid`, `content`) VALUES (6, 'Licensed Professional Counselor Associate (LPCA)');

INSERT INTO `insurances` (`counselorid`, `content`) VALUES (5, 'Passport');
INSERT INTO `insurances` (`counselorid`, `content`) VALUES (5, 'Wellcare');
INSERT INTO `insurances` (`counselorid`, `content`) VALUES (5, 'Anthem Medicaid');
INSERT INTO `insurances` (`counselorid`, `content`) VALUES (5, 'Humana Medicaid');
INSERT INTO `insurances` (`counselorid`, `content`) VALUES (5, 'Aetna Better Health');

INSERT INTO `insurances` (`counselorid`, `content`) VALUES (6, 'Passport');
INSERT INTO `insurances` (`counselorid`, `content`) VALUES (6, 'Wellcare');
INSERT INTO `insurances` (`counselorid`, `content`) VALUES (6, 'Anthem Medicaid');
INSERT INTO `insurances` (`counselorid`, `content`) VALUES (6, 'Humana Medicaid');
INSERT INTO `insurances` (`counselorid`, `content`) VALUES (6, 'Aetna Better Health');

INSERT INTO `memberships` (`counselorid`, `content`) VALUES (5, 'American Counseling Association (ACA)');
INSERT INTO `memberships` (`counselorid`, `content`) VALUES (5, 'Kentucky Counseling Association (KCA)');
INSERT INTO `memberships` (`counselorid`, `content`) VALUES (5, 'Christian Association for Psychological Studies (CAPS)');

INSERT INTO `memberships` (`counselorid`, `content`) VALUES (6, 'American Counseling Association (ACA)');
INSERT INTO `memberships` (`counselorid`, `content`) VALUES (6, 'Kentucky Counseling Association (KCA)');
INSERT INTO `memberships` (`counselorid`, `content`) VALUES (6, 'Christian Association for Psychological Studies (CAPS)');

INSERT INTO `titles` (`counselorid`, `content`) VALUES (5, 'M. A., LPCA');
INSERT INTO `titles` (`counselorid`, `content`) VALUES (6, 'M. A., LPCA');

UPDATE `counselors` SET `longdescription` = '<p>Hi, I\'m Matt.</p><p>I earned my Master\'s Degree in Mental Health Counseling from Asbury Theological Seminary after being called from a career in higher education. One morning while at my office job I found a man who had overdosed and died, which led me to seek out ways to support survivors of addiction. That experience paired with my own healing encounter with depression, guilt, and shame over the years encouraged me to pursue this field. I completed my degree while working full-time with three children. What a wild ride! God has used himself, the loving and tremendous support of my wife, my friends, church community, and education to continually form me.</p><p>The courage it takes to begin the work of counseling is truly remarkable, and that very courage is the foundation of my work with clients. I favor a strength-based, evidenced-based approach called Internal Family Systems (IFS). As an IFS-informed therapist, I believe when our core, true selves can be compassionately introduced to the hurt parts of us, unity and healing occurs. I also integrate Dialectical Behavior Therapy (DBT), Motivational Interviewing, and Acceptance and Commitment Therapy (ACT) approaches to collaborate with clients toward their goals.</p><p>My past clients have included couples, individuals, groups, those surviving an addiction, living with anxiety and/or depression, navigating a relational conflict, grief, sexual identity, trauma, and those seeking a safe space to understand themselves and where they fit into all of this.</p><p>Please come however you are with whatever you have left. Perhaps you are shamed, weary, or just stuck. The courage to be known and to present yourself in weakness has a lot more to say to you. "The clouds you so much dread are actually big with mercy and shall break in blessings - (yeah, blessings) - upon your head" (William Cowper, 1774). It would be my privilege to work with you!</p>'
WHERE `id` = 6;

UPDATE `counselors` SET `email` = 'Elzaba@compasslex.com' WHERE `id` = 5;
UPDATE `counselors` SET `email` = 'Matt@compasslex.com' WHERE `id` = 6;
