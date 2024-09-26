CREATE OR REPLACE PROCEDURE CalculateTotalEventBudget
    (totalBudget OUT NUMBER)
    eventBudget EVENT.BUDGET%TYPE;
    eventId EVENT.Eventid%TYPE;
    eventDate EVENT.Eventdate%TYPE;
    cursor cEventBudget IS
        SELECT BUDGET,Eventid,EventDate
        FROM EVENT;
BEGIN
    totalBudget := 0;
    OPEN cEventBudget;
    LOOP
        FETCH cEventBudget INTO eventBudget,eventId,eventDate;
        EXIT WHEN cEventBudget%NOTFOUND;
        totalBudget := totalBudget + eventBudget;
        DBMS_OUTPUT.PUT_LINE('Event ID ' || eventId || ' Event Date ' || eventDate);
    END LOOP;
        DBMS_OUTPUT.PUT_LINE('Total Event Budget ' || totalBudget );
    CLOSE cEventBudget;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Event with ID ' || eventId || ' does not exist.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred while calculating the total event budget.');
END;
/
