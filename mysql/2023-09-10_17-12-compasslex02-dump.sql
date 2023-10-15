-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 10, 2023 at 03:11 PM
-- Server version: 5.7.42-cll-lve
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `compasslex02`
--

-- --------------------------------------------------------

--
-- Table structure for table `counselors`
--

CREATE TABLE `counselors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `isactive` bit(1) NOT NULL DEFAULT b'1',
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `email` varchar(250) NOT NULL,
  `practitionerid` int(11) NOT NULL,
  `directoryid` varchar(50) NOT NULL,
  `shortdescription` varchar(1000) NOT NULL,
  `longdescription` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `counselors`
--

INSERT INTO `counselors` (`id`, `isactive`, `email`, `firstname`, `lastname`, `longdescription`, `phone`, `practitionerid`, `shortdescription`, `directoryid`, `sortorder`) VALUES
(1, b'1', 'Linda@compasslex.com', 'Linda', 'Fentress', '<p>Hi, I\'m Linda.</p><p>Following an undergraduate degree in Theology, I earned a Master\'s Degree in Counseling Education from Stephens College and am a member of the American Counseling Association and the American Association of Christian Counselors. Volunteering and working in pastorally focused roles for over two decades has allowed me to integrate the clinical aspects of psychology with the framework of spiritual truth.</p><p>I specialize in couples counseling and trauma related issues such as grief and PTSD. I have a special heart for children or families struggling to recover from divorce and/or blended families trying to make things work.</p><p>As a counselor, my primary mode of psychotherapy is an integrated approach that is custom designed for each client\'s unique needs. This means that I will draw on tools/techniques from the cognitive-behavioral, experiential, structural, narrative, and psychoanalytic schools of thought, although I lean most heavily into attachment theory. When engaged in family therapy, I view the family as a system, which means that the entire system must be respected and understood in order to bring about meaningful change.</p><p>Regardless of what life phase you are in, there are challenging issues that come up. Sometimes you will be able to improve your situation on your own. Other times it takes some outside help. I am committed to providing a safe, confidential, and compassionate environment where individuals, a couple, or an entire family can receive tools to overcome past and present difficulties. Healing is possible, and I\'d like to be a part of your journey.</p>', '(859) 721-3259', 11321, 'In the counseling journey, I hope to come alongside you as you wrestle with the inherent difficulties and struggles associated with life. Damaged relationships, disappointments, insecurities, hurt, trauma, and anxieties… it all can be overwhelming and debilitating at times. But I believe healing is possible, and together we can figure out what your next steps on that journey may be...', '55a158cbbb159d09dff1889c40b3af5d', 7),
(3, b'1', 'Julie@compasslex.com', 'Julie', 'Marchman', '<p>Hey there! I\'m Julie.</p><p>Following my undergraduate degree in counseling psychology, I was accepted into the master\'s program at Asbury Theological Seminary and joined Compass Christian Counseling as an intern. I am a member of the American Association of Marriage and Family Therapy and the Kentucky Counseling Association. My experience also comprises internships at Asbury University and Asbury Theological Seminary counseling centers. I am trained in premarital counseling and have pursued advanced training in Emotionally Focused Therapy to assist couples and families in resolving distress and creating more satisfying connections.</p><p>I previously served for two decades as a lay counselor in the church where I offered a faith-based model to individuals, couples, and families for emotional healing. I also served as a key-note speaker at conferences and retreats especially addressing sexual addiction, relational and parenting issues, as well as spiritual formation. I have also facilitated support groups for pregnancy loss and grief recovery.</p><p>Life is tough! Seeking therapy is a wise step. My counseling approach rests on the belief that reaching out for help is a sign of courage and strength. It is normal to need help in difficult times. I am passionate about working with individuals, couples, and families to help them overcome their hurdles. I use a collaborative and respectful style and am committed to creating a therapeutic relationship built on authenticity, trust, and acceptance.</p><p>I would be honored to work with you, so please feel free reach out with any questions about the process.</p>', '(770) 262-0635', 32663, 'Sometimes stress, trauma, hurts, and fears simply pile up. Ultimately, we all seek to improve our mental and emotional well-being and counseling has been proven effective. There\'s hope and reaching out is the first step. I am committed to listening and understanding your point of view while working to help you heal, grow, and find solutions. I would be honored to walk the process with you.', '', 6),
(4, b'1', 'Katrina@compasslex.com', 'Katrina', 'Cowen', '<p>Hi, I\'m Katrina</p><p>I earned my Master\'s Degree in Mental Health Counseling from Asbury Theological Seminary, having returned to school after many years devoted to raising my three sons and two daughters, along with my husband of 32 years. My years of experience in discipleship ministry and mentoring in my church brought me face to face with the honest questions that people ask as they confront life\'s struggles. My own experiences with suffering and challenging transitions led me to pursue a degree in counseling, hoping to help others as I have been helped.</p><p>In my counseling work I collaborate with the client to meet him or her right where they are, conceptualize where they want to be, then plan and implement the steps to reach the goal. I favor an integrative approach that utilizes several evidence-based treatment modalities including acceptance and commitment therapy, cognitive-behavioral practices, narrative therapy and mindfulness. My past clients have included those navigating issues of anxiety, depression, grief and loss, relationship conflict, obsessive-compulsive disorder, sexual abuse and trauma, and sexual identity. I have conducted pre-marital counseling using the Prepare/Enrich assessment, and have led group therapy.</p><p>Perhaps you too are facing life transitions, relational struggles or personal suffering. Perhaps a traumatic event from your past has re-surfaced, creating distress and distraction in your present life. I am deeply committed to helping you make meaning from your suffering, find redemptive purpose even in tragic circumstances, and live with authenticity. Contact me, and let\'s get started on your healing journey.</p>', '(859) 694-0025', 34732, 'Disillusionment and suffering are inevitable parts of every life; wounding from the past has a way of rearing its head when you least expect it, creating anxiety, depression, relational difficulties, and more. God has always been in the business of redeeming broken things and that means restoration is possible for you! I understand that asking for help feels risky... I want to provide a safe space to explore your story and its impact on your life.', 'ca134d0122c9c6ec7a420e884d9d8df7', 5),
(5, b'1', 'Elzaba@compasslex.com', 'Elzaba', 'Anderson', '<p>Hi, I\'m Elzaba.</p><p>I earned my Masters degree from Asbury Theological Seminary in Mental Health Counseling. I am currently a member of the American Counseling Association, Kentucky Counseling Association and the Christian Association for Psychological Studies. Over the years, my life experiences have created a deep curiosity within me about the narratives and stories of people. My own counseling journey was transformational and this led me to pursuing a counseling degree in the hopes of walking alongside the powerful stories and narratives of my clients.</p><p>My counseling philosophy utilizes an integrative approach coupled with several evidence-based treatment modalities including attachment theory, cognitive behavioral therapy (CBT), acceptance and commitment therapy (ACT), as well as interventions including mindfulness practices and breathing techniques. Collaboration with the client to develop goals that can be implemented together is of utmost importance. My past work with clients have included navigating issues of depression, self-esteem, anxiety, eating disorders, life transitions, relationships, obsessive compusive disorder, sexual abuse and trauma.</p><p>I consider this work a sacred privilege and I am committed to listening, and helping clients find meaning and purpose in the midst of hardship and brokenness. Stories matter and I look forward to working alongside clients in this journey of healing and toward a greater sense of well-being.', '(859) 429-0086', 0, 'The power of counseling lies within its capacity to engage deeply with stories and a refusal to dismiss brokenness as permanent; to embrace it and to transform our suffering and pain into something of value and beauty. I partner alongside clients in this journey of healing, helping to unlock doors to freedom, peace and wholeness. There is hope.', 'D4F4C9B10475442D94CF6BCE974276DC', 3),
(6, b'1', 'Matt@compasslex.com', 'Matt', 'Ladwig', '<p>Hi, I\'m Matt.</p><p>I earned my Master\'s Degree in Mental Health Counseling from Asbury Theological Seminary after being called from a career in higher education. One morning while at my office job I found a man who had overdosed and died, which led me to seek out ways to support survivors of addiction. That experience paired with my own healing encounter with depression, guilt, and shame over the years encouraged me to pursue this field. I completed my degree while working full-time with three children. What a wild ride! God has used himself, the loving and tremendous support of my wife, my friends, church community, and education to continually form me.</p><p>The courage it takes to begin the work of counseling is truly remarkable, and that very courage is the foundation of my work with clients. I favor a strength-based, evidenced-based approach called Internal Family Systems (IFS). As an IFS-informed therapist, I believe when our core, true selves can be compassionately introduced to the hurt parts of us, unity and healing occurs. I also integrate Dialectical Behavior Therapy (DBT), Motivational Interviewing, and Acceptance and Commitment Therapy (ACT) approaches to collaborate with clients toward their goals.</p><p>My past clients have included couples, individuals, groups, those surviving an addiction, living with anxiety and/or depression, navigating a relational conflict, grief, sexual identity, trauma, and those seeking a safe space to understand themselves and where they fit into all of this.</p><p>Please come however you are with whatever you have left. Perhaps you are shamed, weary, or just stuck. The courage to be known and to present yourself in weakness has a lot more to say to you. \"The clouds you so much dread are actually big with mercy and shall break in blessings - (yeah, blessings) - upon your head\" (William Cowper, 1774). It would be my privilege to work with you!</p>', '(859) 320-7993', 0, 'The burdens of life are many and unique to each one of us. When these burdens give little space for our true selves to lead, disrupting the awareness of one\'s own brilliance and the beauty around them, counseling makes so much sense. It\'s a privilege to provide a clinical setting to befriend these burdens with the compassion they deserve so they can be known, healed, and redeemed.', '4964D704A1474386A9B66D8EEC8E34E1', 4),
(7, b'1', 'weston@compasslex.com', 'Weston', 'Beaven', '<p>Hi, I\'m Weston.</p><p>I earned my Master\'s degree in Clinical Mental Health Counseling from the University of the Cumberlands. After graduating with an undergraduate degree in education, I subsequently realized the last thing I wanted to do with my life was become a teacher. After some time, I discovered that a career in which I could get to know people on a deep and genuine level would be a good fit for me. My own experience with darkness has been one that brought me to seek professional help and has grown a desire in me for others to experience the healing and transformation that I have through counseling. Upon reflection of my life, I have learned that suffering and pain can be a gift from God. I have always been comfortable in conversations that may seem a bit heavy on the outside looking in and find joy in experiencing this with my clients.</p><p>My philosophical approach to the therapeutic relationship is an integrated one which is heavily driven by a mode of therapy labeled Internal Family Systems (IFS). This type of therapy holds the belief that our true self can be accessed through the unburdening of emotions, memories, and beliefs associated with our deepest hurts. I also offer EMDR (Eye Movement Desensitization and Reprocessing) therapy, which is a tool that offers a tangible way to heal from the symptoms and distress that are the result of trauma and adverse life experiences. My experience includes working with those who have faced challenges with PTSD, depression, anxiety, relationship issues, suicidal ideation/self-harm, homicidal ideation, anger, and chronic pain.</p><p>Whether you find yourself in pain, confused, outraged, numb, apathetic, etc., I can assure you that all parts of your being are welcome. It would genuinely be a joy for me to journey with you as you navigate your own unique circumstances, whatever they might be.</p>', '502-517-8136', 0, 'My goal as a therapist is to partner with you in a compassionate and authentic way,\r\nwherever you find yourself in life. Hardship can lead us to a point of feeling ashamed,\r\nhopeless, stuck, anxious, and frustrated.  When we find ourselves struggling, it is\r\neasy for our connections to become diminished and distorted. It would be a joy for me\r\nto work with you to restore a sense of hope, inner peace,  and excitement to be alive.', 'BABFFA046D6D4352BE7E690588F5D186', 1),
(8, b'1', 'martha@compasslex.com', 'Martha', 'Robertson', '\r\n<p>Hi. I\'m Martha.</p>\r\n<p>After retiring from a career in human resources and raising a family of four children,\r\nI felt the Lord was calling me to something more. Having spent many years leading a women\'s\r\nBible study group, I had a desire to learn how to make a difference for hurting women,\r\nmarried couples, and families. I earned my Master of Arts in Marriage and Family Counseling\r\nfrom Asbury Theological Seminary.</p>\r\n<p>My person-centered integrated approach is largely attachment based and pulls from\r\ntried-and-true modalities such as Emotionally Focused Therapy (EFT) for individuals,\r\ncouples, and families as well as Gottman couples therapy, family systems theory, cognitive\r\nbehavioral therapy (CBT), dialectical behavioral therapy (DBT), and more. I have been\r\nprivileged to come alongside those suffering with depression, anxiety, grief, low self-worth,\r\nand shame. I utilize the Prepare/Enrich assessment for those seeking premarital counseling\r\nand have worked with those struggling with sexual identity, marriage difficulties, family\r\nisolation, and emotional distance.</p>\r\n<p>I believe strongly that the Lord sees us in our pain and suffering and the Holy Spirit\r\nis present with us in the counseling room. As spiritual beings, it is important that we\r\nintegrate faith and the practice of sound, evidenced-based counseling principles. As we\r\nwork together to sort through the challenges you\'re facing, we will set goals that will\r\nhelp you get where you\'d like to be as a person made in the image of God, whether\r\nindividually, as a married couple, or as a family. May the Lord bless you as you take this\r\nfirst step toward counseling for a better future. I look forward to our work together!</p>\r\n', '502-209-7662', 0, 'You never know when you\'re going to wake up to find your world has changed. Grief,\r\nheartache, separation, or sadness within? Tension, anger, frustration or feeling\r\ninvisible to your spouse or other family members? Our work together will be to help\r\nyou see what has shifted in your world and learn how to move forward in new ways\r\ntoward healing and wholeness with yourself, your spouse, or your family.', '8A05D144DE88454B82D2156BCFCAFA99', 2);

-- --------------------------------------------------------

--
-- Table structure for table `credentials`
--

CREATE TABLE `credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `isactive` bit(1) NOT NULL DEFAULT b'1',
  `counselorid` bigint(20) UNSIGNED NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `content` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `credentials`
