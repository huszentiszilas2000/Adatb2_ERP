PL/SQL Developer Test script 3.0
14
DECLARE
  RESULT ty_salesinvoice;
BEGIN
  RESULT := salesinvoice_pkg.salesinvoice_select(id => :id);
  dbms_output.put_line('Sz�mla sz�ma: ' || result.db_id ||
                       ' Sz�mla st�tusza: ' || result.statusz);
  FOR i IN result.salesinvoices.first .. result.salesinvoices.last
  LOOP
    dbms_output.put_line('   T�tel sz�ma:' || result.salesinvoices(i)
                         .db_id || ' Vev�i rendel�s sz�ma: ' || result.salesinvoices(i)
                         .salesorderitem_id || ' Fizetett: ' || result.salesinvoices(i)
                         .fizetett);
  END LOOP;
END;
1
id
1
10
4
0
