CREATE OR REPLACE PACKAGE stock_pkg IS

  FUNCTION stock_select(id NUMBER) RETURN ty_stock;

  PROCEDURE stock_insert(p_cikk_id   NUMBER
                        ,p_mennyiseg NUMBER);

  PROCEDURE stock_delete(id NUMBER);

  PROCEDURE stock_update(p_id        NUMBER
                        ,p_cikk_id   NUMBER
                        ,p_mennyiseg NUMBER);

END stock_pkg;
/
CREATE OR REPLACE PACKAGE BODY stock_pkg IS

  FUNCTION stock_select(id NUMBER) RETURN ty_stock IS
    ret ty_stock;
  BEGIN
    ret := ty_stock();
    SELECT st.db_id
          ,st.cikk_id
          ,st.mennyiseg
      INTO ret.db_id
          ,ret.cikk_id
          ,ret.mennyiseg
      FROM stocktab st
     WHERE st.db_id = id;
    RETURN(ret);
  END stock_select;

  PROCEDURE stock_insert(p_cikk_id   NUMBER
                        ,p_mennyiseg NUMBER) IS
    stock_sor stocktab%ROWTYPE;
  BEGIN
  
    SELECT * INTO stock_sor FROM stocktab st WHERE st.cikk_id = p_cikk_id;
    IF stock_sor.db_id IS NOT NULL
    THEN
      raise_application_error(pkg_exception.gc_already_stock_exc_code,
                              'Van már ilyen cikknek készlete!');
    END IF;
    INSERT INTO stocktab
      (cikk_id
      ,mennyiseg)
    VALUES
      (p_cikk_id
      ,p_mennyiseg);
  END stock_insert;

  PROCEDURE stock_delete(id NUMBER) IS
  BEGIN
    DELETE FROM stocktab st WHERE st.db_id = id;
  END stock_delete;

  PROCEDURE stock_update(p_id        NUMBER
                        ,p_cikk_id   NUMBER
                        ,p_mennyiseg NUMBER) IS
    v_stock   stocktab%ROWTYPE;
    cikk_szam NUMBER;
  BEGIN
    BEGIN
      SELECT * INTO v_stock FROM stocktab st WHERE st.db_id = p_id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_stock_exc_code,
                                'Nincs ilyen azonosítójú készlet!');
    END;
  
    BEGIN
      SELECT st.cikk_id
        INTO cikk_szam
        FROM stocktab st
       WHERE st.db_id = p_cikk_id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_material_exc_code,
                                'Nincs ilyen azonosítójú cikk!');
    END;
  
    IF cikk_szam IS NOT NULL
    THEN
      raise_application_error(pkg_exception.gc_already_stock_exc_code,
                              'Van már ilyen cikknek készlete!');
    END IF;
    
    IF p_cikk_id IS NOT NULL
    THEN
      v_stock.cikk_id := p_cikk_id;
    END IF;
  
    IF p_mennyiseg IS NOT NULL
    THEN
      v_stock.mennyiseg := p_mennyiseg;
    END IF;
  
    UPDATE stocktab st
       SET st.cikk_id   = v_stock.cikk_id
          ,st.mennyiseg = v_stock.mennyiseg
     WHERE st.db_id = v_stock.db_id;
  END stock_update;

END stock_pkg;
/