--

INSERT INTO `credentials` (`id`, `isactive`, `counselorid`, `sortorder`, `content`) VALUES
(10, b'1', 3, 1, 'M.A. in Marriage & Family Counseling, Asbury Theological Seminary, KY'),
(11, b'1', 3, 2, 'B.A. in Counseling Psychology, Toccoa Falls College, GA'),
(12, b'1', 3, 3, 'Externship and Core Skills training in Emotionally Focused Couple Therapy (EFT)'),
(13, b'1', 3, 4, 'Training in Emotionally Focused Therapy (EFT) for Trauma Recovery'),
(14, b'1', 3, 5, 'Training in Emotionally Focused Family Therapy (EFFT)'),
(15, b'1', 3, 6, 'Certified Facilitator in PREPARE/ENRICH Marital & Premarital Counseling'),
(16, b'1', 4, 1, 'M.A. in Mental Health Counseling, Asbury Theological Seminary, Wilmore, KY'),
(17, b'1', 4, 2, 'B.S. in Medical Technology, Morehead State University, Morehead, KY'),
(18, b'1', 4, 3, 'Licensed Professional Clinical Counselor (LPCC)'),
(19, b'1', 4, 4, 'Allender Center Training Certificate - Level 1, Seattle, WA'),
(20, b'1', 4, 5, 'Acceptance and Commitment Therapy Boot Camp, Philadelphia, PA'),
(27, b'1', 5, 1, 'M.A. in Mental Health Counseling, Asbury Theological Seminary, Wilmore, KY'),
(28, b'1', 5, 2, 'M.A in Diplomacy and International Commerce, University of Kentucky, Lexington, KY'),
(29, b'1', 5, 3, 'B.A in Business Administration, Asbury University, Wilmore, KY'),
(30, b'1', 5, 4, 'Licensed Professional Counseling Associate (LPCA)'),
(31, b'1', 5, 5, 'Completed Level 1 Training in Gottman Method Couples Therapy'),
(32, b'1', 5, 6, 'Story Sage Certified, Allender Center, Seattle, WA'),
(33, b'1', 6, 1, 'M.A. Mental Health Counseling, Asbury Theological Seminary, Wilmore, KY'),
(34, b'1', 6, 2, 'B.A. History, English, and Creative Writing, Centre College, Danville, KY'),
(35, b'1', 6, 3, 'Licensed Professional Counselor Associate (LPCA)'),
(36, b'1', 7, 1, 'MA in Clinical Mental Health Counseling, University of the Cumberlands'),
(37, b'1', 7, 2, 'BA in Secondary Education, Social Studies, University of Kentucky'),
(38, b'1', 8, 1, 'M.A. in Marriage and Family Counseling, Asbury Theological Seminary, Wilmore, KY'),
(40, b'1', 8, 2, 'Gottman Couples Therapy certified, level 1'),
(41, b'1', 8, 3, 'Certified facilitator, PREPARE/ENRICH premarital and marital counseling'),
(42, b'1', 1, 1, 'M.Ed. in Counseling, Stephens College, Columbia, MO'),
(43, b'1', 1, 2, 'Ph.D. in Counseling Education and Supervision, University of the Cumberlands, Williamsburg, KY'),
(44, b'1', 1, 3, 'B.A. in Theology, Ambassador College, Pasadena, CA'),
(45, b'1', 1, 4, 'Externship in Emotionally Focused Couples Therapy, Chicago Center for EFT'),
(46, b'1', 1, 5, 'Licensed Professional Clinical Counselor (LPCC)'),
(47, b'1', 1, 6, 'Certified Clinical Trauma Professional (CCTP)'),
(48, b'1', 3, 7, 'Marriage and Family Therapist, (MFT)');

