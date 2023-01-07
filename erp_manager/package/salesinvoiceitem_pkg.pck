CREATE OR REPLACE PACKAGE salesinvoiceitem_pkg IS

  FUNCTION salesinvoiceitem_select(id NUMBER) RETURN ty_salesinvoiceitem;

  PROCEDURE salesinvoiceitem_insert(p_salesinvoice_id   NUMBER
                                   ,p_salesorderitem_id NUMBER
                                   ,p_fizetett          VARCHAR2);

  PROCEDURE salesinvoiceitem_delete(id NUMBER);

  PROCEDURE salesinvoiceitem_update(p_id                NUMBER
                                   ,p_salesinvoice_id   NUMBER
                                   ,p_salesorderitem_id NUMBER
                                   ,p_fizetett          VARCHAR2);

END salesinvoiceitem_pkg;
/
CREATE OR REPLACE PACKAGE BODY salesinvoiceitem_pkg IS

  FUNCTION salesinvoiceitem_select(id NUMBER) RETURN ty_salesinvoiceitem IS
    ret ty_salesinvoiceitem;
  BEGIN
    ret := ty_salesinvoiceitem();
    SELECT sii.db_id
          ,sii.salesinvoice_id
          ,sii.salesorderitem_id
          ,sii.fizetett
      INTO ret.db_id
          ,ret.salesinvoice_id
          ,ret.salesorderitem_id
          ,ret.fizetett
      FROM salesinvoiceitemtab sii
     WHERE sii.db_id = id;
    RETURN(ret);
  END salesinvoiceitem_select;

  PROCEDURE salesinvoiceitem_insert(p_salesinvoice_id   NUMBER
                                   ,p_salesorderitem_id NUMBER
                                   ,p_fizetett          VARCHAR2) IS
    rendles_tetel_szam NUMBER;
    szamla_szam        NUMBER;
  BEGIN
    BEGIN
      SELECT sii.salesorderitem_id
        INTO rendles_tetel_szam
        FROM salesinvoiceitemtab sii
       WHERE sii.salesorderitem_id = p_salesorderitem_id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_salesorderitem_exc_code,
                                'Nincs ilyen azonosítojú rendelés tétel!');
    END;
  
    BEGIN
      SELECT sii.salesinvoice_id
        INTO szamla_szam
        FROM salesinvoiceitemtab sii
       WHERE sii.salesinvoice_id = p_salesinvoice_id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_salesinvoice_exc_code,
                                'Nincs ilyen azonosítojú számla!');
    END;
  
    INSERT INTO salesinvoiceitemtab
      (salesinvoice_id
      ,salesorderitem_id
      ,fizetett)
    VALUES
      (p_salesinvoice_id
      ,p_salesorderitem_id
      ,p_fizetett);
  END salesinvoiceitem_insert;

  PROCEDURE salesinvoiceitem_delete(id NUMBER) IS
  BEGIN
    DELETE FROM salesinvoiceitemtab sii WHERE sii.db_id = id;
  END salesinvoiceitem_delete;
  
  PROCEDURE salesinvoiceitem_update(p_id                NUMBER
                                   ,p_salesinvoice_id   NUMBER
                                   ,p_salesorderitem_id NUMBER
                                   ,p_fizetett          VARCHAR2) IS
    v_salesinvoiceitem salesinvoiceitemtab%ROWTYPE;
    rendeles_tetel_szam NUMBER;
  BEGIN
    BEGIN
      SELECT * INTO v_salesinvoiceitem FROM salesinvoiceitemtab sii WHERE sii.db_id = p_id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_siitem_exc_code,
                                'Nincs ilyen azonosítójú számla tétel!');
    END;
    
    BEGIN
      SELECT soi.db_id INTO rendeles_tetel_szam FROM salesorderitemtab soi WHERE soi.db_id = p_id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_salesorderitem_exc_code,
                                'Nincs ilyen azonosítójú rendelés tétel!');
    END;
  
    IF p_salesinvoice_id IS NOT NULL
    THEN
      v_salesinvoiceitem.salesinvoice_id := p_salesinvoice_id;
    END IF;
  
    IF p_salesorderitem_id IS NOT NULL
    THEN
      v_salesinvoiceitem.salesorderitem_id := p_salesorderitem_id;
    END IF;
  
    IF p_fizetett IS NOT NULL
    THEN
      v_salesinvoiceitem.fizetett := p_fizetett;
    END IF;
  

    UPDATE salesinvoiceitemtab sii
       SET sii.salesinvoice_id            = v_salesinvoiceitem.salesinvoice_id
          ,sii.salesorderitem_id    = v_salesinvoiceitem.salesorderitem_id
          ,sii.fizetett = v_salesinvoiceitem.fizetett
     WHERE sii.db_id = v_salesinvoiceitem.db_id;
  END salesinvoiceitem_update;

END salesinvoiceitem_pkg;
/
