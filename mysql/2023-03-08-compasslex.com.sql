-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: compasslex.com
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

--
-- Table structure for table `counselors`
--

USE `compasslex_stage`;

DROP TABLE IF EXISTS `counselors`;
CREATE TABLE `counselors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(250) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `longdescription` varchar(4000) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `practitionerid` int(11) NOT NULL,
  `shortdescription` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `counselors`
--

LOCK TABLES `counselors` WRITE;
/*!40000 ALTER TABLE `counselors` DISABLE KEYS */;
INSERT INTO `counselors` VALUES 
(1,'Linda@compasslex.com','Linda','Fentress','<p>Hi, I\'m Linda.</p><p>Following an undergraduate degree in Theology, I earned a Master\'s Degree in Counseling Education from Stephens College and am a member of the American Counseling Association and the American Association of Christian Counselors. Volunteering and working in pastorally focused roles for over two decades has allowed me to integrate the clinical aspects of psychology with the framework of spiritual truth.</p><p>I specialize in couples counseling and trauma related issues such as grief and PTSD. I have a special heart for children or families struggling to recover from divorce and/or blended families trying to make things work.</p><p>As a counselor, my primary mode of psychotherapy is an integrated approach that is custom designed for each client\'s unique needs. This means that I will draw on tools/techniques from the cognitive-behavioral, experiential, structural, narrative, and psychoanalytic schools of thought, although I lean most heavily into attachment theory. When engaged in family therapy, I view the family as a system, which means that the entire system must be respected and understood in order to bring about meaningful change.</p><p>Regardless of what life phase you are in, there are challenging issues that come up. Sometimes you will be able to improve your situation on your own. Other times it takes some outside help. I am committed to providing a safe, confidential, and compassionate environment where individuals, a couple, or an entire family can receive tools to overcome past and present difficulties. Healing is possible, and I\'d like to be a part of your journey.</p>','(859) 721-3259',11321,'In the counseling journey, I hope to come alongside you as you wrestle with the inherent difficulties and struggles associated with life. Damaged relationships, disappointments, insecurities, hurt,trauma, and anxieties… it all can be overwhelming and debilitating as times. But I believe healing is possible!'),
(2,'Kelsi@compasslex.com','Kelsi','Butcher','<p>Hey there! I\'m Kelsi.</p><p>After obtaining an undergraduate degree in Psychology, I completed the Master\'s program for Counselor Education at Eastern Kentucky University.</p><p>In addition to my counseling education focusing on clinical skills, I have a deep passion for how the Christian faith intersects with the challenges we face. Following 3 months of intensive training in Christian counseling, I have served for the past 3 years as a lay counselor for a local church.</p><p>Something important that I have learned is that although we can handle some situations in our lives, there are times that we need to seek outside help. I am dedicated to providing all my clients with a safe and confidential environment to discuss whatever you may be wrestling with and providing tools to overcome challenges. Although equipped to handle a wide variety of issues, my focus areas include anxiety, depression, relationship issues, substance abuse, and trauma. I have a special heart for children and adolescents who may be struggling.</p><p>Please let me know how I can be a support to you. Together we can work to identify your goals for counseling and how to move forward to meet those goals. You can do this!.......and I would love to help.</p>','(606) 854-6988',31076,'Our counseling relationship will be based on trust and respect. Throughout sessions, we will work together to identify your goals for counseling and how to move forward to meet those goals. The most important thing to remember: You can do this!.....and I would love to help.'),
(3,'Julie@compasslex.com','Julie','Marchman','<p>Hey there! I\'m Julie.</p><p>Following my undergraduate degree in counseling psychology, I was accepted into the master\'s program at Asbury Theological Seminary and joined Compass Christian Counseling as an intern. I am a member of the American Association of Marriage and Family Therapy and the Kentucky Counseling Association. My experience also comprises internships at Asbury University and Asbury Theological Seminary counseling centers. I am trained in premarital counseling and have pursued advanced training in Emotionally Focused Therapy to assist couples and families in resolving distress and creating more satisfying connections.</p><p>I previously served for two decades as a lay counselor in the church where I offered a faith-based model to individuals, couples, and families for emotional healing. I also served as a key-note speaker at conferences and retreats especially addressing sexual addiction, relational and parenting issues, as well as spiritual formation. I have also facilitated support groups for pregnancy loss and grief recovery.</p><p>Life is tough! Seeking therapy is a wise step. My counseling approach rests on the belief that reaching out for help is a sign of courage and strength. It is normal to need help in difficult times. I am passionate about working with individuals, couples, and families to help them overcome their hurdles. I use a collaborative and respectful style and am committed to creating a therapeutic relationship built on authenticity, trust, and acceptance.</p><p>I would be honored to work with you, so please feel free reach out with any questions about the process.</p>','(770) 262-0635',32663,'Sometimes stress, trauma, hurts, and fears simply pile up. Ultimately, we all seek to improve our mental and emotional well-being and counseling has been proven effective. There\'s hope and reaching out is the first step. I am committed to listening and understanding your point of view while working to help you heal, grow, and find solutions. I would be honored to walk the process with you.');
/*!40000 ALTER TABLE `counselors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credentials`
--

DROP TABLE IF EXISTS `credentials`;
CREATE TABLE `credentials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `counselorid` bigint(20) unsigned NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_credential_counselor_id` (`counselorid`),
  CONSTRAINT `fk_credential_counselor_id` FOREIGN KEY (`counselorid`) REFERENCES `counselors` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `credentials`
--

LOCK TABLES `credentials` WRITE;
/*!40000 ALTER TABLE `credentials` DISABLE KEYS */;
INSERT INTO `credentials` VALUES
(1,1,'M.Ed in Counseling, Stephens College, Columbia, MO'),
(2,1,'B.A. in Theology, Ambassador College, Pasadena, CA'),
(3,1,'Externship in Emotionally Focused Couples Therapy, Chicago Center for EFT'),
(4,1,'Licensed Professional Clinical Counselor (LPCC)'),
(5,1,'Certified Clinical Trauma Professional (CCTP)'),
(6,2,'B.A. of Psychology, Eastern Kentucky University'),
(7,2,'M.A. in Counseling, Eastern Kentucky University'),
(8,2,'Licensed Professional Counseling Associate (LPCA)'),
(9,2,'Post-graduate training in Gottman Method of Couples Therapy'),
(10,3,'M.A. in Marriage & Family Counseling, Asbury Theological Seminary, KY (Aug. 2020)'),
(11,3,'B.A. in Counseling Psychology, Toccoa Falls College, GA'),
(12,3,'Externship and Core Skills training in Emotionally Focused Couple Therapy (EFT)'),
(13,3,'Training in Emotionally Focused Therapy (EFT) for Trauma Recovery'),
(14,3,'Training in Emotionally Focused Family Therapy (EFFT)'),
(15,3,'Certified Facilitator in PREPARE/ENRICH Marital & Premarital Counseling');
/*!40000 ALTER TABLE `credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurances`
--

DROP TABLE IF EXISTS `insurances`;
CREATE TABLE `insurances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `counselorid` bigint(20) unsigned NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_insurance_counselor_id` (`counselorid`),
  CONSTRAINT `fk_insurance_counselor_id` FOREIGN KEY (`counselorid`) REFERENCES `counselors` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `insurances`
--

LOCK TABLES `insurances` WRITE;
/*!40000 ALTER TABLE `insurances` DISABLE KEYS */;
INSERT INTO `insurances` VALUES
(1,1,'Aetna'),
(2,1,'Anthem Blue Cross/Blue Shield'),
(3,1,'Cigna'),
(4,1,'Humana'),
(5,1,'Passport'),
(6,1,'Wellcare'),
(7,2,'Aetna Better Health'),
(8,2,'Passport'),
(9,2,'Wellcare'),
(10,2,'Humana Medicaid'),
(11,2,'Anthem Medicaid');
/*!40000 ALTER TABLE `insurances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
CREATE TABLE `memberships` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `counselorid` bigint(20) unsigned NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_membership_counselor_id` (`counselorid`),
  CONSTRAINT `fk_membership_counselor_id` FOREIGN KEY (`counselorid`) REFERENCES `counselors` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `memberships`
--

LOCK TABLES `memberships` WRITE;
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
INSERT INTO `memberships` VALUES
(1,1,'American Counseling Association (ACA)'),
(2,1,'American Association of Christian Counselors (AACC)'),
(3,2,'Kentucky Counseling Association (KCA)'),
(4,2,'National Alliance on Mental Illness (NAMI)'),
(5,2,'The International Honor Society in Psychology'),
(6,3,'American Association of Marriage and Family Therapists (AAMFT)'),
(7,3,'Kentucky Counselors Association (KCA)'),
(8,3,'International Centre for Excellence in Emotionally Focused Therapy (ICEEFT)');
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titles`
--

