CREATE TABLE academy_details(
  name varchar(100) NOT NULL,
  game varchar(50) NOT NULL,
  address varchar(250) NOT NULL,
  phone varchar(50) NOT NULL,
  email varchar(50) NOT NULL,
  administrator varchar(50) NOT NULL,
  PRIMARY KEY (administrator)
);


CREATE TABLE coach(
  coach_id INT NOT NULL,
  coach_name varchar(50) NOT NULL,
  coach_adrs varchar(100) NOT NULL,
  level varchar(50) NOT NULL,
  coach_doj date NOT NULL,
  coach_dob date NOT NULL,
  sal float NOT NULL,
  coach_attendance INT NOT NULL,
  coach_phone varchar(50) NOT NULL,
  PRIMARY KEY (coach_id)
);

CREATE TABLE coach_achvmnt(
  coach_id INT NOT NULL,
  achvmnt varchar(250) NOT NULL,
  CONSTRAINT coach_achvmnt_ibfk_1 FOREIGN KEY (coach_id) REFERENCES coach(coach_id)
);

CREATE TABLE student(
  std_id INT NOT NULL,
  std_name varchar(50) NOT NULL,
  std_adrs varchar(250) NOT NULL,
  level varchar(50) NOT NULL,
  adm_date date NOT NULL,
  std_dob date NOT NULL,
  std_attendance int NOT NULL,
  std_phone bigint NOT NULL DEFAULT 0,
  PRIMARY KEY (std_id)
);

CREATE TABLE student_coach(
  std_id INT NOT NULL,
  coach_id INT NOT NULL,
  CONSTRAINT student_coach_ibfk_1 FOREIGN KEY (std_id) REFERENCES student(std_id),
  CONSTRAINT student_coach_ibfk_2 FOREIGN KEY (coach_id) REFERENCES coach(coach_id)
);

CREATE TABLE doubles_team(
  player1 int DEFAULT NULL,
  player2 INT DEFAULT NULL,
  CONSTRAINT doubles_team_ibfk_1 FOREIGN KEY (player1) REFERENCES student(std_id),
  CONSTRAINT doubles_team_ibfk_2 FOREIGN KEY (player2) REFERENCES student(std_id)
);

CREATE TABLE fee_details(
  level varchar(50) NOT NULL,
  fee float NOT NULL,
  PRIMARY KEY (level)
);


CREATE TABLE other_staff(
  staff_id INT NOT NULL,
  staff_name varchar(100) NOT NULL,
  staff_adrs varchar(250) NOT NULL,
  staff_doj date NOT NULL,
  staff_dob date NOT NULL,
  staff_sal float NOT NULL,
  staff_attendance INT NOT NULL,
  section varchar(100) NOT NULL,
  PRIMARY KEY (staff_id)
);

CREATE TABLE scholarship(
  std_id INT NOT NULL,
  organisation varchar(100) NOT NULL,
  PRIMARY KEY (std_id)
);


CREATE TABLE sponsors(
  sponsor_name varchar(100) NOT NULL,
  amount float NOT NULL
);

CREATE TABLE std_achvmnt(
  std_id INT NOT NULL,
  achvmnt varchar(250) NOT NULL,
  CONSTRAINT std_achvmnt_ibfk_1 FOREIGN KEY (std_id) REFERENCES student(std_id)
);

CREATE TABLE training_schedule(
  std_id int NOT NULL,
  coach_id INT NOT NULL,
  timing varchar(100) NOT NULL,
  CONSTRAINT training_schedule_ibfk_1 FOREIGN KEY (std_id) REFERENCES student(std_id),
  CONSTRAINT training_schedule_ibfk_2 FOREIGN KEY (coach_id) REFERENCES coach(coach_id)
);

CREATE TABLE upcoming_event(
  name varchar(250) NOT NULL,
  date date NOT NULL,
  PRIMARY KEY (name)
);

INSERT INTO academy_details (name, game, address, phone, email, administrator) VALUES
	('smashers', 'Badminton', '12, forth line, mumbai', '92739192839', 'smashers@gmail.com', 'ramesh k mavan');

