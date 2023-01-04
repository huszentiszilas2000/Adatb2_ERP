create table salesordertab(
       db_id            number primary key,
       partner_id       number not null,
       statusz          varchar(30),
       db_beg           timestamp(6),
       db_end           timestamp(6),
       mod_user_id      varchar2(300),
       db_deleted       varchar2(1)      
);
