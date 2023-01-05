CREATE OR REPLACE TRIGGER salesinvoiceitemtab_trg
  BEFORE INSERT OR UPDATE ON salesinvoiceitemtab
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.db_id IS NULL
    THEN
      :new.db_id := salesinvoiceitem_seq.nextval;
    END IF;
  
    :new.db_beg    := SYSDATE;
    :new.db_end    := TO_DATE('31-12-9999');
  END IF;

  :new.mod_user_id := sys_context('USERENV', 'OS_USER');
END salesinvoiceitemtab_trg;
/