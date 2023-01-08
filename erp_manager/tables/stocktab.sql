create table stocktab(
       db_id            number primary key,
       cikk_id          number not null,
       mennyiseg        number not null,
       db_beg           timestamp(6),
       mod_user_id      varchar2(300),
       db_deleted       varchar2(1)      
)
TABLESPACE USERS;
