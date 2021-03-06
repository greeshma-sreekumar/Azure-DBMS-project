DELIMITER //
CREATE TRIGGER Age_Check_Coach
BEFORE INSERT ON coach
FOR EACH ROW 
BEGIN
    IF NEW.coach_dob>=CURRENT_DATE() THEN
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning! Birth date cannot be this';
    END IF;
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `Age_Check_Staff` BEFORE INSERT ON `other_staff` FOR EACH ROW BEGIN
IF NEW.staff_dob >= CURRENT_DATE() THEN
SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Warning! Birth date cannot be this';
END IF;
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER Check_Phone
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
IF ((NEW.std_phone/1000000000) <1) OR ((NEW.std_phone/1000000000) > 10) THEN
SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'MOBILE NUMBER IS NOT 10 DIGIT!';
END IF;
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER Coach_Sal_Achvmnt
AFTER INSERT ON coach_achvmnt
FOR EACH ROW
BEGIN
    UPDATE coach
    SET coach.sal = coach.sal * 1.025
    WHERE coach.coach_id = NEW.coach_id;
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER Event_Date
BEFORE INSERT ON upcoming_event
FOR EACH ROW
BEGIN
    IF NEW.date < CURRENT_DATE() THEN
        SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'THAT DATE EXCEEDED!';
    END IF;
END//
DELIMITER ;
