PL/SQL Developer Test script 3.0
9
DECLARE
  RESULT ty_salesinvoiceitem;
BEGIN
  RESULT := salesinvoiceitem_pkg.salesinvoiceitem_select(id => :id);
  dbms_output.put_line('Sz�mla t�tel sz�ma: ' || result.db_id ||
                       ' Rendel�s t�tel sz�ma: ' ||
                       result.salesorderitem_id || ' Fizetett: ' ||
                       result.fizetett);
END;
1
id
1
3
4
0
