CREATE OR REPLACE TYPE ty_salesinvoiceitem AS OBJECT
(
  db_id             NUMBER,
  salesinvoice_id   NUMBER,
  salesorderitem_id NUMBER,
  fizetett          VARCHAR2(1),

  CONSTRUCTOR FUNCTION ty_salesinvoiceitem RETURN SELF AS RESULT
)
/
CREATE OR REPLACE TYPE BODY ty_salesinvoiceitem IS

  CONSTRUCTOR FUNCTION ty_salesinvoiceitem RETURN SELF AS RESULT IS
  BEGIN
    RETURN;
  END;

END;
/
