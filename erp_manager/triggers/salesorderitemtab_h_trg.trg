CREATE OR REPLACE TRIGGER salesorderitemtab_h_trg
  AFTER INSERT OR UPDATE OR DELETE ON salesorderitemtab
  FOR EACH ROW
DECLARE
  v_mod_user salesorderitemtab_h.mod_user_id%TYPE;
  v_mod_time salesorderitemtab_h.db_beg%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO salesorderitemtab_h
      (db_id
      ,salesorder_id
      ,material_id
      ,mennyiseg
      ,db_beg
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:old.db_id
      ,:old.salesorder_id
      ,:old.material_id
      ,:old.mennyiseg
      ,v_mod_time
      ,v_mod_user
      ,'Y');
  ELSE
    INSERT INTO salesorderitemtab_h
      (db_id
      ,salesorder_id
      ,material_id
      ,mennyiseg
      ,db_beg
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:new.db_id
      ,:new.salesorder_id
      ,:new.material_id
      ,:new.mennyiseg
      ,:new.db_beg
      ,:new.mod_user_id
      ,'N');
  END IF;
END salesorderitemtab_h_trg;
/
