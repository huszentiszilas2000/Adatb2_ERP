CREATE OR REPLACE TRIGGER materialtab_h_trg
  BEFORE INSERT OR UPDATE OR DELETE ON materialtab_h
  FOR EACH ROW
DECLARE
  v_mod_user materialtab_h.mod_user_id%TYPE;
  v_mod_time materialtab_h.db_end%TYPE;
BEGIN
  v_mod_user := sys_context('USERENV', 'OS_USER');
  v_mod_time := SYSDATE;
  
  IF deleting
  THEN
    INSERT INTO materialtab_h(db_id,
                         nev,
                         ar,
                         db_beg,
                         db_end,
                         mod_user_id,
                         db_deleted)
                         values(:old.db_id,
                                :old.nev,
                                :old.ar,
                                :old.db_beg,
                                v_mod_time,
                                v_mod_user,
                                'Y');
  ELSE
    INSERT INTO partnertab_h(db_id,
                         nev,
                         ar,
                         db_beg,
                         db_end,
                         mod_user_id,
                         db_deleted)
                         values(:new.db_id,
                                :new.nev,
                                :new.ar,
                                :new.db_beg,
                                :new.db_end,
                                :new.mod_user_id,
                                'N');
  END IF;
END materialtab_h_trg;
/
