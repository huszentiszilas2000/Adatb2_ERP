PL/SQL Developer Test script 3.0
6
BEGIN
  stock_pkg.stock_update(p_id        => :p_id,
                         p_cikk_id   => :p_cikk_id,
                         p_mennyiseg => :p_mennyiseg);
  COMMIT;
END;
3
p_id
1
11
4
p_cikk_id
1
10
4
p_mennyiseg
1
20
4
0
