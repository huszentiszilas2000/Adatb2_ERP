ALTER TABLE materialtab
      ADD CONSTRAINT material_deleted_boolean CHECK (db_deleted = 'Y' OR db_deleted = 'N');
