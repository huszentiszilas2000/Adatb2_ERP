ALTER TABLE salesordertab
      ADD CONSTRAINT mod_user_id_fk FOREIGN KEY (mod_user_id) REFERENCES usertab(db_id);

ALTER TABLE salesordertab
      ADD CONSTRAINT deleted_boolean CHECK (db_deleted = 'Y' OR db_deleted = 'N');
      
ALTER TABLE salesordertab
      ADD CONSTRAINT partner_id_fk FOREIGN KEY (partner_id) REFERENCES partnertab(db_id);
