CREATE OR REPLACE PACKAGE salesinvoice_pkg IS

  FUNCTION salesinvoice_select(id NUMBER) RETURN ty_salesinvoice;

  PROCEDURE salesinvoice_insert(p_statusz VARCHAR2);

  PROCEDURE salesinvoice_delete(id NUMBER);

  PROCEDURE salesinvoice_update(p_id      NUMBER
                               ,p_statusz VARCHAR2);

END salesinvoice_pkg;
/
CREATE OR REPLACE PACKAGE BODY salesinvoice_pkg IS

  FUNCTION salesinvoice_select(id NUMBER) RETURN ty_salesinvoice IS
    ret      ty_salesinvoice;
    sii_list ty_salesinvoiceitem_list;
  BEGIN
    ret := ty_salesinvoice();
    SELECT si.db_id
          ,si.statusz
      INTO ret.db_id
          ,ret.statusz
      FROM salesinvoicetab si
     WHERE si.db_id = id;
    SELECT *
      BULK COLLECT
      INTO sii_list
      FROM (SELECT ty_salesinvoiceitem(db_id             => siit.db_id,
                                       salesinvoice_id   => siit.salesinvoice_id,
                                       salesorderitem_id => siit.salesorderitem_id,
                                       fizetett          => siit.fizetett)
              FROM salesinvoiceitemtab siit
             WHERE siit.salesinvoice_id = id);
  
    ret.salesinvoices := sii_list;
    RETURN(ret);
  END salesinvoice_select;

  PROCEDURE salesinvoice_insert(p_statusz VARCHAR2) IS
  BEGIN
    INSERT INTO salesinvoicetab (statusz) VALUES (p_statusz);
  END salesinvoice_insert;

  PROCEDURE salesinvoice_delete(id NUMBER) IS
  BEGIN
    DELETE FROM salesinvoiceitemtab sii WHERE sii.salesinvoice_id = id;
    DELETE FROM salesinvoicetab si WHERE si.db_id = id;
    COMMIT;
  END salesinvoice_delete;

  PROCEDURE salesinvoice_update(p_id      NUMBER
                               ,p_statusz VARCHAR2) IS
    v_salesinvoice salesinvoicetab%ROWTYPE;
  BEGIN
    BEGIN
      SELECT *
        INTO v_salesinvoice
        FROM salesinvoicetab si
       WHERE si.db_id = p_id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_salesinvoice_exc_code,
                                'Nincs ilyen azonosítojú számla!');
    END;
    IF p_statusz IS NOT NULL
    THEN
      v_salesinvoice.statusz := p_statusz;
    END IF;
  
    UPDATE salesinvoicetab si
       SET si.statusz = v_salesinvoice.statusz
     WHERE si.db_id = v_salesinvoice.db_id;
  END salesinvoice_update;

END salesinvoice_pkg;
/