DROP TABLE IF EXISTS `titles`;
CREATE TABLE `titles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `counselorid` bigint(20) unsigned NOT NULL,
  `content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_title_counselor_id` (`counselorid`),
  CONSTRAINT `fk_title_counselor_id` FOREIGN KEY (`counselorid`) REFERENCES `counselors` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `titles`
--

LOCK TABLES `titles` WRITE;
/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
INSERT INTO `titles` VALUES
(1,1,'M. Ed., LPCC'),
(2,1,'Clinical Director'),
(3,2,'M. A., LPCA'),
(4,3,'M.A. Marriage & Family Counseling (Aug. 2020)');
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
CREATE TABLE `newsletters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `year` smallint NOT NULL,
  `quarter` tinyint NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(4000) NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
INSERT INTO `newsletters` VALUES
(1,2016,1,'Building Resilience',NULL),
(2,2016,2,'Moving Beyond Fear',NULL),
(3,2016,3,'Building Happy Step-Families',NULL),
(4,2016,4,'Managing Anger',NULL),
(5,2017,1,'Assertiveness',NULL),
(6,2017,2,'Compassionate Boundaries',NULL),
(7,2017,3,'Grieving Well',NULL),
(8,2017,4,'What Role Did You Play?',NULL),
(9,2018,1,'How To Handle Passive Aggressive People',NULL),
(10,2018,2,'Take A Deep Breath For Mental Health',NULL),
(11,2018,3,'Embracing Change',NULL),
(12,2018,4,'The Art Of Apology',NULL),
(13,2019,1,'Unhelpful Thinking Styles',NULL),
(14,2019,2,'Mindfulness',NULL),
(15,2019,3,'Put On The Right Armor',NULL),
(16,2019,4,'Gratitude: How It Changes Our Brain',NULL);
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;



-- Dump completed on 2020-05-28 20:22:00
