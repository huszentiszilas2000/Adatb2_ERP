CREATE OR REPLACE VIEW keszlet_ertek AS
SELECT mt.nev,
t.mennyiseg || ' DB' AS Keszlet,
mt.ar || ' Ft' AS Ar,
t.mennyiseg * mt.ar || ' Ft' AS Keszlet_Ertek
FROM
(SELECT soi.salesorder_id AS so_id
, soi.material_id AS id
, SUM(soi.mennyiseg) AS mennyiseg
FROM salesorderitemtab soi 
GROUP BY soi.salesorder_id, soi.material_id 
ORDER BY soi.salesorder_id) t 
INNER JOIN materialtab mt ON t.id = mt.db_id;


