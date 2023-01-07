CREATE OR REPLACE PACKAGE salesorder_pkg IS

  FUNCTION salesorder_select(id NUMBER) RETURN ty_salesorder;
  PROCEDURE salesorder_insert(p_partner_id NUMBER
                             ,p_statusz    VARCHAR2);

  PROCEDURE salesorder_delete(id NUMBER);

  PROCEDURE salesorder_update(p_id         NUMBER
                             ,p_partner_id NUMBER
                             ,p_statusz    VARCHAR2);
END salesorder_pkg;
/
CREATE OR REPLACE PACKAGE BODY salesorder_pkg IS

  FUNCTION salesorder_select(id NUMBER) RETURN ty_salesorder IS
    ret      ty_salesorder;
    soi_list ty_salesorderitem_list;
  BEGIN
    ret := ty_salesorder();
    SELECT st.db_id
          ,st.partner_id
          ,st.statusz
      INTO ret.db_id
          ,ret.partner_id
          ,ret.statusz
      FROM salesordertab st
     WHERE st.db_id = id;
    SELECT *
      BULK COLLECT
      INTO soi_list
      FROM (SELECT ty_salesorderitem(db_id         => soit.db_id,
                                     salesorder_id => soit.salesorder_id,
                                     material_id   => soit.material_id,
                                     mennyiseg     => soit.mennyiseg)
              FROM salesorderitemtab soit
             WHERE soit.salesorder_id = id);
  
    ret.salesorderitems := soi_list;
    RETURN(ret);
  EXCEPTION
    WHEN no_data_found THEN
      raise_application_error(pkg_exception.gc_no_salesorder_exc_code,
                              'Nincs ilyen azonósítójú rendelés!');
  END salesorder_select;

  PROCEDURE salesorder_insert(p_partner_id NUMBER
                             ,p_statusz    VARCHAR2) IS
  BEGIN
    IF p_partner_id IS NULL
    THEN
      raise_application_error(pkg_exception.gc_no_partnerid_exc_code,
                              'Nincs partner id megadva!');
    END IF;
    IF p_statusz IS NULL
    THEN
      raise_application_error(pkg_exception.gc_no_statusz_exc_code,
                              'Nincs státusz megadva!');
    END IF;
    INSERT INTO salesordertab
      (partner_id
      ,statusz)
    VALUES
      (p_partner_id
      ,p_statusz);
  END salesorder_insert;

  PROCEDURE salesorder_delete(id NUMBER) IS
    szam_lista ty_number_list;
  BEGIN
    SELECT *
      BULK COLLECT
      INTO szam_lista
      FROM (SELECT sii_t.salesinvoice_id
              FROM salesinvoiceitemtab sii_t
             WHERE sii_t.salesorderitem_id IN
                   (SELECT soi_t.db_id
                      FROM salesorderitemtab soi_t
                     WHERE soi_t.salesorder_id = id));
  
    DELETE FROM salesinvoiceitemtab sii
     WHERE sii.salesorderitem_id IN
           (SELECT soi_t.db_id
              FROM salesorderitemtab soi_t
             WHERE soi_t.salesorder_id = id);
    IF szam_lista.count > 0
    THEN
      FOR i IN szam_lista.first .. szam_lista.last
      LOOP
        DELETE FROM salesinvoicetab si WHERE si.db_id = szam_lista(i);
      END LOOP;
    END IF;
  
    DELETE FROM salesorderitemtab soi WHERE soi.salesorder_id = id;
    DELETE FROM salesordertab so WHERE so.db_id = id;
    COMMIT;
  END salesorder_delete;

  PROCEDURE salesorder_update(p_id         NUMBER
                             ,p_partner_id NUMBER
                             ,p_statusz    VARCHAR2) IS
    v_salesorder salesordertab%ROWTYPE;
    v_partner    partnertab%ROWTYPE;
  BEGIN
    BEGIN
      SELECT *
        INTO v_salesorder
        FROM salesordertab so
       WHERE so.db_id = p_id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_salesorder_exc_code,
                                'Nincs ilyen rendelés!');
    END;
    BEGIN
      SELECT *
        INTO v_partner
        FROM partnertab pt
       WHERE pt.db_id = p_partner_id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_partner_exc_code,
                                'Nincs ilyen partner!');
    END;
  
    v_salesorder.partner_id := p_partner_id;
  
    IF p_statusz IS NOT NULL
    THEN
      v_salesorder.statusz := p_statusz;
    END IF;
  
    UPDATE salesordertab so
       SET so.partner_id = v_salesorder.partner_id
          ,so.statusz    = v_salesorder.statusz
     WHERE so.db_id = v_salesorder.db_id;
  END salesorder_update;

END salesorder_pkg;
/
