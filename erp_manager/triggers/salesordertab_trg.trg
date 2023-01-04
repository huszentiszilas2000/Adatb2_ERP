create or replace trigger salesordertab_trg
  before insert or update
  on salesordertab 
  for each row
begin
  IF inserting
  THEN
    IF :new.db_id IS NULL
    THEN
      :new.db_id := salesorder_seq.nextval;
    END IF;
  
    :new.db_beg    := SYSDATE;
    :new.db_end    := TO_DATE('31-12-9999');
  END IF;

  :new.mod_user_id := sys_context('USERENV', 'OS_USER');
end salesordertab_trg;
/
