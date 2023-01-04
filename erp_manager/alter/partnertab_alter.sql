ALTER TABLE partnertab
      ADD CONSTRAINT fizetesi_mod_id_fk FOREIGN KEY (fizetesi_mod_id) REFERENCES paymenttab(db_id);
  
ALTER TABLE partnertab
      ADD CONSTRAINT deleted_boolean CHECK (db_deleted = 'Y' OR db_deleted = 'N');