-- --------------------------------------------------------

--
-- Table structure for table `insurances`
--

CREATE TABLE `insurances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `isactive` bit(1) NOT NULL DEFAULT b'1',
  `counselorid` bigint(20) UNSIGNED NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `content` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `insurances`
--

INSERT INTO `insurances` (`id`, `isactive`, `counselorid`, `sortorder`, `content`) VALUES
(1, b'1', 1, 1, 'Aetna'),
(2, b'1', 1, 2, 'Anthem Blue Cross/Blue Shield'),
(3, b'1', 1, 3, 'Cigna'),
(4, b'1', 1, 4, 'Humana'),
(5, b'1', 1, 5, 'Passport'),
(6, b'1', 1, 6, 'Wellcare'),
(12, b'1', 4, 1, 'Aetna Better Health'),
(13, b'1', 4, 2, 'Anthem BCBS Medicaid'),
(14, b'1', 4, 4, 'Humana Medicaid'),
(15, b'1', 4, 5, 'Passport'),
(16, b'1', 4, 6, 'Wellcare'),
(22, b'1', 5, 5, 'Passport'),
(23, b'1', 5, 6, 'Wellcare'),
(24, b'1', 5, 3, 'Anthem Medicaid'),
(25, b'1', 5, 4, 'Humana Medicaid'),
(26, b'1', 5, 1, 'Aetna Better Health'),
(27, b'1', 6, 5, 'Passport'),
(28, b'1', 6, 6, 'Wellcare'),
(29, b'1', 6, 3, 'Anthem Medicaid'),
(30, b'1', 6, 4, 'Humana Medicaid'),
(31, b'1', 6, 1, 'Aetna Better Health'),
(32, b'1', 7, 1, 'Aetna Better Health'),
(33, b'1', 7, 5, 'Passport'),
(34, b'1', 7, 6, 'Wellcare'),
(35, b'1', 7, 4, 'Humana Medicaid'),
(36, b'1', 7, 3, 'Anthem Medicaid'),
(37, b'1', 7, 2, 'Anthem Blue Cross/Blue Shield'),
(38, b'1', 8, 1, 'Aetna Better Health'),
(39, b'1', 8, 5, 'Passport'),
(40, b'1', 8, 6, 'Wellcare'),
(41, b'1', 8, 4, 'Humana Medicaid'),
(42, b'1', 8, 3, 'Anthem Medicaid'),
(43, b'1', 8, 2, 'Anthem Blue Cross/Blue Shield'),
(45, b'1', 4, 3, 'Anthem Blue Cross/Blue Shield'),
(46, b'1', 5, 2, 'Anthem Blue Cross/Blue Shield'),
(47, b'1', 6, 2, 'Anthem Blue Cross/Blue Shield'),
(48, b'1', 3, 1, 'Aetna'),
(49, b'1', 3, 2, 'Anthem Blue Cross/Blue Shield'),
(50, b'1', 3, 3, 'Cigna'),
(51, b'1', 3, 4, 'Humana'),
(52, b'1', 3, 5, 'Passport'),
(53, b'1', 3, 6, 'Wellcare');

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `isactive` bit(1) NOT NULL DEFAULT b'1',
  `counselorid` bigint(20) UNSIGNED NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `content` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`id`, `isactive`, `counselorid`, `sortorder`, `content`) VALUES
(1, b'1', 1, 1, 'American Counseling Association (ACA)'),
(2, b'1', 1, 1, 'American Association of Christian Counselors (AACC)'),
(6, b'1', 3, 1, 'American Association of Marriage and Family Therapists (AAMFT)'),
(7, b'1', 3, 1, 'Kentucky Counselors Association (KCA)'),
(8, b'1', 3, 1, 'International Centre for Excellence in Emotionally Focused Therapy (ICEEFT)'),
(9, b'1', 4, 1, 'American Counseling Association (ACA)'),
(10, b'1', 4, 1, 'Kentucky Counseling Association (KCA)'),
(11, b'1', 4, 1, 'Christian Association for Psychological Studies (CAPS)'),
(15, b'1', 5, 1, 'American Counseling Association (ACA)'),
(16, b'1', 5, 1, 'Kentucky Counseling Association (KCA)'),
(17, b'1', 5, 1, 'Christian Association for Psychological Studies (CAPS)'),
(18, b'1', 6, 1, 'American Counseling Association (ACA)'),
(19, b'1', 6, 1, 'Kentucky Counseling Association (KCA)'),
(20, b'1', 6, 1, 'Christian Association for Psychological Studies (CAPS)'),
(21, b'1', 7, 1, 'Kentucky Counseling Association (KCA)'),
(22, b'1', 7, 1, 'American Counseling Association (ACA)'),
(23, b'1', 8, 1, 'Kentucky Counseling Association (KCA)'),
(24, b'1', 8, 1, 'American Counseling Association (ACA)'),
(25, b'1', 8, 1, 'Christian Association for Psychological Studies (CAPS)'),
(26, b'1', 8, 1, 'International Association of Marriage and Family Counselors (IAMFC)');

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` smallint(6) NOT NULL,
  `quarter` tinyint(4) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `year`, `quarter`, `title`, `description`) VALUES
