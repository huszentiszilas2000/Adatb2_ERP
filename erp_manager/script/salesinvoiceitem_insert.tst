PL/SQL Developer Test script 3.0
6
begin
  salesinvoiceitem_pkg.salesinvoiceitem_insert(p_salesinvoice_id => :p_salesinvoice_id,
                                               p_salesorderitem_id => :p_salesorderitem_id,
                                               p_fizetett => :p_fizetett);
                                               COMMIT;
end;
3
p_salesinvoice_id
1
12
4
p_salesorderitem_id
1
40
4
p_fizetett
1
N
5
0
