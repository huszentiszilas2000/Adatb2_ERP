CREATE OR REPLACE TRIGGER salesordertab_h_trg
  AFTER INSERT OR UPDATE OR DELETE ON salesordertab
  FOR EACH ROW
DECLARE
  v_mod_user salesordertab_h.mod_user_id%TYPE;
  v_mod_time salesordertab_h.db_beg%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO salesordertab_h
      (db_id
      ,partner_id
      ,statusz
      ,db_beg
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:old.db_id
      ,:old.partner_id
      ,:old.statusz
      ,v_mod_time
      ,v_mod_user
      ,'Y');
  ELSE
    INSERT INTO salesordertab_h
      (db_id
      ,partner_id
      ,statusz
      ,db_beg
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:new.db_id
      ,:new.partner_id
      ,:new.statusz
      ,:new.db_beg
      ,:new.mod_user_id
      ,'N');
  END IF;
END salesordertab_h_trg;
/
