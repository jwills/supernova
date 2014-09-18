Supernova Schema Starter Kit
----------------------------

This is an example of how to get started working with
supernova schemas, which you can think of as a star schema
where some of the fact tables have been denormalized into
arrays of structs inside of a root dimension. We'll take
you through how to build a supernova schema in Hive, perform
Exhibit-style SQL-within-SQL data analysis on the supernova,
export your supernova schema into MongoDB or HBase, and then
perform the same Exhibit queries you ran against the data
in Hive against the data in the operational stores. If I
get ambitious (and let's hope that I do), this will eventually
contain an end-to-end example of building a predictive model
in Hive and then deploying the model (and the associated feature
extraction SQL!) into MongoDB or HBase for real-time scoring.
