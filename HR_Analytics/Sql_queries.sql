CREATE DATABASE HR_Analysis;
USE HR_Analysis; 

# First Understand the Table

SELECT * FROM hr;
 
SELECT * FROM hr LIMIT 10; 

DESCRIBE hr; 

# 1.Total Employees

SELECT 
    COUNT(DISTINCT (employeenumber)) AS Total_Emloyees
FROM
    hr;  
# 2.Total Attrition of the employee.

SELECT 
    COUNT(Attrition) AS Total_Attrition_Employees
FROM
    hr
WHERE
    Attrition = 'YES';
 
# 3.The Attrition Rate (%)
SELECT 
ROUND(
(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) / COUNT(*)) * 100, 2
) AS Attrition_Rate_Percentage
FROM hr;

# 4. Total Active Employees
SELECT 
    COUNT(Attrition) AS Total_Active_Employees
FROM
    hr
WHERE
    Attrition = 'No';

# 5.The active rate (%)
SELECT 
    ROUND((COUNT(CASE
                WHEN Attrition = 'NO' THEN 1
            END) / COUNT(*)) * 100,
            2) AS Active_Rate_Percentage
FROM
    hr;

# 6.Attrition by Department.

SELECT 
    Department, COUNT(*) AS Attrition_Count
FROM
    hr
WHERE
    Attrition = 'Yes'
GROUP BY Department
ORDER BY Attrition_Count DESC; 

# 7.Attrition by Job Role.
SELECT 
    JobRole, COUNT(*) AS Attrition_Count
FROM
    hr
WHERE
    Attrition = 'Yes'
GROUP BY JobRole
ORDER BY Attrition_Count DESC;


# 8.Average Salary
SELECT 
    ROUND(AVG(Salary), 2) AS Avg_Salary
FROM
    hr;

# 9.Attrition by Salary
SELECT 
    Attrition, SUM(Salary) AS Salary
FROM
    hr
GROUP BY Attrition; 

# 10. Attrition by Average salary 
SELECT 
    Attrition, ROUND(AVG(Salary), 2) AS Avg_Salary
FROM
    hr
GROUP BY Attrition;  

# 11.Attrition by Years at Company.

SELECT 
    YearsAtCompany, COUNT(*) AS Attrition_Count
FROM
    hr
WHERE
    Attrition = "Yes"
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany; 

# 12.Attrition by Years Since Last Promotion 

SELECT 
    YearsSinceLastPromotion, COUNT(*) AS Attrition_Count
FROM
    hr
WHERE
    Attrition = 'Yes'
GROUP BY YearsSinceLastPromotion;

# 13. Attrition by Job Satisfaction 
SELECT 
    JobSatisfaction, COUNT(*) AS Attrition_Count
FROM
    hr
WHERE
    Attrition = 'Yes'
GROUP BY JobSatisfaction; 

# 14. Attrition by Work Life Balance
SELECT 
    WorkLifeBalance, COUNT(*) AS Attrition_Count
FROM
    hr
WHERE
    Attrition = 'Yes'
GROUP BY WorkLifeBalance; 

# 15.Attrition by OverTime 
SELECT 
    OverTime, COUNT(*) AS Attrition_Count
FROM
    hr
WHERE
    Attrition = 'Yes'
GROUP BY OverTime; 

# 16. Attrition by Business Travel 
SELECT 
    BusinessTravel, COUNT(*) AS Attrition_Count
FROM
    hr
WHERE
    Attrition = 'Yes'
GROUP BY BusinessTravel; 

# 17.Average Salary by Job Role
SELECT 
    JobRole, ROUND(AVG(Salary), 2) AS Avg_Salary
FROM
    hr
GROUP BY JobRole
ORDER BY Avg_Salary DESC;  

# 18.Average salary by Gender with there  Department.
SELECT 
    Department,Gender, ROUND(AVG(Salary), 2) AS Avg_Salary
FROM
    hr
GROUP BY Department,Gender;

# 19.Average Age of Employees
SELECT 
    ROUND(AVG(Age), 2) AS avg_age
FROM
    hr; 

# 20.Average Salary by Gender 
SELECT 
    Gender, ROUND(AVG(Salary), 2) AS Avg_Salary
FROM
    hr
GROUP BY Gender; 

# 21. Attrition by Gender 
SELECT 
    Gender, COUNT(*) AS Attrition_count
FROM
    hr
WHERE
    Attrition = 'Yes'
GROUP BY Gender; 



