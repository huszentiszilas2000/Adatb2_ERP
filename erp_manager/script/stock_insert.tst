PL/SQL Developer Test script 3.0
5
BEGIN
  stock_pkg.stock_insert(p_cikk_id   => :p_cikk_id,
                         p_mennyiseg => :p_mennyiseg);
  COMMIT;
END;
2
p_cikk_id
1
3
4
p_mennyiseg
1
20
4
0
