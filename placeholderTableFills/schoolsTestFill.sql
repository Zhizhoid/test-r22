DELETE FROM schools;
ALTER SEQUENCE schools_id_seq RESTART WITH 1;

DO $$

DECLARE i integer := 1;

BEGIN WHILE i <= 50 LOOP
	INSERT INTO schools("name")
	VALUES (format('Riga Secondary School No. %s', i));
	i := i+1;
end loop;

END $$;

SELECT * FROM schools;