CREATE OR REPLACE TYPE ty_partner AS OBJECT
(
  db_id          NUMBER,
  nev            VARCHAR2(30),
  partner_cim    VARCHAR(300),
  bankszamlaszam VARCHAR(17),
  fizetesi_mod   VARCHAR(50),

  CONSTRUCTOR FUNCTION ty_partner RETURN SELF AS RESULT
)
/
create or replace type body ty_partner is
  
 CONSTRUCTOR FUNCTION ty_partner RETURN SELF AS RESULT IS
  BEGIN
    RETURN;
  END;
  
end;
/
