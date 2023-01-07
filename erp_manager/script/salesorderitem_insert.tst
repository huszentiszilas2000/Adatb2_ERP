PL/SQL Developer Test script 3.0
6
BEGIN
  salesorderitem_pkg.salesorderitem_insert(p_salesorder_id => :p_salesorder_id,
                                           p_material_id   => :p_material_id,
                                           p_mennyiseg     => :p_mennyiseg);
  COMMIT;
END;
3
p_salesorder_id
1
4
4
p_material_id
1
2
4
p_mennyiseg
1
-20
4
0
