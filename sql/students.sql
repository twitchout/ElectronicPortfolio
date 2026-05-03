DROP TABLE IF EXISTS `kirj_courses`;

CREATE TABLE `kirj_courses` (
  `CourseCode` varchar(10) DEFAULT NULL,
  `CourseName` varchar(50) DEFAULT NULL,
  `Credits` int(11) DEFAULT NULL,
  `Instructor` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `kirj_courses` VALUES
('CIS101','Intro to Computer Science',3,'Dr. Smith'),
('CIS266','Web Development',4,'Dr. Johnson'),
('CIS310','Database Management',3,'Dr. Williams'),
('CIS350','Software Engineering',4,'Dr. Brown'),
('CIS420','Network Security',3,'Dr. Davis'),
('CIS450','Cloud Computing',3,'Dr. Wilson');