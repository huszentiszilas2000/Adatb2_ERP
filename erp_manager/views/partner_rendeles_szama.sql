CREATE OR REPLACE VIEW partner_rendeles_szama AS
SELECT pt.nev,
t.Rendeles_szama
FROM
(SELECT st.partner_id AS pt_id,
COUNT(st.partner_id) AS Rendeles_szama
FROM salesordertab st
GROUP BY st.partner_id) t 
INNER JOIN partnertab pt ON t.pt_id = pt.db_id;



