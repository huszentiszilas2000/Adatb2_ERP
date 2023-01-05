ALTER TABLE stocktab
      ADD CONSTRAINT stock_deleted_boolean CHECK (db_deleted = 'Y' OR db_deleted = 'N');
      
ALTER TABLE stocktab
      ADD CONSTRAINT stock_cikk_id_fk FOREIGN KEY (cikk_id) REFERENCES materialtab(db_id);
