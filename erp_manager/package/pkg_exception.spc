CREATE OR REPLACE PACKAGE pkg_exception IS
 
  no_statusz_exc EXCEPTION;
  gc_no_statusz_exc_code CONSTANT NUMBER := -20001;
  PRAGMA EXCEPTION_INIT(no_statusz_exc, -20001);
  
  no_partner_exc EXCEPTION;
  gc_no_partner_exc_code CONSTANT NUMBER := -20100;
  PRAGMA EXCEPTION_INIT(no_partner_exc, -20100);
  
  no_partnerid_exc EXCEPTION;
  gc_no_partnerid_exc_code CONSTANT NUMBER := -20101;
  PRAGMA EXCEPTION_INIT(no_partnerid_exc, -20101);
  
  no_salesorder_exc EXCEPTION;
  gc_no_salesorder_exc_code CONSTANT NUMBER := -20200;
  PRAGMA EXCEPTION_INIT(no_salesorder_exc, -20200);
  
  no_salesorderitem_exc EXCEPTION;
  gc_no_salesorderitem_exc_code CONSTANT NUMBER := -20300;
  PRAGMA EXCEPTION_INIT(no_salesorderitem_exc, -20300);
  
  no_material_exc EXCEPTION;
  gc_no_material_exc_code CONSTANT NUMBER := -20400;
  PRAGMA EXCEPTION_INIT(no_material_exc, -20400);
  
  negative_exc EXCEPTION;
  gc_negative_exc_code CONSTANT NUMBER := -20401;
  PRAGMA EXCEPTION_INIT(negative_exc, -20401);
  
  no_stock_exc EXCEPTION;
  gc_no_stock_exc_code CONSTANT NUMBER := -20500;
  PRAGMA EXCEPTION_INIT(no_stock_exc, -20500);

  already_stock_exc EXCEPTION;
  gc_already_stock_exc_code CONSTANT NUMBER := -20501;
  PRAGMA EXCEPTION_INIT(already_stock_exc, -20501);
  
  no_salesinvoice_exc EXCEPTION;
  gc_no_salesinvoice_exc_code CONSTANT NUMBER := -20600;
  PRAGMA EXCEPTION_INIT(no_salesinvoice_exc, -20600);
  
  no_salesinvoiceitem_exc EXCEPTION;
  gc_no_siitem_exc_code CONSTANT NUMBER := -20700;
  PRAGMA EXCEPTION_INIT(no_salesinvoiceitem_exc, -20700);

END pkg_exception;
/
