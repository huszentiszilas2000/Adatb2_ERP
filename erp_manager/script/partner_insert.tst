PL/SQL Developer Test script 3.0
8
begin
  -- Call the procedure
  partner_pkg.partner_insert(p_nev => :p_nev,
                             p_partner_cim => :p_partner_cim,
                             p_bankszamlaszam => :p_bankszamlaszam,
                             p_fizetesi_mod => :p_fizetesi_mod);
                             COMMIT;
end;
4
p_nev
1
TEszt:kft
5
p_partner_cim
1
dsds
5
p_bankszamlaszam
1
dsds
5
p_fizetesi_mod
1
dsds
5
0
