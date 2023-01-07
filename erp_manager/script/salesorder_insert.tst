PL/SQL Developer Test script 3.0
5
BEGIN
  salesorder_pkg.salesorder_insert(p_partner_id => :p_partner_id,
                                   p_statusz    => :p_statusz);
  COMMIT;
END;
2
p_partner_id
1
5
4
p_statusz
1
Megrendelt
5
0
