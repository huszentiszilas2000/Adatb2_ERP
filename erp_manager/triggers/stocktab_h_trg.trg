CREATE OR REPLACE TRIGGER stocktab_h_trg
  BEFORE INSERT OR UPDATE OR DELETE ON stocktab_h
  FOR EACH ROW
DECLARE
  v_mod_user stocktab_h.mod_user_id%TYPE;
  v_mod_time stocktab_h.db_end%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO stocktab_h
      (db_id
      ,cikk_id
      ,mennyiseg
      ,db_beg
      ,db_end
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:old.db_id
      ,:old.cikk_id
      ,:old.mennyiseg
      ,:old.db_beg
      ,v_mod_time
      ,v_mod_user
      ,'Y');
  ELSE
    INSERT INTO stocktab_h
      (db_id
      ,cikk_id
      ,mennyiseg
      ,db_beg
      ,db_end
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:new.db_id
      ,:new.cikk_id
      ,:new.mennyiseg
      ,:new.db_beg
      ,:new.db_end
      ,:new.mod_user_id
      ,'N');
  END IF;
END stocktab_h_trg;
/
