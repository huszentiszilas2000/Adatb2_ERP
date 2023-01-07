PL/SQL Developer Test script 3.0
8
DECLARE
  RESULT ty_salesorderitem;
BEGIN
  RESULT := salesorderitem_pkg.salesorderitem_select(id => :id);
  dbms_output.put_line('Tétel száma: ' || result.db_id ||
                       ' Rendelés száma: ' || result.salesorder_id ||
                       ' Mennyiség: ' || result.mennyiseg || ' Db');
END;
1
id
1
4
4
0
