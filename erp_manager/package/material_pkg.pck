CREATE OR REPLACE PACKAGE material_pkg IS

  FUNCTION material_select(id NUMBER) RETURN ty_material;

  PROCEDURE material_insert(p_nev VARCHAR2
                           ,p_ar  NUMBER);

  PROCEDURE material_delete(id NUMBER);

  PROCEDURE material_update(p_id  NUMBER
                           ,p_nev VARCHAR2
                           ,p_ar  NUMBER);
END material_pkg;
/
CREATE OR REPLACE PACKAGE BODY material_pkg IS

  FUNCTION material_select(id NUMBER) RETURN ty_material IS
    ret ty_material;
  BEGIN
    ret := ty_material();
    BEGIN
      SELECT mt.db_id
            ,mt.nev
            ,mt.ar
        INTO ret.db_id
            ,ret.nev
            ,ret.ar
        FROM materialtab mt
       WHERE mt.db_id = id;
      RETURN(ret);
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_material_exc_code,
                                'Nincs ilyen azonósítójú cikk!');
    END;
  END material_select;

  PROCEDURE material_insert(p_nev VARCHAR2
                           ,p_ar  NUMBER) IS
  BEGIN
    IF p_ar < 0
    THEN
      raise_application_error(pkg_exception.gc_negative_exc_code,
                              'Nem lehet negatív szám az ár!');
    END IF;
    INSERT INTO materialtab
      (nev
      ,ar)
    VALUES
      (p_nev
      ,p_ar);
  END material_insert;

  PROCEDURE material_delete(id NUMBER) IS
  BEGIN
    DELETE FROM materialtab mt WHERE mt.db_id = id;
  END material_delete;

  PROCEDURE material_update(p_id  NUMBER
                           ,p_nev VARCHAR2
                           ,p_ar  NUMBER) IS
    v_material materialtab%ROWTYPE;
  BEGIN
    BEGIN
      SELECT * INTO v_material FROM materialtab mt WHERE mt.db_id = p_id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_material_exc_code,
                                'Nincs ilyen azonosítojú cikk!');
    END;
  
    IF p_nev IS NOT NULL
    THEN
      v_material.nev := p_nev;
    END IF;
  
    IF p_ar IS NOT NULL
    THEN
      v_material.ar := p_ar;
    END IF;
  
    UPDATE materialtab mt
       SET mt.nev = v_material.nev
          ,mt.ar  = v_material.ar
     WHERE mt.db_id = v_material.db_id;
  END material_update;
END material_pkg;
/
