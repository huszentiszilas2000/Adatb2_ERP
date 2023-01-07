PL/SQL Developer Test script 3.0
6
BEGIN
  material_pkg.material_update(p_id  => :p_id,
                               p_nev => :p_nev,
                               p_ar  => :p_ar);
  COMMIT;
END;
3
p_id
1
1
4
p_nev
1
VALAMI
5
p_ar
1
4321
4
0
