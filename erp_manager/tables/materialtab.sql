create table materialtab(
       db_id            number primary key,
       nev              varchar2(30) not null unique,
       ar               number,
       db_beg           timestamp(6),
       db_end           timestamp(6),
       mod_user_id      varchar2(300),
       db_deleted       varchar2(1)      
);