(1, 2016, 1, 'Building Resilience', NULL),
(2, 2016, 2, 'Moving Beyond Fear', NULL),
(3, 2016, 3, 'Building Happy Step-Families', NULL),
(4, 2016, 4, 'Managing Anger', NULL),
(5, 2017, 1, 'Assertiveness', NULL),
(6, 2017, 2, 'Compassionate Boundaries', NULL),
(7, 2017, 3, 'Grieving Well', NULL),
(8, 2017, 4, 'What Role Did You Play?', NULL),
(9, 2018, 1, 'How To Handle Passive Aggressive People', NULL),
(10, 2018, 2, 'Take A Deep Breath For Mental Health', NULL),
(11, 2018, 3, 'Embracing Change', NULL),
(12, 2018, 4, 'The Art Of Apology', NULL),
(13, 2019, 1, 'Unhelpful Thinking Styles', NULL),
(14, 2019, 2, 'Mindfulness', NULL),
(15, 2019, 3, 'Put On The Right Armor', NULL),
(16, 2019, 4, 'Gratitude: How It Changes Our Brain', NULL),
(17, 2020, 1, 'Managing Conflict: Six Essential Skills', NULL),
(18, 2020, 2, 'What To Do When The World Feels Out Of Control', NULL),
(19, 2020, 3, 'Imposter Syndrome', NULL),
(20, 2020, 4, 'Are You Feeling Lonely?', NULL),
(21, 2021, 1, 'Perfectionism vs. Excellence', NULL),
(22, 2021, 2, 'Why Self-Care Isn\'t Selfish', NULL),
(23, 2021, 3, 'How Good Are Your Listening Skills?', NULL),
(24, 2021, 4, 'The Comparison Trap', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `isactive` bit(1) NOT NULL DEFAULT b'1',
  `counselorid` bigint(20) UNSIGNED NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `content` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`id`, `isactive`, `counselorid`, `sortorder`, `content`) VALUES
