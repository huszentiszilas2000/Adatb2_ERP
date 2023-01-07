PL/SQL Developer Test script 3.0
6
begin
  -- Call the procedure
  salesinvoice_pkg.salesinvoice_update(p_id => :p_id,
                                       p_statusz => :p_statusz);
                                       COMMIT;
end;
2
p_id
1
17
4
p_statusz
1
adda
5
0
