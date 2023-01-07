PL/SQL Developer Test script 3.0
33
DECLARE
  -- Non-scalar parameters require additional processing 
  RESULT      ty_salesorder;
  partner_nev VARCHAR2(300);
  cikk_nev    VARCHAR2(300);
  ar_out      NUMBER;
BEGIN
  -- Call the function
  RESULT := salesorder_pkg.salesorder_select(id => :id);

  SELECT pt.nev
    INTO partner_nev
    FROM partnertab pt
   WHERE pt.db_id = result.partner_id;
  dbms_output.put_line('Rendel�s sz�ma: ' || result.db_id ||
                       ' Partner neve: ' || partner_nev ||
                       ' Rendel�s st�tusza: ' || result.statusz);
  FOR i IN result.salesorderitems.first .. result.salesorderitems.last
  LOOP
    SELECT mt.nev
          ,mt.ar
      INTO cikk_nev
          ,ar_out
      FROM materialtab mt
     WHERE mt.db_id = result.salesorderitems(i).material_id;
    dbms_output.put_line('   T�tel sz�ma:' || result.salesorderitems(i)
                         .db_id || ' Cikk neve: ' || cikk_nev ||
                         ' Cikk darab �ra: ' || ar_out ||
                         ' Ft Rendelt mennyis�g: ' || result.salesorderitems(i)
                         .mennyiseg || ' Db �sszeg: ' || result.salesorderitems(i)
                         .mennyiseg * ar_out || ' Ft');
  END LOOP;
END;
1
id
1
16
4
0
