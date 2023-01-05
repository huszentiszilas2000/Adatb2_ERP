CREATE OR REPLACE TRIGGER stocktab_trg
  BEFORE INSERT OR UPDATE ON stocktab
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.db_id IS NULL
    THEN
      :new.db_id := stock_seq.nextval;
    END IF;
  
    :new.db_deleted := 'N';
  END IF;

  :new.db_beg := SYSDATE;
  :new.mod_user_id := sys_context('USERENV', 'OS_USER');
END stocktab_trg;
/
