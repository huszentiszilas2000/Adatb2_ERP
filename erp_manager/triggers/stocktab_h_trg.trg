create or replace trigger stocktab_h_trg
  before insert or update or delete
  on stocktab_h 
  for each row
declare
  v_mod_user stocktab_h.mod_user_id%TYPE;
  v_mod_time stocktab_h.db_end%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;

  IF deleting
  THEN
    INSERT INTO stocktab_h(db_id,
                         cikk_id,
                         mennyiseg,
                         db_beg,
                         db_end,
                         mod_user_id,
                         db_deleted)
                         values(:old.db_id,
                                :old.cikk_id,
                                :old.mennyiseg,
                                :old.db_beg,
                                v_mod_time,
                                v_mod_user,
                                'Y');
  ELSE
    INSERT INTO stocktab_h(db_id,
                         cikk_id,
                         mennyiseg,
                         db_beg,
                         db_end,
                         mod_user_id,
                         db_deleted)
                         values(:new.db_id,
                                :new.cikk_id,
                                :new.mennyiseg,
                                :new.db_beg,
                                :new.db_end,
                                :new.mod_user_id,
                                'N');
  END IF;
end stocktab_h_trg;
/
