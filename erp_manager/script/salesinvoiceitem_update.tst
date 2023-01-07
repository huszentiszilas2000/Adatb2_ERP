PL/SQL Developer Test script 3.0
7
BEGIN
  salesinvoiceitem_pkg.salesinvoiceitem_update(p_id                => :p_id,
                                               p_salesinvoice_id   => :p_salesinvoice_id,
                                               p_salesorderitem_id => :p_salesorderitem_id,
                                               p_fizetett          => :p_fizetett);
  COMMIT;
END;
4
p_id
1
8
4
p_salesinvoice_id
1
12
4
p_salesorderitem_id
1
312
4
p_fizetett
1
N
5
0
