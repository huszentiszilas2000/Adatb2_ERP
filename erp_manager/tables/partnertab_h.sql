create table partnertab_h(
       db_id            number,
       nev              varchar2(30),
       partner_cim      varchar(300),
       bankszamlaszam   varchar(17),
       fizetesi_mod_id  number,
       db_beg           timestamp(6),
       db_end           timestamp(6),
       mod_user_id      varchar2(300),
       db_deleted       varchar2(1)      
);
