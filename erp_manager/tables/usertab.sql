create table usertab(
       db_id            number primary key,
       azonosito        varchar2(20) not null,
       nev              varchar2(30),
       aktiv            varchar(1),
       adminisztrator   number not null,
       db_beg           timestamp(6),
       db_end           timestamp(6),
       mod_user_id      number not null,
       db_deleted       varchar2(1)      
);
