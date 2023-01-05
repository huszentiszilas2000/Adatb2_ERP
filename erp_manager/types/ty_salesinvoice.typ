CREATE OR REPLACE TYPE ty_salesinvoice AS OBJECT
(
  db_id         NUMBER,
  statusz       VARCHAR(30),
  salesinvoices ty_salesinvoiceitem_list,

  CONSTRUCTOR FUNCTION ty_salesinvoice RETURN SELF AS RESULT
)
/
CREATE OR REPLACE TYPE BODY ty_salesinvoice IS

  CONSTRUCTOR FUNCTION ty_salesinvoice RETURN SELF AS RESULT IS
  BEGIN
    RETURN;
  END;

END;
/
