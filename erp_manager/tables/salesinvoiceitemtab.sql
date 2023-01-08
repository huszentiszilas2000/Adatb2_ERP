create table salesinvoiceitemtab(
       db_id             number primary key,
       salesinvoice_id   number not null,
       salesorderitem_id number not null,
       fizetett          varchar2(1),      
       db_beg            timestamp(6),
       mod_user_id       varchar2(300),
       db_deleted        varchar2(1)      
)
TABLESPACE USERS;
