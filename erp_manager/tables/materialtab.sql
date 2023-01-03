create table materialtab(
       db_id            number primary key,
       nev              varchar2(30) not null,
       ar               number,
       db_beg           timestamp(6),
       db_end           timestamp(6),
       mod_user_id      number not null,
       db_deleted       varchar2(1)      
);
