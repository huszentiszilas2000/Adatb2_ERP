CREATE OR REPLACE VIEW rend_kiegyenlitetlen_szamlak AS
SELECT t.sinv AS Szamla_Kodja
, pt.nev AS Partner
, mt.nev AS Cikk_Nev
, soi_out.mennyiseg || ' Db' AS Mennyiseg
, mt.ar || ' Ft' AS Darab_ar
, mt.ar * soi_out.mennyiseg || ' Ft' AS Vegosszeg
FROM
(SELECT sii.salesinvoice_id AS sinv
, sii.salesorderitem_id AS soi 
FROM salesinvoiceitemtab sii 
WHERE sii.fizetett = 'N' 
GROUP BY sii.salesinvoice_id, sii.salesorderitem_id 
ORDER BY sii.salesinvoice_id) t 
INNER JOIN salesorderitemtab soi_out ON soi_out.db_id = t.soi 
INNER JOIN materialtab mt ON mt.db_id = soi_out.material_id 
INNER JOIN salesordertab sot ON soi_out.salesorder_id = sot.db_id
INNER JOIN partnertab pt ON pt.db_id = sot.partner_id
ORDER BY Szamla_Kodja;