INSERT INTO coach (coach_id, coach_name, coach_adrs, level, coach_doj, coach_dob, sal, coach_attendance, coach_phone) VALUES
	(1, 'Garry', '09, jiji street, Mumbai', 'junior', '2012-09-09', '1973-02-03', 46125, 88, '93082948029'),
	(2, 'Shyama', '230, jiji street, Mumbai', 'junior', '2020-02-11', '1976-10-18', 45000, 84, '8937847829'),
	(3, 'Dilna', '112, lila street, Mumbai', 'senior', '2018-09-30', '1970-03-22', 52531.2, 94, '94278499293'),
	(4, 'John', '30, lenin street, Mumbai', 'senior', '2020-11-19', '1974-10-27', 50000, 90, '89379400200');

INSERT INTO coach_achvmnt(coach_id, achvmnt) VALUES
	(2, 'Best Coach 2020'),
	(3, 'Badminton Best Coach'),
	(4, 'National Badminton Championship for Adults'),
	(2, 'Mumbai Best Coach'),
	(3, 'Best Coach 2020'),
	(1, 'Best Coach 2021');


INSERT INTO student (std_id, std_name, std_adrs, level, adm_date, std_dob, std_attendance, std_phone) VALUES
	(1001, 'Lila', '111, Lenin street, Mumbai', 'senior', '2019-02-09', '2002-09-08', 88, 9088394890),
	(1002, 'Milena', '103, jiji street, Mumbai', 'senior', '2019-02-09', '2002-11-23', 98, 9458004892),
	(1003, 'Helen', '02, lila street, Mumbai', 'senior', '2019-02-09', '2002-03-12', 76, 9478367892),
	(1004, 'Thomas', '71, jiji street, Mumbai', 'senior', '2019-02-09', '2002-04-08', 98, 837994990),
	(1005, 'Xavier', '45, lila street, Mumbai', 'senior', '2019-02-09', '2002-10-18', 86, 9028764119),
	(1006, 'Rama', '19, lila street, Mumbai', 'senior', '2019-02-09', '2002-09-30', 93, 9478367892),
	(1007, 'Santhosh', '12, jiji street, Mumbai', 'senior', '2019-02-09', '2002-07-01', 98, 847892093),
	(1008, 'Rina', '45, lila street, Mumbai', 'senior', '2019-02-09', '2002-09-14', 87, 9374884888),
	(1009, 'Aji', '19, lila street, Mumbai', 'senior', '2019-02-09', '2002-07-25', 91, 9300003893),
	(1010, 'Tina', '223, lenin street, Mumbai', 'senior', '2019-02-09', '2002-02-22', 93, 9379002899),
	(1111, 'Venu', '09, linen, street, mumbai', 'junior', '2020-02-09', '2007-08-07', 88, 8293891289),
	(1112, 'Minu', '11, jiji street, Mumbai', 'junior', '2020-02-08', '2007-03-04', 98, 8278398263),
	(1113, 'Ziyana', '09, lila street, Mumbai', 'junior', '2020-02-08', '2007-02-11', 98, 8278310055),
	(1114, 'Milon', '10, jiji street, Mumbai', 'junior', '2020-02-08', '2007-12-09', 70, 8277891287),
	(1115, 'Ammu', '01, lenin street, Mumbai', 'junior', '2020-02-08', '2007-03-20', 83, 9083982809),
	(1116, 'Kishor', '13, titan street, Mumbai', 'junior', '2020-02-08', '2007-05-12', 78, 9029782880),
	(1117, 'Samual', '11, lenin street, Mumbai', 'junior', '2020-02-09', '2007-01-19', 86, 9782910389),
	(1118, 'Lailak', '04, jiji street, Mumbai', 'junior', '2020-02-08', '2007-03-16', 91, 8028938963),
	(1119, 'Hairath', '120, lila street, Mumbai', 'junior', '2020-02-08', '2007-12-23', 89, 9288378790),
	(1120, 'Masood', '112, lila street, Mumbai', 'junior', '2020-02-08', '2007-06-30', 93, 9378268198);

