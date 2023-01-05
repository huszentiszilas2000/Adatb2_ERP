CREATE OR REPLACE TRIGGER salesordertab_trg
  BEFORE INSERT OR UPDATE ON salesordertab
  FOR EACH ROW
BEGIN
  IF inserting
  THEN
    IF :new.db_id IS NULL
    THEN
      :new.db_id := salesorder_seq.nextval;
    END IF;
  
    :new.db_beg := SYSDATE;
    :new.db_end := to_date('31-12-9999 23:59:59', 'dd/mm/yyyy HH:MI:SS');
  END IF;

  :new.mod_user_id := sys_context('USERENV', 'OS_USER');
END salesordertab_trg;
/
