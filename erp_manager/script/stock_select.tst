PL/SQL Developer Test script 3.0
6
DECLARE
  RESULT ty_stock;
BEGIN
  RESULT := stock_pkg.stock_select(id => :id);
  dbms_output.put_line( 'K�szlet sz�ma: ' || result.db_id || ' K�szlet cikk sz�ma: ' || result.cikk_id || ' K�szlet mennyis�ge: ' || result.mennyiseg || ' Db' );
END;
1
id
1
2
4
0
