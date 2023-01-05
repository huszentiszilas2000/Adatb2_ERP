create table salesorderitemtab_h(
       db_id            number,
       salesorder_id    number,
       material_id      number,
       mennyiseg        number,
       db_beg           timestamp(6),
       mod_user_id      varchar2(300),
       db_deleted       varchar2(1)      
);
