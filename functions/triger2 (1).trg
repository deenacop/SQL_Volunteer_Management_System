CREATE OR REPLACE TRIGGER hall_max_guests
AFTER INSERT ON EVENT
FOR EACH ROW
DECLARE
    v_hall_id HALL.HALLID%TYPE;
    v_max_guests NUMBER;
BEGIN
    v_hall_id := :NEW.HALLID;
    
    SELECT MAX(NumGuests)
    INTO v_max_guests
    FROM CLIENT
    WHERE CLIENTID IN (
        SELECT ID
        FROM HELPED
    );
    
    UPDATE HALL
    SET MAXGUESTS = v_max_guests
    WHERE HALLID = v_hall_id;
END;
/
