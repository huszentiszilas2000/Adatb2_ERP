CREATE OR REPLACE TRIGGER salesinvoiceitemtab_h_trg
  AFTER INSERT OR UPDATE OR DELETE ON salesinvoiceitemtab
  FOR EACH ROW
DECLARE
  v_mod_user salesinvoiceitemtab_h.mod_user_id%TYPE;
  v_mod_time salesinvoiceitemtab_h.db_beg%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO salesinvoiceitemtab_h
      (db_id
      ,salesinvoice_id
      ,salesorderitem_id
      ,fizetett
      ,db_beg
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:old.db_id
      ,:old.salesinvoice_id
      ,:old.salesorderitem_id
      ,:old.fizetett
      ,v_mod_time
      ,v_mod_user
      ,'Y');
  ELSE
    INSERT INTO salesinvoiceitemtab_h
      (db_id
      ,salesinvoice_id
      ,salesorderitem_id
      ,fizetett
      ,db_beg
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:new.db_id
      ,:new.salesinvoice_id
      ,:new.salesorderitem_id
      ,:new.fizetett
      ,v_mod_time
      ,:new.mod_user_id
      ,'N');
  END IF;
END salesinvoiceitemtab_h_trg;
/
