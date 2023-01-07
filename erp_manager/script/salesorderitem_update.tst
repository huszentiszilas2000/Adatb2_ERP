PL/SQL Developer Test script 3.0
8
BEGIN
  -- Call the procedure
  salesorderitem_pkg.salesorderitem_update(p_id            => :p_id,
                                           p_salesorder_id => :p_salesorder_id,
                                           p_material_id   => :p_material_id,
                                           p_mennyiseg     => :p_mennyiseg);
  COMMIT;
END;
4
p_id
1
6
4
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
