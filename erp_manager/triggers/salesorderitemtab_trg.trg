CREATE OR REPLACE TRIGGER salesorderitemtab_trg
  BEFORE INSERT OR UPDATE ON salesorderitemtab
  FOR EACH ROW
BEGIN
    IF :new.db_id IS NULL
    THEN
      :new.db_id := salesorderitem_seq.nextval;
    END IF;
  
    :new.db_beg    := SYSDATE;
    :new.db_end    := TO_DATE('31-12-9999');
  END IF;

  :new.mod_user_id := sys_context('USERENV', 'OS_USER');
END salesorderitemtab_trg;
/
