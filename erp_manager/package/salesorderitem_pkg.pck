CREATE OR REPLACE PACKAGE salesorderitem_pkg IS

  FUNCTION salesorderitem_select(id NUMBER) RETURN ty_salesorderitem;

  PROCEDURE salesorderitem_insert(p_salesorder_id NUMBER
                                 ,p_material_id   NUMBER
                                 ,p_mennyiseg     NUMBER);

  PROCEDURE salesorderitem_delete(id NUMBER);

  PROCEDURE salesorderitem_update(p_id            NUMBER
                                 ,p_salesorder_id NUMBER
                                 ,p_material_id   NUMBER
                                 ,p_mennyiseg     NUMBER);

END salesorderitem_pkg;
/
CREATE OR REPLACE PACKAGE BODY salesorderitem_pkg IS

  FUNCTION salesorderitem_select(id NUMBER) RETURN ty_salesorderitem IS
    ret ty_salesorderitem;
  BEGIN
    ret := ty_salesorderitem();
    BEGIN
      SELECT soi.db_id
            ,soi.salesorder_id
            ,soi.material_id
            ,soi.mennyiseg
        INTO ret.db_id
            ,ret.salesorder_id
            ,ret.material_id
            ,ret.mennyiseg
        FROM salesorderitemtab soi
       WHERE soi.db_id = id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_salesorderitem_exc_code,
                                'Nincs ilyen azonosítójú rendelés tétel!');
    END;
    RETURN(ret);
  END salesorderitem_select;

  PROCEDURE salesorderitem_insert(p_salesorder_id NUMBER
                                 ,p_material_id   NUMBER
                                 ,p_mennyiseg     NUMBER) IS
    salesorder_szam NUMBER;
    material_szam   NUMBER;
  BEGIN
    BEGIN
      SELECT so.db_id
        INTO salesorder_szam
        FROM salesordertab so
       WHERE so.db_id = p_salesorder_id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_salesorder_exc_code,
                                'Nincs ilyen azonosítójú rendelés!');
    END;
    BEGIN
      SELECT mt.db_id
        INTO material_szam
        FROM materialtab mt
       WHERE mt.db_id = p_material_id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_material_exc_code,
                                'Nincs ilyen azonosítójú cikk!');
    END;
    IF p_mennyiseg < 0
    THEN
      raise_application_error(pkg_exception.gc_negative_exc_code,
                              'Nem lehet negatív a mennyiség!');
    END IF;
    INSERT INTO salesorderitemtab
      (salesorder_id
      ,material_id
      ,mennyiseg)
    VALUES
      (p_salesorder_id
      ,p_material_id
      ,p_mennyiseg);
  
    UPDATE stocktab st SET st.mennyiseg = st.mennyiseg - p_mennyiseg;
  END salesorderitem_insert;

  PROCEDURE salesorderitem_delete(id NUMBER) IS
  BEGIN
    DELETE FROM salesinvoiceitemtab sii WHERE sii.salesorderitem_id = id;
    DELETE FROM salesorderitemtab soi WHERE soi.db_id = id;
  END salesorderitem_delete;

  PROCEDURE salesorderitem_update(p_id            NUMBER
                                 ,p_salesorder_id NUMBER
                                 ,p_material_id   NUMBER
                                 ,p_mennyiseg     NUMBER) IS
    v_salesorderitem salesorderitemtab%ROWTYPE;
    salesorder_szam  NUMBER;
    material_szam    NUMBER;
  BEGIN
    BEGIN
      SELECT *
        INTO v_salesorderitem
        FROM salesorderitemtab soi
       WHERE soi.db_id = p_id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_salesorderitem_exc_code,
                                'Nincs ilyen azonosítójú rendelés tétel!');
    END;
  
    BEGIN
      SELECT so.db_id
        INTO salesorder_szam
        FROM salesordertab so
       WHERE so.db_id = p_salesorder_id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_salesorder_exc_code,
                                'Nincs ilyen azonosítójú rendelés!');
    END;
    BEGIN
      SELECT mt.db_id
        INTO material_szam
        FROM materialtab mt
       WHERE mt.db_id = p_material_id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_material_exc_code,
                                'Nincs ilyen azonosítójú cikk!');
    END;
  
    IF p_salesorder_id IS NOT NULL
    THEN
      v_salesorderitem.salesorder_id := p_salesorder_id;
    END IF;
  
    IF p_material_id IS NOT NULL
    THEN
      v_salesorderitem.material_id := p_material_id;
    END IF;
  
    IF p_mennyiseg IS NOT NULL
    THEN
      v_salesorderitem.mennyiseg := p_mennyiseg;
    END IF;
  
    UPDATE salesorderitemtab soi
       SET soi.salesorder_id = v_salesorderitem.salesorder_id
          ,soi.material_id   = v_salesorderitem.material_id
          ,soi.mennyiseg     = v_salesorderitem.mennyiseg
     WHERE soi.db_id = v_salesorderitem.db_id;
  END salesorderitem_update;

END salesorderitem_pkg;
/