INSERT INTO student_coach(std_id, coach_id) VALUES
	(1111, 1),
	(1112, 1),
	(1113, 1),
	(1114, 1),
	(1115, 1),
	(1116, 2),
	(1117, 2),
	(1118, 2),
	(1119, 2),
	(1120, 2),
	(1001, 3),
	(1002, 3),
	(1003, 3),
	(1004, 3),
	(1005, 3),
	(1006, 4),
	(1007, 4),
	(1008, 4),
	(1009, 4),
	(1010, 4);

INSERT INTO doubles_team(player1, player2) VALUES
	(1001, 1005),
	(1002, 1006),
	(1003, 1007),
	(1004, 1008),
	(1009, 1010),
	(1111, 1115),
	(1112, 1116),
	(1113, 1117),
	(1114, 1118),
	(1119, 1120);


INSERT INTO fee_details(level, fee) VALUES
	('junior', 4500),
	('senior', 5000);

INSERT INTO other_staff(staff_id, staff_name, staff_adrs, staff_doj, staff_dob, staff_sal, staff_attendance, section) VALUES
	(10, 'Juvan', '89, jiji street, Mumbai', '2012-10-09', '1976-02-19', 45000, 89, 'Fee collection'),
	(11, 'Helana', '10, lenin street,Mumbai', '2018-12-23', '1982-05-12', 35000, 98, 'Clerk'),
	(12, 'David', 'lila street, Mumbai', '2017-05-28', '1980-09-09', 40000, 94, 'Health Attender'),
	(13, 'Sona', '12, jiji street, Mumbai', '2019-05-15', '1980-03-30', 15000, 79, 'Peon');

INSERT INTO scholarship(std_id, organisation) VALUES
	(1001, 'Ramalekshmana'),
	(1007, 'David and Sons'),
	(1010, 'Lila Coorporate'),
	(1112, 'KRS Company'),
	(1114, 'Philips'),
	(1119, 'Ramalekshmana');

INSERT INTO sponsors(sponsor_name, amount) VALUES
	('Ramalekshmana', 50000),
	('KRS Company', 65000),
	('Tata Sports', 100000),
	('Philips', 45000),
	('Konnic', 50000),
	('SportsKA', 65000);
    
INSERT INTO std_achvmnt (std_id, achvmnt) VALUES
	(1001, 'State Senior Badminton Championship - Gold'),
	(1010, 'State Senior Doubles - Bronze'),
	(1009, 'State Senior Doubles - Bronze'),
	(1114, 'State Junior Doubles - Silver'),
	(1118, 'State Junior Doubles - Silver'),
	(1003, 'National Badminton Championship - Gold');

INSERT INTO training_schedule(std_id, coach_id, timing) VALUES
	(1001, 3, '4:00-7:00 PM'),
	(1002, 3, '6:00-9:00 PM'),
	(1003, 3, '4:00-7:00 PM'),
	(1004, 3, '6:00-9:00 PM'),
	(1005, 3, '4:00-7:00 PM'),
	(1006, 4, '6:00-9:00 PM'),
	(1007, 4, '4:00-7:00 PM'),
	(1008, 4, '6:00-9:00 PM'),
	(1009, 4, '6:00-9:00 PM'),
	(1010, 4, '6:00-9:00 PM'),
	(1111, 1, '6:00-8:30 AM'),
	(1112, 1, '5:00-7:30 AM'),
	(1113, 1, '6:00-8:30 AM'),
	(1114, 1, '5:00-7:30 AM'),
	(1115, 1, '6:00-8:30 AM'),
	(1116, 2, '5:00-7:30 AM'),
	(1117, 2, '6:00-8:30 AM'),
	(1118, 2, '5:00-7:30 AM'),
	(1119, 2, '5:00-7:30 AM'),
	(1120, 2, '5:00-7:30 AM');


INSERT INTO upcoming_event(name, date) VALUES
	('BWF world junior', '2022-02-09'),
	('Cyprus junior', '2022-03-12'),
	('Junior Elite badminton championship', '2021-12-12'),
	('Junior Indian national championship', '2022-04-11'),
	('Malaysia international challenge', '2022-04-10'),
	('National Badminton Championship', '2022-10-13'),
	('Premier badminton league', '2022-09-11'),
	('Senior Indian national championship', '2022-02-21'),
	('State Badminton Championship', '2022-07-12');
