create table partnertab_h(
       db_id            number,
       nev              varchar2(30),
       partner_cim      varchar2(300),
       bankszamlaszam   varchar2(17),
       fizetesi_mod     varchar2(50),
       db_beg           timestamp(6),
       mod_user_id      varchar2(300),
       db_deleted       varchar2(1)      
);
