CREATE OR REPLACE TRIGGER salesinvoicetab_trg
  BEFORE INSERT OR UPDATE ON salesinvoicetab
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.db_id IS NULL
    THEN
      :new.db_id := salesinvoice_seq.nextval;
    END IF;

    :new.db_deleted := 'N';
  END IF;
  
  :new.db_beg := SYSDATE;
  :new.mod_user_id := sys_context('USERENV', 'OS_USER');
END salesinvoicetab_trg;
/
