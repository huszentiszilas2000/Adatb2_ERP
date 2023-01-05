create table salesorderitemtab(
       db_id            number primary key,
       salesorder_id    number not null,
       material_id      number not null,
       mennyiseg        number not null,
       db_beg           timestamp(6),
       mod_user_id      varchar2(300),
       db_deleted       varchar2(1)      
);
