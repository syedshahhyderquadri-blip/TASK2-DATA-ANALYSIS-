# creating students table
CREATE TABLE Students1 (
  Student_ID INT PRIMARY KEY,
  Name VARCHAR2(50),
  Course VARCHAR2(20)
);

# creating applications table
CREATE TABLE Applications1 (
  Application_ID INT PRIMARY KEY,
  Student_ID INT,
  Job_ID INT,
  Status VARCHAR2(20)
);

# inserting students data
INSERT INTO Students1 VALUES (1,'Alice','CSE');
INSERT INTO Students1 VALUES (2,'Bob','ECE');
INSERT INTO Students1 VALUES (6,'Ashish','CSE');
INSERT INTO Students1 VALUES (7,'Pikachu','ECE');
INSERT INTO Students1 VALUES (8,'Rohan','ME');

# inserting applications data
INSERT INTO Applications1 VALUES (101,1,301,'Applied');
INSERT INTO Applications1 VALUES (102,2,302,'Shortlisted');
INSERT INTO Applications1 VALUES (103,6,301,'Rejected');
INSERT INTO Applications1 VALUES (104,7,303,'Applied');
INSERT INTO Applications1 VALUES (105,1,302,'Rejected');
INSERT INTO Applications1 VALUES (109,6,302,'Rejected');
INSERT INTO Applications1 VALUES (110,7,303,'Applied');
INSERT INTO Applications1 VALUES (111,8,303,'Rejected');

# showing students who applied for jobs
SELECT Student_ID, Name
FROM Students1
WHERE Student_ID IN (
    SELECT Student_ID
    FROM Applications1
);

# counting total applications for each job
SELECT Job_ID, COUNT(*) AS Total_Applications
FROM Applications1
GROUP BY Job_ID;

# counting applications of each student and ranking
SELECT Student_ID,
       COUNT(*) AS Application_Count,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS Rank_No
FROM Applications1
GROUP BY Student_ID;

# counting applied rejected and shortlisted students
WITH Status_Count AS (
    SELECT Status, COUNT(*) AS Total
    FROM Applications1
    GROUP BY Status
)
SELECT * FROM Status_Count;
