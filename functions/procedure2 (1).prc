CREATE OR REPLACE PROCEDURE CalculateEventTypeGuests
    (pEventType IN EVENTTYPE.TYPENAME%TYPE, pTotalGuests OUT NUMBER)
IS
    vEventTypeId EVENTTYPE.TYPEID%TYPE;
    vHallId HALL.HALLID%TYPE;
    vEventId EVENT.EVENTID%TYPE;
    vNumGuests CLIENT.NUMGUESTS%TYPE;
    CURSOR cEvents IS
        SELECT et.TYPEID, h.HALLID, e.EVENTID, c.NUMGUESTS
        FROM EVENT e
        JOIN EVENTTYPE et ON e.TYPEID = et.TYPEID
        JOIN HALL h ON e.HALLID = h.HALLID
        JOIN CLIENT c ON e.CLIENTID = c.CLIENTID
        WHERE et.TYPENAME = pEventType;
BEGIN
    pTotalGuests := 0;
    OPEN cEvents;
    LOOP
        FETCH cEvents INTO vEventTypeId, vHallId, vEventId, vNumGuests;
        EXIT WHEN cEvents%NOTFOUND;
        pTotalGuests := pTotalGuests + vNumGuests;
        DBMS_OUTPUT.PUT_LINE('Event ID: '||  vEventId  || 'Number of Guests: ' || vNumGuests);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Total Guests for '||  pEventType  ||' Events: '||  pTotalGuests);
    CLOSE cEvents;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No '||  pEventType || ' events found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred while calculating the total number of guests for '  ||pEventType||  ' events.');
END;
/
