CREATE OR REPLACE TRIGGER partnertab_h_trg
  AFTER INSERT OR UPDATE OR DELETE ON partnertab
  FOR EACH ROW
DECLARE
  v_mod_user partnertab_h.mod_user_id%TYPE;
  v_mod_time partnertab_h.db_beg%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO partnertab_h
      (db_id
      ,nev
      ,partner_cim
      ,bankszamlaszam
      ,fizetesi_mod
      ,db_beg
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:old.db_id
      ,:old.nev
      ,:old.partner_cim
      ,:old.bankszamlaszam
      ,:old.fizetesi_mod
      ,v_mod_time
      ,v_mod_user
      ,'Y');
  ELSE
    INSERT INTO partnertab_h
      (db_id
      ,nev
      ,partner_cim
      ,bankszamlaszam
      ,fizetesi_mod
      ,db_beg
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:new.db_id
      ,:new.nev
      ,:new.partner_cim
      ,:new.bankszamlaszam
      ,:new.fizetesi_mod
      ,:new.db_beg
      ,:new.mod_user_id
      ,'N');
  END IF;
END;
/
