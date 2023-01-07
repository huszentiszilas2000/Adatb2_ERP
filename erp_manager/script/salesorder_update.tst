PL/SQL Developer Test script 3.0
6
begin
  salesorder_pkg.salesorder_update(p_id => :p_id,
                                   p_partner_id => :p_partner_id,
                                   p_statusz => :p_statusz);
                                   COMMIT;
end;
3
p_id
1
2
4
p_partner_id
1
5
4
p_statusz
0
5
0
