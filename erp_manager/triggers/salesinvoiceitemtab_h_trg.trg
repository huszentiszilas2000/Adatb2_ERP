create or replace trigger salesinvoiceitemtab_h_trg
  before insert or update or delete
  on salesinvoiceitemtab_h 
  for each row
declare
  v_mod_user salesinvoiceitemtab_h.mod_user_id%TYPE;
  v_mod_time salesinvoiceitemtab_h.db_end%TYPE;
begin
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
      ,db_end
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:old.db_id
      ,:old.salesinvoice_id
      ,:old.salesorderitem_id
      ,:old.fizetett
      ,:old.db_beg
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
      ,db_end
      ,mod_user_id
      ,db_deleted)
    VALUES
      (:new.db_id
      ,:new.salesinvoice_id
      ,:new.salesorderitem_id
      ,:new.fizetett
      ,:new.db_beg
      ,:new.db_end
      ,:new.mod_user_id
      ,'N');
  END IF;
end salesinvoiceitemtab_h_trg;
/
