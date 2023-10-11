DELETE FROM classes;
ALTER SEQUENCE classes_id_seq RESTART WITH 1;

DO $$

DECLARE i integer := 1;

BEGIN WHILE i <= 200 LOOP
	INSERT INTO classes(class_number, class_letter, school_id)
	VALUES (ceil(random()*12), 'a', ceil(random()*50));
	i := i+1;
end loop;

END $$;

SELECT * FROM classes;