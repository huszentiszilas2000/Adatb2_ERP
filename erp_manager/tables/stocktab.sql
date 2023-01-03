create table stocktab(
       db_id            number primary key,
       cikk_id          number not null,
       mennyiseg        number not null,
       db_beg           timestamp(6),
       db_end           timestamp(6),
       mod_user_id      number not null,
       db_deleted       varchar2(1)      
);
