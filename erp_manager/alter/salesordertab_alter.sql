ALTER TABLE salesordertab
      ADD CONSTRAINT deleted_boolean CHECK (db_deleted = 'Y' OR db_deleted = 'N');
      
ALTER TABLE salesordertab
      ADD CONSTRAINT partner_id_fk FOREIGN KEY (partner_id) REFERENCES partnertab(db_id);
