PL/SQL Developer Test script 3.0
14
DECLARE
  RESULT ty_salesinvoice;
BEGIN
  RESULT := salesinvoice_pkg.salesinvoice_select(id => :id);
  dbms_output.put_line('Számla száma: ' || result.db_id ||
                       ' Számla státusza: ' || result.statusz);
  FOR i IN result.salesinvoices.first .. result.salesinvoices.last
  LOOP
    dbms_output.put_line('   Tétel száma:' || result.salesinvoices(i)
                         .db_id || ' Vevõi rendelés száma: ' || result.salesinvoices(i)
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
