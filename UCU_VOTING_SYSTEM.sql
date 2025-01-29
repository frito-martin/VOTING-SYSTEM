use voting_system;
CREATE TABLE faculty (
    faculty_id VARCHAR(20) PRIMARY KEY,
    faculty_name VARCHAR(100) NOT NULL
);
INSERT INTO Faculty 
VALUES
('F01', 'School of Law'),
('F02', 'Faculty of Engineering, Design & Technology'),
('F03', 'School of Journalism, Media & Communication'),
('F04', 'School of Social Sciences'),
('F05', 'School of Business');

CREATE TABLE Student (
    student_id VARCHAR(30) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    enrollment_date DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    faculty_id varchar(20),
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);
SELECT *FROM student;
INSERT INTO Student (student_id, name, enrollment_date, email, phone, faculty_id)
VALUES
('S01', 'MUZEI FRITO', '2023-01-01', 'frito@.com', '0772345678', 'F01'),
('S02', 'KATEGA ABDUL', '2023-02-01', 'katega@.com', '0782345678', 'F02'),
('S03', 'KYAS MARY', '2023-03-01', 'kyas@.com', '0792345678', 'F03'),
('S04', 'EJADU JANANI', '2023-04-01', 'ejadu@.com', '0702345678', 'F04'),
('S05', 'EBORU AARON', '2023-05-01', 'eboru@.com', '0712345678', 'F05'),
('S06', 'ODEGEDA MICHEAL', '2023-06-01', 'odegeda@.com', '0722345678', 'F01'),
('S07', 'NABUKERA AISHA', '2023-07-01', 'nabukera@.com', '0732345678', 'F05'),
('S08', 'APIO ANGEL', '2023-08-01', 'apio@.com', '0742345678', 'F03'),
('S09', 'OKURUT OBRIEN', '2023-09-01', 'okurut@.com', '0752345678', 'F01'),
('S10', 'ONYIROTH REAGAN', '2023-10-01', 'onyiroth@.com', '0762345678', 'F05'),
('S11', 'NABISERE JEMIMA', '2023-11-01', 'nabisere@.com', '0772345678', 'F01'),
('S12', 'MUZEI MAIRA', '2023-12-01', 'muzei@.com', '0782345678', 'F02'),
('S13', 'OFWONO HILLARY', '2024-01-01', 'ofwono@.com', '0792345678', 'F02'),
('S14', 'TULIRINYA ROSE', '2024-02-01', 'tulirinya@.com', '0702345678', 'F04'),
('S15', 'NYAMUKENZO LILIAN', '2024-03-01', 'nyamukenzo@.com', '0712345678', 'F02'),
('S16', 'NTALO ISMA', '2024-04-01', 'ntalo@.com', '0722345678', 'F02'),
('S17', 'MAMBE PATIENCE', '2024-05-01', 'mambe@.com', '0732345678', 'F04'),
('S18', 'BUGUJJU WADEGEYA', '2024-06-01', 'bugujju@.com', '0742345678', 'F01'),
('S19', 'SIKULIBA PEACE', '2024-07-01', 'sikuliba@.com', '0752345678', 'F03');
INSERT INTO Student (student_id, name, enrollment_date, email, phone, faculty_id, gender)
VALUES
('S20', 'MUKIBI MARK', '2023-07-01', 'mark@.com', '0772345680', 'F01', 'M'),
('S21', 'KAMYA BEN', '2023-08-01', 'ben@.com', '0782345681', 'F02', 'F'),
('S22', 'SSEMBIJJA YASIN', '2023-09-01', 'yasin@.com', '0792345682', 'F03', 'M'),
('S23', 'EMILY DAVIS', '2023-10-01', 'davis@.com', '0702345683', 'F04', 'F'),
('S24', 'DAVID WILSON', '2023-11-01', 'wilson@.com', '0712345684', 'F05', 'M'),
('S25', 'LINDA JOHNSON', '2023-12-01', 'johnson@.com', '0722345685', 'F05', 'F'),
('S26', 'ROBERT MARTIN', '2024-01-01', 'robert@.com', '0732345686', 'F02', 'M');

ALTER TABLE student
ADD CONSTRAINT email_check
CHECK (email LIKE '%@%');
SELECT *FROM STUDENT;

