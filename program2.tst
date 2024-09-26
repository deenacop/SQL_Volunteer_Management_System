PL/SQL Developer Test script 3.0
19
DECLARE
    personRole VARCHAR2(20);
BEGIN
    FOR i IN (
        SELECT ID
        FROM PERSON
        WHERE ROWNUM <= 50
    ) LOOP
        BEGIN
            personRole := DeterminePersonRole(i.ID);
            DBMS_OUTPUT.PUT_LINE('Person ID: ' || i.ID || ', Role: ' ||  personRole);
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('No data found for Person ID: ' ||  i.ID);
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('An error occurred for Person ID: ' || i.ID);
        END;
    END LOOP;
END;
0
0
