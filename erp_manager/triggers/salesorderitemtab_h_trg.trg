CREATE OR REPLACE TRIGGER salesorderitemtab_h_trg
  BEFORE INSERT OR UPDATE OR DELETE ON salesorderitemtab_h
  FOR EACH ROW
DECLARE
  v_mod_user salesorderitemtab_h.mod_user_id%TYPE;
  v_mod_time salesorderitemtab_h.db_end%TYPE;
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
      ,db_end
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:old.db_id
      ,:old.salesorder_id
      ,:old.material_id
      ,:old.mennyiseg
      ,:old.db_beg
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
      ,db_end
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:new.db_id
      ,:new.salesorder_id
      ,:new.material_id
      ,:new.mennyiseg
      ,:new.db_beg
      ,:new.db_end
      ,:new.mod_user_id
      ,'N');
  END IF;
END salesorderitemtab_h_trg;
/
