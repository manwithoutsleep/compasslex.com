UPDATE `counselors` SET
`shortdescription` = 'In the counseling journey, I hope to come alongside you as you wrestle with the inherent difficulties and struggles associated with life. Damaged relationships, disappointments, insecurities, hurt, trauma, and anxieties… it all can be overwhelming and debilitating at times. But I believe healing is possible, and together we can figure out what your next steps on that journey may be...'
WHERE `id` = 1;

UPDATE `counselors` SET
`shortdescription` = 'Our counseling relationship will be based on mutual trust and respect. Throughout sessions, we will work together to identify your goals for counseling and how to move forward to meet those goals. Inherent in each of us are strengths and abilities that help us take steps towards growth and healing in life. The most important thing to remember is: You can do this!..... and I would love to help.'
WHERE `id` = 2;

UPDATE `counselors` SET
`shortdescription` = 'Disillusionment and suffering are inevitable parts of every life; wounding from the past has a way of rearing its head when you least expect it, creating anxiety, depression, relational difficulties, and more. God has always been in the business of redeeming broken things and that means restoration is possible for you! I understand that asking for help feels risky... and I want to provide a safe space to explore your story and its impact on your life.'
WHERE `id` = 4;

DELETE FROM `insurances` WHERE `counselorid` = 3;
INSERT INTO `insurances` (`counselorid`,`content`) VALUES
(3,'Aetna Better Health'),
(3,'Passport'),
(3,'Wellcare'),
(3,'Humana Medicaid'),
(3,'Anthem Medicaid');

DELETE FROM `titles` WHERE `content` = 'Clinical Director';
