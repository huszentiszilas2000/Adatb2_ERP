ALTER TABLE salesinvoicetab
      ADD CONSTRAINT salesinvoice_deleted_boolean CHECK (db_deleted = 'Y' OR db_deleted = 'N');
