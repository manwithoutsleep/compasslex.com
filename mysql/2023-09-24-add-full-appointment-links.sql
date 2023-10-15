USE `compasslex02`;

ALTER TABLE `counselors` ADD COLUMN `appointmentlink` varchar(150) NOT NULL DEFAULT '' AFTER `practitionerid`;

UPDATE `counselors` SET `appointmentlink` = 'https://portal.therapyappointment.com/index.cfm/public:therapistdetail?directoryId=55a158cbbb159d09dff1889c40b3af5d' WHERE `id` =  1; -- Linda
UPDATE `counselors` SET `appointmentlink` = 'https://portal.therapyappointment.com/index.cfm/public:therapistdetail?directoryId=' WHERE `id` =  3; -- Julie
UPDATE `counselors` SET `appointmentlink` = 'https://portal.therapyappointment.com/index.cfm/public:therapistdetail?directoryId=ca134d0122c9c6ec7a420e884d9d8df7' WHERE `id` =  4; -- Katrina
UPDATE `counselors` SET `appointmentlink` = 'https://portal.therapyappointment.com/index.cfm/public:therapistdetail?directoryId=D4F4C9B10475442D94CF6BCE974276DC' WHERE `id` =  5; -- Elzaba
UPDATE `counselors` SET `appointmentlink` = 'https://portal.therapyappointment.com/index.cfm/public:therapistdetail?directoryId=4964D704A1474386A9B66D8EEC8E34E1' WHERE `id` =  6; -- Matt
UPDATE `counselors` SET `appointmentlink` = 'https://portal.therapyappointment.com/index.cfm/public:therapistdetail?directoryId=BABFFA046D6D4352BE7E690588F5D186' WHERE `id` =  7; -- Weston
UPDATE `counselors` SET `appointmentlink` = 'https://portal.therapyappointment.com/index.cfm/public:therapistdetail?directoryId=8A05D144DE88454B82D2156BCFCAFA99' WHERE `id` =  8; -- Martha
UPDATE `counselors` SET `appointmentlink` = 'https://api.portal.therapyappointment.com/n/public/clientRegistration?therapistId=1DBD2929C4A042339ED963F3F8BD41DE' WHERE `id` =  9; -- Julia
UPDATE `counselors` SET `appointmentlink` = 'https://api.portal.therapyappointment.com/n/public/clientRegistration?therapistId=141460F3FF91458E8FD61F6CD8391B22' WHERE `id` = 10; -- Joanna
