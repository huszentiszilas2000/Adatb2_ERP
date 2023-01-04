ALTER TABLE paymenttab
      ADD CONSTRAINT deleted_boolean CHECK (db_deleted = 'Y' OR db_deleted = 'N');
