CREATE OR REPLACE TYPE ty_stock AS OBJECT
(
  db_id     NUMBER,
  cikk_id   NUMBER,
  mennyiseg NUMBER,

  CONSTRUCTOR FUNCTION ty_stock RETURN SELF AS RESULT
)
/
CREATE OR REPLACE TYPE BODY ty_stock IS

  CONSTRUCTOR FUNCTION ty_stock RETURN SELF AS RESULT IS
  BEGIN
    RETURN;
  END;

END;
/
