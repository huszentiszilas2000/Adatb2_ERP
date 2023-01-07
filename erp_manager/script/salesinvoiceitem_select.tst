PL/SQL Developer Test script 3.0
9
DECLARE
  RESULT ty_salesinvoiceitem;
BEGIN
  RESULT := salesinvoiceitem_pkg.salesinvoiceitem_select(id => :id);
  dbms_output.put_line('Számla tétel száma: ' || result.db_id ||
                       ' Rendelés tétel száma: ' ||
                       result.salesorderitem_id || ' Fizetett: ' ||
                       result.fizetett);
END;
1
id
1
3
4
0
