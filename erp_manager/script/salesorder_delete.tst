PL/SQL Developer Test script 3.0
4
begin
  salesorder_pkg.salesorder_delete(id => :id);
  COMMIT;
end;
1
id
1
15
4
0
