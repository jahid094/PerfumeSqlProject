SET VERIFY OFF;
SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE adminPack AS
	PROCEDURE InsertIntoPerfume(PID perfume.pid%TYPE , PNAME perfume.pname%TYPE , BRAND perfume.brand%TYPE, CAPACITY perfume.capacity%TYPE, GENDER perfume.gender%TYPE, PRICE perfume.price%TYPE  );
	PROCEDURE InsertIntoAlcoholFreePerfume(PID alcoholFreePerfume.pid%TYPE , PNAME alcoholFreePerfume.pname%TYPE , BRAND alcoholFreePerfume.brand%TYPE, CAPACITY alcoholFreePerfume.capacity%TYPE, GENDER alcoholFreePerfume.gender%TYPE, PRICE alcoholFreePerfume.price%TYPE  );
	PROCEDURE UpdatePerfumeTable(ID perfume.pid%TYPE, PRICE perfume.price%TYPE);
	PROCEDURE UpdateAlcoholFreePerfumeTable(ID alcoholFreePerfume.pid%TYPE, PRICE alcoholFreePerfume.price%TYPE);
	PROCEDURE delelteFromPerfumeTable(ID perfume.pid%TYPE);
	PROCEDURE delelteFromAlcoholFreePerfumeTable(ID alcoholFreePerfume.pid%TYPE);
END adminPack;
/

CREATE OR REPLACE PACKAGE BODY adminPack AS

	PROCEDURE InsertIntoPerfume(PID perfume.pid%TYPE , PNAME perfume.pname%TYPE , BRAND perfume.brand%TYPE, CAPACITY perfume.capacity%TYPE, GENDER perfume.gender%TYPE, PRICE perfume.price%TYPE  )
	IS
	BEGIN
		INSERT into perfume values(PID, PNAME, BRAND, CAPACITY,GENDER,PRICE);

	END InsertIntoPerfume;
	
	
	PROCEDURE InsertIntoAlcoholFreePerfume(PID alcoholFreePerfume.pid%TYPE , PNAME alcoholFreePerfume.pname%TYPE , BRAND alcoholFreePerfume.brand%TYPE, CAPACITY alcoholFreePerfume.capacity%TYPE, GENDER alcoholFreePerfume.gender%TYPE, PRICE alcoholFreePerfume.price%TYPE  )
	IS
	BEGIN
		INSERT into alcoholFreePerfume values(PID, PNAME, BRAND, CAPACITY,GENDER,PRICE);

	END InsertIntoAlcoholFreePerfume;
	
	PROCEDURE UpdatePerfumeTable(ID perfume.pid%TYPE, PRICE perfume.price%TYPE)
	IS
		pefumePrice perfume.price%TYPE;
	BEGIN
		pefumePrice := PRICE;
		FOR R IN (SELECT * FROM perfume) LOOP
			IF ID = R.pid THEN
				UPDATE perfume SET price = pefumePrice WHERE R.pid  = pid;
				DBMS_OUTPUT.PUT_LINE('Product updated successfully');
			END IF;
		END LOOP;

	END UpdatePerfumeTable;
	
	
	
	PROCEDURE UpdateAlcoholFreePerfumeTable(ID alcoholFreePerfume.pid%TYPE, PRICE alcoholFreePerfume.price%TYPE)
	IS
		pefumePrice alcoholFreePerfume.price%TYPE;
	BEGIN
		pefumePrice := PRICE;
		FOR R IN (SELECT * FROM alcoholFreePerfume) LOOP
			IF ID = R.pid THEN
				UPDATE alcoholFreePerfume SET price = pefumePrice WHERE R.pid  = pid;
				DBMS_OUTPUT.PUT_LINE('Product updated successfully');
			END IF;
		END LOOP;

	END UpdateAlcoholFreePerfumeTable;
	
	PROCEDURE delelteFromPerfumeTable(ID perfume.pid%TYPE)
	IS

	BEGIN
		FOR R IN (SELECT * FROM perfume) LOOP
			IF ID = R.pid THEN
				DELETE FROM perfume WHERE pid = R.pid;
				DBMS_OUTPUT.PUT_LINE('Product deleted successfully');
			END IF;
		END LOOP;

	END delelteFromPerfumeTable;
	
	
	PROCEDURE delelteFromAlcoholFreePerfumeTable(ID alcoholFreePerfume.pid%TYPE)
	IS

	BEGIN
		FOR R IN (SELECT * FROM alcoholFreePerfume) LOOP
			IF ID = R.pid THEN
				DELETE FROM alcoholFreePerfume WHERE pid = R.pid;
				DBMS_OUTPUT.PUT_LINE('Product deleted successfully');
			END IF;
		END LOOP;

	END delelteFromAlcoholFreePerfumeTable;
	

END adminPack;
/


