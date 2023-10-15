USE `compasslex.com`;

DELETE FROM `credentials` WHERE `counselorid` = 3;
DELETE FROM `insurances` WHERE `counselorid` = 3;
DELETE FROM `memberships` WHERE `counselorid` = 3;
DELETE FROM `titles` WHERE `counselorid` = 3;
DELETE FROM `counselors` WHERE `id` = 3;

INSERT INTO `counselors`
(`id`, `email`, `firstname`, `lastname`, `longdescription`, `phone`, `practitionerid`, `shortdescription`, `directoryid`, `sortorder`)
VALUES
(
7,
'weston@compasslex.com',
'Weston',
'Beaven',
'<p>Hi, I\'m Weston.</p>
<p>I earned my Master\'s degree in Clinical Mental Health Counseling from the University
of the Cumberlands. After graduating with an undergraduate degree in education, I
subsequently realized the last thing I wanted to do with my life was become a teacher.
After some time, I discovered that a career in which I could get to know people on a
deep and genuine level would be a good fit for me. My own experience with darkness has
been one that brought me to seek professional help and has grown a desire in me for
others to experience the healing and transformation that I have through counseling.
Upon reflection of my life, I have learned that suffering and pain can be a gift from
God. I have always been comfortable in conversations that may seem a bit heavy on the
outside looking in and find joy in experiencing this with my clients.</p>
<p>My philosophical approach to the therapeutic relationship is an integrated one in
which I draw from several evidence-based treatment modalities - these include Cognitive
Behavioral Therapy (CBT), Acceptance and Commitment Therapy (ACT), Client-Centered
Therapy, and Mindfulness Therapy. Some of the pillars of my counseling style include
acceptance, curiosity, focusing on strengths, compassion, and the narrative we tell
ourselves. My experience includes working with those who have faced challenges with PTSD,
depression, anxiety, relationship issues, suicidal ideation/self-harm, anger management,
chronic pain, and borderline personality disorder (BPD).</p>
<p>For some, the most difficult part of the process of beginning therapy is simply
starting and showing up to the first session. Therapy can be scary at times and the work
challenging, but it can also be transformational and life changing. Whether you find
yourself in pain, confused, outraged, numb, apathetic, etc., I can assure you that all
parts of your being are welcome.</p>',
'502-517-8136',
0,
'My goal as a therapist is to partner with you in a compassionate and authentic way,
wherever you find yourself in life. Hardship can lead us to a point of feeling ashamed,
hopeless, stuck, anxious, and frustrated.  When we find ourselves struggling, it is
easy for our connections to become diminished and distorted. It would be a joy for me
to work with you to restore a sense of hope, inner peace,  and excitement to be alive.',
'directory id',
1
),
(
8,
'martha@compasslex.com',
'Martha',
'Robertson',
'
<p>Hi. I\'m Martha.</p>
<p>After retiring from a career in human resources and raising a family of four children,
I felt the Lord was calling me to something more. Having spent many years leading a women\'s
Bible study group, I had a desire to learn how to make a difference for hurting women,
married couples, and families. I earned my Master of Arts in Marriage and Family Counseling
from Asbury Theological Seminary.</p>
<p>My person-centered integrated approach is largely attachment based and pulls from
tried-and-true modalities such as Emotionally Focused Therapy (EFT) for individuals,
couples, and families as well as Gottman couples therapy, family systems theory, cognitive
behavioral therapy (CBT), dialectical behavioral therapy (DBT), and more. I have been
privileged to come alongside those suffering with depression, anxiety, grief, low self-worth,
and shame. I utilize the Prepare/Enrich assessment for those seeking premarital counseling
and have worked with those struggling with sexual identity, marriage difficulties, family
isolation, and emotional distance.</p>
<p>I believe strongly that the Lord sees us in our pain and suffering and the Holy Spirit
is present with us in the counseling room. As spiritual beings, it is important that we
integrate faith and the practice of sound, evidenced-based counseling principles. As we
work together to sort through the challenges you\'re facing, we will set goals that will
help you get where you\'d like to be as a person made in the image of God, whether
individually, as a married couple, or as a family. May the Lord bless you as you take this
first step toward counseling for a better future. I look forward to our work together!</p>
',
'859-613-1523',
0,
'You never know when you\'re going to wake up to find your world has changed. Grief,
heartache, separation, or sadness within? Tension, anger, frustration or feeling
invisible to your spouse or other family member? Our work together will be to help
you see what has shifted in your world and learn how to move forward in new ways
toward healing and wholeness with yourself, your spouse, or your family.',
'directory id',
2
);

UPDATE `counselors` SET `sortorder` = 3 WHERE `firstname` = 'Elzaba';
UPDATE `counselors` SET `sortorder` = 4 WHERE `firstname` = 'Matt';
UPDATE `counselors` SET `sortorder` = 5 WHERE `firstname` = 'Kelsi';
UPDATE `counselors` SET `sortorder` = 6 WHERE `firstname` = 'Katrina';
UPDATE `counselors` SET `sortorder` = 7 WHERE `firstname` = 'Linda';

INSERT INTO `credentials`
(`counselorid`, `content`)
VALUES
(7, 'MA in Clinical Mental Health Counseling, University of the Cumberlands'),
(7, 'BA in Secondary Education, Social Studies, University of Kentucky'),
(8, 'M.A. in Marriage and Family Counseling, Asbury Theological Seminary, Wilmore, KY'),
(8, 'Licensed Professional Counselor Associate (LPCA)'),
(8, 'Gottman Couples Therapy certified, level 1'),
(8, 'Certified facilitator, PREPARE/ENRICH premarital and marital counseling');

INSERT INTO `insurances`
(`counselorid`, `content`)
VALUES
(7, 'Aetna Better Health'),
(7, 'Passport'),
(7, 'Wellcare'),
(7, 'Humana Medicaid'),
(7, 'Anthem Medicaid'),
(7, 'Anthem BlueCross/BlueShield'),
(8, 'Aetna Better Health'),
(8, 'Passport'),
(8, 'Wellcare'),
(8, 'Humana Medicaid'),
(8, 'Anthem Medicaid'),
(8, 'Anthem BlueCross/BlueShield');

INSERT INTO `memberships`
(`counselorid`, `content`)
VALUES
(7, 'Kentucky Counseling Association (KCA)'),
(7, 'American Counseling Association (ACA)'),
(8, 'Kentucky Counseling Association (KCA)'),
(8, 'American Counseling Association (ACA)'),
(8, 'Christian Association for Psychological Studies (CAPS)'),
(8, 'International Association of Marriage and Family Counselors (IAMFC)');

INSERT INTO `titles`
(`counselorid`, `content`)
VALUES
(7, 'M. A., LPCA'),
(8, 'M. A.');