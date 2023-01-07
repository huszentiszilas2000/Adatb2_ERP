CREATE OR REPLACE PACKAGE partner_pkg IS

  FUNCTION partner_select(id NUMBER) RETURN ty_partner;

  PROCEDURE partner_insert(p_nev            VARCHAR2
                          ,p_partner_cim    VARCHAR2
                          ,p_bankszamlaszam VARCHAR2
                          ,p_fizetesi_mod   VARCHAR2);

  PROCEDURE partner_delete(id NUMBER);

  PROCEDURE partner_update(p_id             NUMBER
                          ,p_nev            VARCHAR2
                          ,p_partner_cim    VARCHAR2
                          ,p_bankszamlaszam VARCHAR2
                          ,p_fizetesi_mod   VARCHAR2);
END partner_pkg;
/
CREATE OR REPLACE PACKAGE BODY partner_pkg IS

  FUNCTION partner_select(id NUMBER) RETURN ty_partner IS
    ret ty_partner;
  BEGIN
    ret := ty_partner();
    SELECT pt.db_id
          ,pt.nev
          ,pt.partner_cim
          ,pt.bankszamlaszam
          ,pt.fizetesi_mod
      INTO ret.db_id
          ,ret.nev
          ,ret.partner_cim
          ,ret.bankszamlaszam
          ,ret.fizetesi_mod
      FROM partnertab pt
     WHERE pt.db_id = id;
    RETURN(ret);
  END partner_select;

  PROCEDURE partner_insert(p_nev            VARCHAR2
                          ,p_partner_cim    VARCHAR2
                          ,p_bankszamlaszam VARCHAR2
                          ,p_fizetesi_mod   VARCHAR2) IS
  BEGIN
    INSERT INTO partnertab
      (nev
      ,partner_cim
      ,bankszamlaszam
      ,fizetesi_mod)
    VALUES
      (p_nev
      ,p_partner_cim
      ,p_bankszamlaszam
      ,p_fizetesi_mod);
  END partner_insert;

  PROCEDURE partner_delete(id NUMBER) IS
  BEGIN
    DELETE FROM partnertab pt WHERE pt.db_id = id;
  END partner_delete;

  PROCEDURE partner_update(p_id             NUMBER
                          ,p_nev            VARCHAR2
                          ,p_partner_cim    VARCHAR2
                          ,p_bankszamlaszam VARCHAR2
                          ,p_fizetesi_mod   VARCHAR2) IS
    v_partner partnertab%ROWTYPE;
  BEGIN
    BEGIN
      SELECT * INTO v_partner FROM partnertab pt WHERE pt.db_id = p_id;
    EXCEPTION
      WHEN no_data_found THEN
        raise_application_error(pkg_exception.gc_no_partner_exc_code,
                                'Nincs ilyen azonosítojú partner!');
    END;
  
    IF p_nev IS NOT NULL
    THEN
      v_partner.nev := p_nev;
    END IF;
  
    IF p_partner_cim IS NOT NULL
    THEN
      v_partner.partner_cim := p_partner_cim;
    END IF;
  
    IF p_bankszamlaszam IS NOT NULL
    THEN
      v_partner.bankszamlaszam := p_bankszamlaszam;
    END IF;
  
    IF p_fizetesi_mod IS NOT NULL
    THEN
      v_partner.fizetesi_mod := p_fizetesi_mod;
    END IF;
  
    UPDATE partnertab pt
       SET pt.nev            = v_partner.nev
          ,pt.partner_cim    = v_partner.partner_cim
          ,pt.bankszamlaszam = v_partner.bankszamlaszam
          ,pt.fizetesi_mod   = v_partner.fizetesi_mod
     WHERE pt.db_id = v_partner.db_id;
  END partner_update;

END partner_pkg;
/
