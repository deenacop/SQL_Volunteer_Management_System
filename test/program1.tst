PL/SQL Developer Test script 3.0
6
DECLARE
    avgSalary NUMBER;
BEGIN
    avgSalary := CalculateAverageSalary('Day shift');
    DBMS_OUTPUT.PUT_LINE('Average Salary: ' || avgSalary);
END;
0
0
