create table partnertab(
       db_id            number primary key,
       nev              varchar2(30) not null,
       partner_cim      varchar(300),
       bankszamlaszam   varchar(17),
       fizetesi_mod_id  number not null,
       db_beg           timestamp(6),
       db_end           timestamp(6),
       mod_user_id      number not null,
       db_deleted       varchar2(1)      
);
