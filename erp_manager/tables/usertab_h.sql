create table usertab_h(
       db_id            number,
       azonosito        varchar2(20),
       nev              varchar2(30),
       aktiv            varchar(1),
       adminisztrator   number,
       db_beg           timestamp(6),
       db_end           timestamp(6),
       mod_user_id      number,
       db_deleted       varchar2(1)      
);
