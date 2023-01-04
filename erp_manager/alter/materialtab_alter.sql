ALTER TABLE materialtab
      ADD CONSTRAINT mod_user_id_fk FOREIGN KEY (mod_user_id) REFERENCES usertab(db_id);

ALTER TABLE materialtab
      ADD CONSTRAINT deleted_boolean CHECK (db_deleted = 'Y' OR db_deleted = 'N');
