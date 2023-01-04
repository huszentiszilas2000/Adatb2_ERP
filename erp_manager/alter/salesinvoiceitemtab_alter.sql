ALTER TABLE salesinvoiceitemtab
      ADD CONSTRAINT mod_user_id_fk FOREIGN KEY (mod_user_id) REFERENCES usertab(db_id);

ALTER TABLE salesinvoiceitemtab
      ADD CONSTRAINT deleted_boolean CHECK (db_deleted = 'Y' OR db_deleted = 'N');

ALTER TABLE salesinvoiceitemtab
      ADD CONSTRAINT salesorderitem_id_fk FOREIGN KEY (salesorderitem_id) REFERENCES salesorderitemtab(db_id);
      
ALTER TABLE salesinvoiceitemtab
      ADD CONSTRAINT salesinvoice_id_fk FOREIGN KEY (salesinvoice_id) REFERENCES salesinvoicetab(db_id);      
