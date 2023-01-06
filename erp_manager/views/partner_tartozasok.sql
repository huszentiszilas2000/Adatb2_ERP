CREATE OR REPLACE VIEW partner_tartozasok AS
SELECT t.Partner
, SUM(TO_NUMBER(REPLACE(t.Vegosszeg, ' Ft', ''))) || ' Ft' as Tartozas
FROM rend_kiegyenlitetlen_szamlak t 
GROUP BY t.Partner
ORDER BY Tartozas DESC;
