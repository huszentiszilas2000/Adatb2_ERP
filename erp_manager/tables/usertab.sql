create table usertab(
       db_id            number primary key,
       azonosito        varchar2(20) not null,
       nev              varchar2(30),
       aktiv            varchar(1),
       adminisztrator   varchar(1)   
);
