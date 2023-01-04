ALTER TABLE salesorderitemtab
      ADD CONSTRAINT mod_user_id_fk FOREIGN KEY (mod_user_id) REFERENCES usertab(db_id);

ALTER TABLE salesorderitemtab
      ADD CONSTRAINT deleted_boolean CHECK (db_deleted = 'Y' OR db_deleted = 'N');
      
ALTER TABLE salesorderitemtab
      ADD CONSTRAINT salesorder_id_fk FOREIGN KEY (salesorder_id) REFERENCES salesordertab(db_id);

ALTER TABLE salesorderitemtab
      ADD CONSTRAINT material_id_fk FOREIGN KEY (material_id) REFERENCES materialtab(db_id);
