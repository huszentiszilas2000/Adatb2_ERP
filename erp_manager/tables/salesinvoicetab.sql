create table salesinvoicetab(
       db_id            number primary key,
       statusz          varchar(30),
       db_beg           timestamp(6),
       db_end           timestamp(6),
       mod_user_id      varchar2(300),
       db_deleted       varchar2(1)      
);
