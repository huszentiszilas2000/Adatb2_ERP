CREATE OR REPLACE VIEW gyartani_valo_keszlet AS
SELECT mt.nev, st.mennyiseg
FROM stocktab st 
INNER JOIN materialtab mt ON mt.db_id = st.cikk_id
WHERE st.mennyiseg < 1;
