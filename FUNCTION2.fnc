CREATE OR REPLACE FUNCTION DeterminePersonRole(pPersonId IN PERSON.ID%TYPE)
    RETURN VARCHAR2
IS
    vRole VARCHAR2(20);
BEGIN
    -- Check if the person is a volunteer
    SELECT 'Volunteer' INTO vRole FROM VOLUNTEER WHERE ID = pPersonId;

    IF vRole IS NOT NULL THEN
        RETURN vRole;
    END IF;

    -- Check if the person is a helped
    SELECT 'Helped' INTO vRole FROM HELPED WHERE ID = pPersonId;

    IF vRole IS NOT NULL THEN
        RETURN vRole;
    END IF;

    -- Check if the person is a shift manager
    SELECT 'Shift Manager' INTO vRole FROM SHIFT_MANAGER WHERE ID = pPersonId;

    IF vRole IS NOT NULL THEN
        RETURN vRole;
    END IF;

    -- Check if the person is a manager
    SELECT 'Manager' INTO vRole FROM MANAGER WHERE ID = pPersonId;

    IF vRole IS NOT NULL THEN
        RETURN vRole;
    END IF;

    -- If none of the above roles are found, return 'None'
    RETURN 'None';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'None';
    WHEN OTHERS THEN
        RETURN 'Error';
END;
/
