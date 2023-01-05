CREATE OR REPLACE TYPE ty_salesorder AS OBJECT
(
  db_id      NUMBER,
  partner_id NUMBER,
  statusz    VARCHAR(30),
  salesorderitems ty_salesorderitem_list,

  CONSTRUCTOR FUNCTION ty_salesorder RETURN SELF AS RESULT
)
/
CREATE OR REPLACE TYPE BODY ty_salesorder IS

  CONSTRUCTOR FUNCTION ty_salesorder RETURN SELF AS RESULT IS
  BEGIN
    RETURN;
  END;

END;
/