CREATE TABLE Applicant (
    applicant_id VARCHAR(30) PRIMARY KEY,
    student_id VARCHAR(30),
    post_id VARCHAR(30),
    application_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (post_id) REFERENCES Post(post_id)
    );
    INSERT INTO Applicant VALUES
     ('A01', 'S01', 'P01', '2024-08-02'), ('A02', 'S02', 'P01', '2024-08-09'),
      ('A03', 'S03', 'P02', '2024-08-07'),('A04', 'S04', 'P04', '2024-08-01'),
      ('A05', 'S05', 'P03', '2024-08-05'),('A06', 'S06', 'P03', '2024-08-03'),
       ('A07', 'S07', 'P05', '2024-08-01'), ('A08', 'S08', 'P04', '2024-08-10'),
        ('A09', 'S09', 'P05', '2024-08-01'), ('A10', 'S10', 'P08', '2024-08-01'),
         ('A11', 'S11', 'P06', '2024-08-12'), ('A12', 'S12', 'P07', '2024-08-01'), 
         ('A13', 'S13', 'P01', '2024-08-03'), ('A14', 'S14', 'P02', '2024-08-01'),
          ('A15', 'S15', 'P08', '2024-08-11'), ('A16', 'S16', 'P04', '2024-08-01'),
          ('A17', 'S17', 'P05', '2024-08-08'),
     ('A18', 'S18', 'P06', '2024-08-01'), ('A19', 'S19', 'P02', '2024-08-01');
     SELECT *FROM  APPLICANT;
CREATE TABLE Post (
    post_id VARCHAR(30) PRIMARY KEY,
    post_name VARCHAR(40) NOT NULL,
    faculty_id VARCHAR(30),
    post_description TEXT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);
INSERT INTO Post VALUES ('P01', 'Guild President', NULL, 'The Guild President represents all students.'),
('P02', 'MP of Residence', NULL, 'The MP of Residence represents resident students.'),
('P03', 'MP of non Residence', NULL, 'The MP of non Residence represents non resident students.'),
 ('P04', 'MP of Law', 'F01', 'Represents students of the School of Law.'),
 ('P05', 'MP of Engineering', 'F02', 'Represents students of the Faculty of Engineering, Design & Technology.'),
  ('P06', 'MP of Journalism ', 'F03', 'Represents students of the School of Journalism, Media & Communication.'),
   ('P07', 'MP of Social Sciences', 'F04', 'Represents students of the School of Social Sciences.'),
    ('P08', 'MP of Business', 'F05', 'Represents students of the School of Business.');

select *from post;
CREATE TABLE Voter (
    voter_id VARCHAR(30) PRIMARY KEY,
    student_id VARCHAR(30),
    has_voted BOOLEAN,
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);
INSERT INTO Voter (voter_id, student_id, has_voted) VALUES ('V01', 'S01', FALSE),
 ('V02', 'S02', FALSE), ('V03', 'S03', FALSE), ('V04', 'S04', FALSE), ('V05', 'S05', FALSE),
  ('V06', 'S06', FALSE), ('V07', 'S07', FALSE), ('V08', 'S08', FALSE), ('V09', 'S09', FALSE), 
  ('V10', 'S10', FALSE), ('V11', 'S11', FALSE), ('V12', 'S12', FALSE), ('V13', 'S13', FALSE), 
  ('V14', 'S14', FALSE), ('V15', 'S15', FALSE), ('V16', 'S16', FALSE), ('V17', 'S17', FALSE), 
  ('V18', 'S18', FALSE),
 ('V19', 'S19', FALSE);
 desc nomination;
 
 CREATE TABLE Nomination (
    nomination_id INT PRIMARY KEY AUTO_INCREMENT,
    applicant_id VARCHAR(30),
    nominated_by VARCHAR(30),
    nomination_date DATE,
    FOREIGN KEY (applicant_id) REFERENCES Applicant(applicant_id),
    FOREIGN KEY (nominated_by) REFERENCES Voter(voter_id)
);

SELECT *
FROM Nomination
WHERE nominated_by = 'V05';
INSERT INTO Nomination 
VALUES ('N022','A12', 'V05', '2024-08-15');
select *from nomination;

-- Query to count nominations per applicant for each post(innar join)
SELECT 
    a.post_id,
    p.post_name,
    n.applicant_id,
    COUNT(n.nominated_by) AS nomination_count
FROM Nomination n
JOIN Applicant a ON n.applicant_id = a.applicant_id
JOIN Post p ON a.post_id = p.post_id
GROUP BY a.post_id, p.post_name, n.applicant_id
ORDER BY a.post_id, nomination_count DESC;


SELECT *FROM POST;
 SELECT *FROM applicant;



CREATE TABLE Vetting (
    vetting_id VARCHAR(30) PRIMARY KEY,
    nomination_id VARCHAR(30),
    status VARCHAR(50),
    reviewed_by VARCHAR(255),
    review_date DATE,
    FOREIGN KEY (nomination_id) REFERENCES Nomination(nomination_id)
);

