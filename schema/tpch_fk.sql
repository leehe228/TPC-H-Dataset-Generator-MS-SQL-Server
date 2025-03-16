USE tpch;
GO

ALTER TABLE region ALTER COLUMN r_regionkey INT NOT NULL;
GO
ALTER TABLE region ADD PRIMARY KEY (r_regionkey);

ALTER TABLE nation ALTER COLUMN n_nationkey INT NOT NULL;
GO
ALTER TABLE nation ADD PRIMARY KEY (n_nationkey);

-- First: add the foreign key from nation to region
ALTER TABLE nation
ADD CONSTRAINT nation_fk1 FOREIGN KEY (n_regionkey) REFERENCES region(r_regionkey);

ALTER TABLE part ALTER COLUMN p_partkey INT NOT NULL;
GO
ALTER TABLE part ADD PRIMARY KEY (p_partkey);

ALTER TABLE supplier ALTER COLUMN s_suppkey INT NOT NULL;
GO
ALTER TABLE supplier ADD PRIMARY KEY (s_suppkey);

ALTER TABLE partsupp ALTER COLUMN ps_partkey INT NOT NULL;
ALTER TABLE partsupp ALTER COLUMN ps_suppkey INT NOT NULL;
GO
ALTER TABLE partsupp ADD PRIMARY KEY (ps_partkey, ps_suppkey);

ALTER TABLE customer ALTER COLUMN c_custkey INT NOT NULL;
GO
ALTER TABLE customer ADD PRIMARY KEY (c_custkey);

ALTER TABLE customer ADD CONSTRAINT customer_fk1
FOREIGN KEY (c_nationkey) REFERENCES nation(n_nationkey);

ALTER TABLE orders ALTER COLUMN o_orderkey INT NOT NULL;
GO
ALTER TABLE orders ADD PRIMARY KEY (o_orderkey);

ALTER TABLE lineitem ALTER COLUMN l_orderkey INT NOT NULL;
ALTER TABLE lineitem ALTER COLUMN l_linenumber INT NOT NULL;
GO
ALTER TABLE lineitem ADD PRIMARY KEY (l_orderkey, l_linenumber);

-- The second occurrence of "nation_fk1" has been removed to avoid duplication.

ALTER TABLE partsupp ADD CONSTRAINT partsupp_fk1
FOREIGN KEY (ps_suppkey) REFERENCES supplier(s_suppkey);

ALTER TABLE partsupp ADD CONSTRAINT partsupp_fk2
FOREIGN KEY (ps_partkey) REFERENCES part(p_partkey);

ALTER TABLE lineitem ADD CONSTRAINT lineitem_fk1
FOREIGN KEY (l_orderkey) REFERENCES orders(o_orderkey);

ALTER TABLE lineitem ADD CONSTRAINT lineitem_fk2
FOREIGN KEY (l_partkey, l_suppkey) REFERENCES partsupp(ps_partkey, ps_suppkey);
GO
