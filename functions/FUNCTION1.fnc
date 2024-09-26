CREATE OR REPLACE FUNCTION CalculateAverageSalary
    (pShiftType IN SHIFTS.SHIFT_TYPE%TYPE)
    RETURN NUMBER
IS
    vTotalSalary NUMBER := 0;
    vCount NUMBER := 0;
    vAvgSalary NUMBER;
BEGIN
    FOR shift IN (SELECT SALARY FROM SHIFTS WHERE SHIFT_TYPE = pShiftType)
    LOOP
        vTotalSalary := vTotalSalary + shift.SALARY;
        vCount := vCount + 1;
    END LOOP;
    
    IF vCount > 0 THEN
        vAvgSalary := vTotalSalary / vCount;
        RETURN vAvgSalary;
    ELSE
        RETURN NULL;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
    WHEN OTHERS THEN
        RETURN NULL;
END;
/