INSERT INTO Vetting 
VALUES
('vg01','N001', 'Pending', 'Election Officer', '2024-10-08'),
('vg02','N002', 'Pending', 'Election Officer', '2024-10-09'),
('vg03','N003', 'Approved', 'Election Officer', '2024-10-10'),
('vg04','N010', 'Rejected', 'Director of Elections', '2024-10-15'),
('vg05','N019', 'Pending', 'Director of Elections', '2024-10-17'),
('vg06','N005', 'Approved', 'Director of Elections', '2024-10-12');
DROP TABLE ADMIN;
CREATE TABLE Admin (
    admin_id VARCHAR(30) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL,
    vetting_id VARCHAR(30),
    FOREIGN KEY (vetting_id) REFERENCES Vetting(vetting_id)
);
INSERT INTO Admin 
VALUES
('AD01', 'mr_micheal', 'Election Officer', 'vg01'),
('AD02', 'mr_kenneth', 'Election Officer', 'vg02'),
('AD03', 'mr_kubajja', 'Election Officer', 'vg03'),
('AD04', 'ms_Sarah', 'Director of Elections','vg04'),
('AD05', 'mr_ogang', 'Director of Elections','vg05'),
('AD06', 'ms_patient', 'Director of Elections','vg006');
SELECT vetting_id FROM Vetting;



CREATE TABLE Candidate (
    candidate_id VARCHAR(30) PRIMARY KEY,
    nomination_id VARCHAR(30),
    is_qualified BOOLEAN,
    FOREIGN KEY (nomination_id) REFERENCES Nomination(nomination_id)
);
select *from vetting;




CREATE TABLE Votes (
    vote_id VARCHAR(30) PRIMARY KEY,
    voter_id VARCHAR(30),
    candidate_id VARCHAR(30),
    post_id VARCHAR(30),
    vote_date DATE,
    FOREIGN KEY (voter_id) REFERENCES Voter(voter_id),
    FOREIGN KEY (candidate_id) REFERENCES Candidate(candidate_id),
    FOREIGN KEY (post_id) REFERENCES Post(post_id)
);
SELECT *FROM VOTES;

DROP TABLE RESULT;

CREATE TABLE Result (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_id VARCHAR(30) NOT NULL,
    total_votes INT DEFAULT 0,
    post_id VARCHAR(30) NOT NULL,
    faculty_id VARCHAR(30) NOT NULL
);

---it shows  posts without applicants(left join)

SELECT 
    p.post_id, 
    p.post_name
FROM 
    Post p
LEFT JOIN 
    Applicant a ON p.post_id = a.post_id
WHERE 
    a.applicant_id IS NULL;








----triggers----

----it will only allow voters to nominate once----
DELIMITER $$

CREATE TRIGGER validate_nomination
BEFORE INSERT ON Nomination
FOR EACH ROW
BEGIN
    DECLARE nomination_exists INT;

    SELECT COUNT(*)
    INTO nomination_exists
    FROM Nomination n
    JOIN Applicant a ON n.applicant_id = a.applicant_id
    JOIN Post p ON a.post_id = p.post_id
    WHERE n.nominated_by = NEW.nominated_by
      AND p.post_name = (SELECT post_name
                         FROM Applicant a2
                         JOIN Post p2 ON a2.post_id = p2.post_id
                         WHERE a2.applicant_id = NEW.applicant_id);

    IF nomination_exists > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'you have already nominated for this postion.';
    END IF;
END$$

DELIMITER ;
INSERT INTO Nomination 
VALUES ('N024','A12', 'V08', '2024-08-15');



--this trigger make update in the result table after  inserting into the votes 
DELIMITER //

CREATE TRIGGER AfterVoteInsert
AFTER INSERT ON Votes
FOR EACH ROW
BEGIN
    
    SET @faculty_id = (SELECT faculty_id FROM Post WHERE post_id = NEW.post_id);

    IF @faculty_id IS NULL THEN 
        SET @faculty_id = (SELECT faculty_id FROM Student s JOIN Voter v ON s.student_id = v.student_id WHERE v.voter_id = NEW.voter_id);
    END IF;

    INSERT INTO Result (candidate_id, post_id, total_votes, faculty_id)
    VALUES (NEW.candidate_id, NEW.post_id, 1, @faculty_id)  
    ON DUPLICATE KEY UPDATE total_votes = total_votes + 1;
END //
DELIMITER ;
-- Cast a vote (this triggers the AfterVoteInsert trigger)----
CALL AddVote('V023', 'V20', 'C03', 'P05', CURDATE());





-- ensure only qualified candidates can receive votes.

DELIMITER $$

CREATE TRIGGER validate_candidate_voting
BEFORE INSERT ON Votes
FOR EACH ROW
BEGIN
    DECLARE candidate_qualified BOOLEAN;

    SELECT is_qualified
    INTO candidate_qualified
    FROM Candidate
    WHERE candidate_id = NEW.candidate_id;

    IF candidate_qualified = FALSE THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'The candidate is not qualified for voting.';
    END IF;
