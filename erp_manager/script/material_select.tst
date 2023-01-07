PL/SQL Developer Test script 3.0
9
DECLARE
  -- Non-scalar parameters require additional processing 
  RESULT ty_material;
BEGIN
  -- Call the function
  RESULT := material_pkg.material_select(id => :id);
  dbms_output.put_line('Cikkszám: ' || result.db_id || ' Cikk neve: ' ||
                       result.nev || ' Ár: ' || result.ar || ' Ft');
END;
1
id
1
-1
4
0
