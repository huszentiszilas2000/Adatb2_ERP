PL/SQL Developer Test script 3.0
14
DECLARE
  RESULT ty_partner;
BEGIN
  RESULT := partner_pkg.partner_select(id => :id);
  dbms_output.put_line('Partner neve: ' || result.nev);
  dbms_output.put_line('Partner c�me: ' || result.partner_cim);
  dbms_output.put_line('Partner banksz�mlasz�ma: ' ||
                       result.bankszamlaszam);
  dbms_output.put_line('Partner fizet�si m�dja: ' || result.fizetesi_mod);
EXCEPTION
  WHEN no_data_found THEN
    raise_application_error(pkg_exception.gc_no_partner_exc_code,
                            'Nincs ilyen azon�s�t�j� partner!');
END;
1
id
1
-1
4
0
