-- Create a supernova schema from the searches and clicks tables, stored
-- using MongoDB's BSON format for easy export.

create table supernova                                                                     
ROW FORMAT SERDE 'com.mongodb.hadoop.hive.BSONSerDe'                                       
STORED AS INPUTFORMAT 'com.mongodb.hadoop.mapred.BSONFileInputFormat'                      
OUTPUTFORMAT 'com.mongodb.hadoop.hive.output.HiveBSONFileOutputFormat'                     
AS SELECT a.id, a.searches, b.clicks
FROM (
  SELECT id,
  collect(named_struct('eid', event_id, 'query', query, 'tstamp', tstamp)) as searches
  FROM searches
  GROUP BY id
) a
INNER JOIN (
  SELECT id,
  collect(named_struct('eid', event_id, 'search_eid', search_event_id)) as clicks
  FROM clicks
  GROUP BY id
) b ON a.id = b.id;
