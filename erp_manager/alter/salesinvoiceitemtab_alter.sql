ALTER TABLE salesinvoiceitemtab
      ADD CONSTRAINT sii_deleted_boolean CHECK (db_deleted = 'Y' OR db_deleted = 'N');

ALTER TABLE salesinvoiceitemtab
      ADD CONSTRAINT sii_salesorderitem_id_fk FOREIGN KEY (salesorderitem_id) REFERENCES salesorderitemtab(db_id);
      
ALTER TABLE salesinvoiceitemtab
      ADD CONSTRAINT sii_salesinvoice_id_fk FOREIGN KEY (salesinvoice_id) REFERENCES salesinvoicetab(db_id);      
