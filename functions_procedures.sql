DELIMITER //
CREATE FUNCTION check_scholarship(std_id INT)
RETURNS varchar(100)
BEGIN
	DECLARE org VARCHAR(100);
	SELECT scholarship.organisation FROM scholarship WHERE scholarship.std_id LIKE std_id INTO org;
	RETURN org;
END//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE coach_in_junior_level()
BEGIN
	SELECT coach.coach_name FROM coach
	WHERE coach.level LIKE "junior";
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE coach_in_senior_level()
BEGIN
	SELECT coach.coach_name FROM coach
	WHERE coach.level LIKE "senior";
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sponsor_above_70000()
BEGIN
	SELECT * FROM sponsors
	WHERE sponsors.amount > 70000;
END//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE StaffTaxAndSalaryDetails(
	IN StaffId INT,
	OUT tax_amount FLOAT
)
    COMMENT 'Tax amount is 2% for amount between 20000 and 40000 , it is 5% for 40000 to 60000 and 0 for less than 20000'
BEGIN
	DECLARE sal FLOAT;
	SELECT other_staff.staff_sal INTO sal FROM other_staff
	WHERE other_staff.staff_id = StaffId;
	IF sal<20000 THEN
		SET tax_amount=0;
	END IF;
	IF 20000<= sal<=40000 THEN
		SET tax_amount=sal*0.02;
	END IF;
	IF 40000<sal<60000 THEN
		SET tax_amount=sal*0.05;
	END IF;
	SELECT other_staff.staff_sal, tax_amount FROM other_staff
	WHERE other_staff.staff_id LIKE StaffId;
END//
DELIMITER ;


DELIMITER //

CREATE FUNCTION total_student()
RETURNS INT
BEGIN
	DECLARE total INT;
	DECLARE c1 CURSOR FOR SELECT COUNT(student.std_id) FROM student;
	OPEN c1;
	fetch c1 INTO total;
	close c1;
	RETURN total;
END//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE update_salary()
    COMMENT 'increase salary of all employee by 5%'
BEGIN
	UPDATE coach
	SET coach.sal = coach.sal*1.05;
END//
DELIMITER ;
