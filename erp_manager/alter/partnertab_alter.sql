ALTER TABLE partnertab
      ADD CONSTRAINT partner_deleted_boolean CHECK (db_deleted = 'Y' OR db_deleted = 'N');
