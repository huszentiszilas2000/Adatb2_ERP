ALTER TABLE stocktab
      ADD CONSTRAINT mod_user_id_fk FOREIGN KEY (mod_user_id) REFERENCES usertab(db_id);

ALTER TABLE stocktab
      ADD CONSTRAINT deleted_boolean CHECK (db_deleted = 'Y' OR db_deleted = 'N');
      
ALTER TABLE stocktab
      ADD CONSTRAINT cikk_id_fk FOREIGN KEY (cikk_id) REFERENCES materialtab(db_id);
