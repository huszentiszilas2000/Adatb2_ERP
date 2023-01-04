create table salesorderitemtab_h(
       db_id            number,
       salesorder_id    number,
       material_id      number,
       mennyiseg        number,
       db_beg           timestamp(6),
       db_end           timestamp(6),
       mod_user_id      number,
       db_deleted       varchar2(1)      
);
