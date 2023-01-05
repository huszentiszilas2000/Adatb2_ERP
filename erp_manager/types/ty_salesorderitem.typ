CREATE OR REPLACE TYPE ty_salesorderitem AS OBJECT
(
  db_id         NUMBER,
  salesorder_id NUMBER,
  material_id   NUMBER,
  mennyiseg     NUMBER,

  CONSTRUCTOR FUNCTION ty_salesorderitem RETURN SELF AS RESULT
)
/
CREATE OR REPLACE TYPE BODY ty_salesorderitem IS

  CONSTRUCTOR FUNCTION ty_salesorderitem RETURN SELF AS RESULT IS
  BEGIN
    RETURN;
  END;

END;
/