END$$

DELIMITER ;
CALL AddVote('V023', 'V20', 'C04', 'P05', CURDATE());



-----Ensure One Vote Per Post
DELIMITER $$

CREATE TRIGGER before_vote_insert
BEFORE INSERT ON Votes
FOR EACH ROW
BEGIN
    DECLARE vote_exists INT;

    
    SELECT COUNT(*)
    INTO vote_exists
    FROM Votes
    WHERE voter_id = NEW.voter_id
      AND post_id = NEW.post_id;

    IF vote_exists > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'you have already voted for this post plizz.';
    END IF;
END$$
DELIMITER ;

CALL AddVote('V008', 'V01', 'C01', 'P01', CURDATE());
select *from candidate;


--------PROCEDURES 

 ----for dropping candidates
DELIMITER $$

CREATE PROCEDURE DropCandidate(
    IN candidateIds VARCHAR(255)
)
BEGIN
    DELETE FROM Candidate
    WHERE FIND_IN_SET(candidate_id, candidateIds);
END$$

DELIMITER ;
select *from candidate;
call dropcandidate('C06');

------adding voters
DELIMITER $$

CREATE PROCEDURE RegisterVoter(
    IN voterId VARCHAR(30),
    IN studentId VARCHAR(30)
)
BEGIN
    INSERT INTO Voter (voter_id, student_id, has_voted)
    VALUES (voterId, studentId, FALSE);
END$$

DELIMITER ;
call RegisterVoter('V23','S23');
select *from voter;


----voters can use to cast their votes:
DROP PROCEDURE AddVote;
DELIMITER $$
CREATE PROCEDURE AddVote(
    IN voteId VARCHAR(30),
    IN voterId VARCHAR(30),
    IN candidateId VARCHAR(30),
    IN postId VARCHAR(30),
    IN voteDate DATE
)
BEGIN
    INSERT INTO Votes (vote_id, voter_id, candidate_id, post_id, vote_date)
    VALUES (voteId, voterId, candidateId, postId, voteDate);
END$$

DELIMITER ;
CALL AddVote('V008', 'V01', 'C01', 'P01', CURDATE());


DELIMITER $$

CREATE PROCEDURE CheckVoterStatus(
    IN voterId VARCHAR(30)
)
BEGIN
    SELECT 
        voter_id,
        student_id,
        has_voted
    FROM Voter
    WHERE voter_id = voterId;
END$$

DELIMITER ;
call CheckVoterStatus('v01');



----update the Result table by counting votes in the Votes table.
DELIMITER //
CREATE PROCEDURE UpdateResult()
BEGIN
    DELETE FROM Result; 
    INSERT INTO Result (candidate_id, post_id, total_votes)
    SELECT 
        candidate_id, 
        post_id, 
        COUNT(*) AS total_votes
    FROM Votes
    GROUP BY candidate_id, post_id;
END //
DELIMITER ;
CALL UpdateResult();
ALTER TABLE Result MODIFY faculty_id VARCHAR(30) NULL; 
select *from result




---USER ACCOUNTS
DROP USER 'student_user'@'localhost'; 

CREATE USER 'election_officer'@'localhost' IDENTIFIED BY 'admin';
GRANT INSERT, SELECT ON voting_system.Student TO 'election_officer'@'localhost';
GRANT INSERT, SELECT ON voting_system.Applicant TO 'election_officer'@'localhost';
GRANT SELECT ON voting_system.Faculty TO 'election_officer'@'localhost';


CREATE USER 'student'@'localhost' IDENTIFIED BY 'changeme';

-- Granting permissions to view results
GRANT SELECT ON voting_system.Result TO 'student'@'localhost';
GRANT SELECT ON voting_system.Candidate TO 'student'@'localhost'; 
GRANT SELECT ON voting_system.Post TO 'student'@'localhost'; 


-- Granting permissions to apply for a post
GRANT INSERT ON voting_system.Applicant TO 'student_user'@'localhost';

-- Granting permissions to view available posts
GRANT SELECT ON voting_system.Post TO 'student_user'@'localhost';



-- Grant all permissions on all tables to the director of elections
CREATE USER 'director_elections'@'localhost' IDENTIFIED BY 'admin';

GRANT ALL PRIVILEGES ON voting_system.* TO 'director_elections'@'localhost';


-- Create a user for vetting officers with limited permissions.
CREATE USER 'vetting_officer'@'localhost' IDENTIFIED BY 'admin';

GRANT SELECT, INSERT, UPDATE ON voting_system.Nomination TO 'vetting_officer'@'localhost';
GRANT SELECT, INSERT, UPDATE ON voting_system.Vetting TO 'vetting_officer'@'localhost';