(1, b'1', 1, 1, 'Ph.D, LPCC-S'),
(4, b'1', 3, 1, 'M. A., Marriage and Family Therapist'),
(5, b'1', 4, 1, 'M.A., LPCC'),
(6, b'1', 5, 1, 'M. A., LPCA'),
(7, b'1', 6, 1, 'M. A., LPCA'),
(8, b'1', 7, 1, 'M. A., LPCA'),
(9, b'1', 8, 1, 'M. A., Marriage and Family Therapist Associate');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `counselors`
--
ALTER TABLE `counselors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credentials`
--
ALTER TABLE `credentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_credential_counselor_id` (`counselorid`);

--
-- Indexes for table `insurances`
--
ALTER TABLE `insurances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_insurance_counselor_id` (`counselorid`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_membership_counselor_id` (`counselorid`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_title_counselor_id` (`counselorid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `counselors`
--
ALTER TABLE `counselors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `credentials`
--
ALTER TABLE `credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `insurances`
--
ALTER TABLE `insurances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `titles`
--
ALTER TABLE `titles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `credentials`
--
ALTER TABLE `credentials`
  ADD CONSTRAINT `fk_credential_counselor_id` FOREIGN KEY (`counselorid`) REFERENCES `counselors` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `insurances`
--
ALTER TABLE `insurances`
  ADD CONSTRAINT `fk_insurance_counselor_id` FOREIGN KEY (`counselorid`) REFERENCES `counselors` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `memberships`
--
ALTER TABLE `memberships`
  ADD CONSTRAINT `fk_membership_counselor_id` FOREIGN KEY (`counselorid`) REFERENCES `counselors` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `titles`
--
ALTER TABLE `titles`
  ADD CONSTRAINT `fk_title_counselor_id` FOREIGN KEY (`counselorid`) REFERENCES `counselors` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
