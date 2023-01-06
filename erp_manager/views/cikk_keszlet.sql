CREATE OR REPLACE VIEW cikk_keszlet AS
SELECT 
mt.nev,
mt.ar || ' Ft/Db' AS Ar,
st.mennyiseg || ' Db' as Mennyiseg
FROM 
materialtab mt 
INNER JOIN stocktab st ON st.cikk_id = mt.db_id;
