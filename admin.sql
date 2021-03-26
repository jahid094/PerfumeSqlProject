SET VERIFY OFF;
SET SERVEROUTPUT ON;

DECLARE
	
    
BEGIN
	DBMS_OUTPUT.PUT_LINE('Press 1 to insert product to perfume table');
	DBMS_OUTPUT.PUT_LINE('Press 2 to insert product to alcoholFreePerfume table');
	DBMS_OUTPUT.PUT_LINE('Press 3 to update product from perfume table');
	DBMS_OUTPUT.PUT_LINE('Press 4 to update product from alcoholFreePerfume table');
	DBMS_OUTPUT.PUT_LINE('Press 5 to delelte product from perfume table');
	DBMS_OUTPUT.PUT_LINE('Press 6 to delelte product from perfume table');

END;
/

accept X char prompt 'Enter the choice = ';

DECLARE
	choice perfume.pid%TYPE;
	Error EXCEPTION;
    
BEGIN
	choice := &X;

	IF choice = 1 THEN
		adminPack.InsertIntoPerfume(20, 'Edge Perfume', 'Wild stone',  '50ml','Men', 450);
	ELSIF choice = 2 THEN	
		adminPack.InsertIntoAlcoholFreePerfume(1020, 'Classic Attar', 'Al Rehab ','50ml','Women', 300);
	ELSIF choice = 3 THEN	
		adminPack.UpdatePerfumeTable(3 , 2000);		
	ELSIF choice = 4 THEN	
		adminPack.UpdateAlcoholFreePerfumeTable(1002 , 3000);
	ELSIF choice = 5 THEN	
		adminPack.delelteFromPerfumeTable(3);	
	ELSIF choice = 6 THEN	
		adminPack.delelteFromAlcoholFreePerfumeTable(1020);	
	ELSE
		RAISE Error;
	END IF;
	
EXCEPTION

	WHEN Error THEN
		DBMS_OUTPUT.PUT_LINE('YOU HAVE NOT SELECTED THE RIGHT OPTION. ');	
END;
/


select * from perfume;
select * from alcoholFreePerfume;
