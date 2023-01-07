PL/SQL Developer Test script 3.0
4
begin
  salesorderitem_pkg.salesorderitem_delete(id => :id);
  COMMIT;
end;
1
id
1
5
4
0
