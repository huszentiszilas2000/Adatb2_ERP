CREATE OR REPLACE TRIGGER materialtab_h_trg
  AFTER INSERT OR UPDATE OR DELETE ON materialtab
  FOR EACH ROW
DECLARE
  v_mod_user materialtab_h.mod_user_id%TYPE;
  v_mod_time materialtab_h.db_beg%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO materialtab_h
      (db_id
      ,nev
      ,ar
      ,db_beg
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:old.db_id
      ,:old.nev
      ,:old.ar
      ,v_mod_time
      ,v_mod_user
      ,'Y');
  ELSE
    INSERT INTO materialtab_h
      (db_id
      ,nev
      ,ar
      ,db_beg
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:new.db_id
      ,:new.nev
      ,:new.ar
      ,v_mod_time
      ,:new.mod_user_id
      ,'N');
  END IF;
END materialtab_h_trg;
/
