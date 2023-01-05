create table partnertab(
       db_id            number primary key,
       nev              varchar2(30) not null,
       partner_cim      varchar(300),
       bankszamlaszam   varchar(17),
       fizetesi_mod     varchar(50),
       db_beg           timestamp(6),
       mod_user_id      varchar2(300),
       db_deleted       varchar2(1)      
);
