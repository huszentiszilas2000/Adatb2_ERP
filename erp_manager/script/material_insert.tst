PL/SQL Developer Test script 3.0
4
BEGIN
  material_pkg.material_insert(p_nev => :p_nev, p_ar => :p_ar);
  COMMIT;
END;
2
p_nev
1
Teszt
5
p_ar
1
-2000
4
0
