create table salesinvoiceitemtab_h(
       db_id             number,
       salesinvoice_id   number,
       salesorderitem_id number,
       fizetett          varchar2(1)      
       db_beg            timestamp(6),
       db_end            timestamp(6),
       mod_user_id       number,
       db_deleted        varchar2(1)      
);
