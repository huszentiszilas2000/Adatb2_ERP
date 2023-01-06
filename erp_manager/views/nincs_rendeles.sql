CREATE OR REPLACE VIEW nincs_rendeles AS
SELECT pt.nev as Partner_nev
FROM partnertab pt 
WHERE pt.nev NOT IN 
(SELECT nev 
FROM partner_rendeles_szama 
WHERE rendeles_szama IS NOT NULL);

