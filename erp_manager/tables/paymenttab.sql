create table paymenttab(
       db_id            number primary key,
       fizetesi_mod     varchar2(30) not null,
       db_beg           timestamp(6),
       db_end           timestamp(6),
       mod_user_id      number not null,
       db_deleted       varchar2(1)      
);
