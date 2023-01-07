PL/SQL Developer Test script 3.0
4
begin
  salesinvoice_pkg.salesinvoice_insert(p_statusz => :p_statusz);
  COMMIT;
end;
1
p_statusz
1
Megrendelt
5
0
