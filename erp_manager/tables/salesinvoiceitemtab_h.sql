create table salesinvoiceitemtab_h(
       db_id             number,
       salesinvoice_id   number,
       salesorderitem_id number,
       fizetett          varchar2(1),      
       db_beg            timestamp(6),
       mod_user_id       varchar2(300),
       db_deleted        varchar2(1)      
)
TABLESPACE USERS;
