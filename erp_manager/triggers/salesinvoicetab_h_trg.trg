CREATE OR REPLACE TRIGGER salesinvoicetab_h_trg
  BEFORE INSERT OR UPDATE OR DELETE ON salesinvoicetab_h
  FOR EACH ROW
DECLARE
  v_mod_user salesinvoicetab_h.mod_user_id%TYPE;
  v_mod_time salesinvoicetab_h.db_end%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO salesinvoicetab_h
      (db_id
      ,statusz
      ,db_beg
      ,db_end
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:old.db_id
      ,:old.statusz
      ,:old.db_beg
      ,v_mod_time
      ,v_mod_user
      ,'Y');
  ELSE
    INSERT INTO salesinvoicetab_h
      (db_id
      ,statusz
      ,db_beg
      ,db_end
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:new.db_id
      ,:new.statusz
      ,:new.db_beg
      ,:new.db_end
      ,:new.mod_user_id
      ,'N');
  END IF;
END salesinvoice_h_trg;
/
