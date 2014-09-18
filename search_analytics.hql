-- Runs a spell correction analysis on the given supernova schema.

SELECT a.qw, a.qr, count(*) as cnt
FROM supernova
LATERAL VIEW WITHIN(
  "SELECT bad.query as qw, good.query as qr
  FROM t1 as bad, t1 as good
  WHERE bad.tstamp < good.tstamp
  AND good.tstamp - bad.tstamp < 30
  AND bad.eid NOT IN (select search_eid FROM t2)
  AND good.eid IN (select search_eid FROM t2)",
searches, clicks) a
GROUP BY a.qw, a.qr;
