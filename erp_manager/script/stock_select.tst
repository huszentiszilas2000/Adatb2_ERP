PL/SQL Developer Test script 3.0
6
DECLARE
  RESULT ty_stock;
BEGIN
  RESULT := stock_pkg.stock_select(id => :id);
  dbms_output.put_line( 'Készlet száma: ' || result.db_id || ' Készlet cikk száma: ' || result.cikk_id || ' Készlet mennyisége: ' || result.mennyiseg || ' Db' );
END;
1
id
1
2
4
0
