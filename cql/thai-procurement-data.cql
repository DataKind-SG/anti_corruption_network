-- If using SQL Workbench/J, set escapeprocessing to false to enable running multiple statements in one go
WbSetConfig workbench.db.[neo4j].ddl.disable.escapeprocessing=false;

------------------------------------------------------------------------------------------
-- Load project nodes
-- Added 217667 labels, created 217667 nodes, set 3047338 properties, statement executed in 31104 ms.
LOAD CSV WITH HEADERS FROM "file:///thai_procurement_data.csv" AS row
CREATE (p:Project)
SET p = row
;
-- View some project nodes
MATCH (p:Project) RETURN p LIMIT 20;


-- Create departments
-- Added 11043 labels, created 11043 nodes, set 11043 properties, statement executed in 2119 ms.
MATCH (p:Project)
WITH DISTINCT p.procuring_department as procuring_department
CREATE (d:Department)
SET d.department_name = procuring_department
;

-- Create relationships between projects and departments
-- Avoid Cartesian product by using WITH and MATCH on an indexed property
CREATE INDEX ON :Department(department_name);
-- Created 217667 relationships, statement executed in 8603 ms.
MATCH (p:Project)
WITH p
MATCH (d:Department)
WHERE p.procuring_department = d.department_name
CREATE (d)-[:DEPARTMENT_OF]->(p)
;

-- Remove procuring_department label from projects
-- Set 217667 properties, statement executed in 7823 ms.
MATCH (p:Project)
REMOVE p.procuring_department
;


-- Create companies based on tax ID no.
-- Added 65278 labels, created 65278 nodes, set 65278 properties, statement executed in 2654 ms.
MATCH (p:Project)
WITH DISTINCT p.tax_id_number as tax_id_number
CREATE (c:Company)
SET c.tax_id_number = tax_id_number
;

-- Create relationships between companies and projects
CREATE INDEX ON :Company(tax_id_number);
-- Created 217667 relationships, statement executed in 9484 ms.
MATCH (p:Project)
WITH p
MATCH (c:Company)
WHERE p.tax_id_number = c.tax_id_number
CREATE (c)-[:WINNER_OF {contract_number: p.contract_number, contract_sign_date: p.contract_sign_date, contract_status: p.contract_status, agreed_price_or_wages: toFloat(p.agreed_price_or_wages)}]->(p)
;



-- View some companies and projects
MATCH (c)-[wo:WINNER_OF]->(p) RETURN c, wo, p LIMIT 20;
-- List top 20 companies based on number of bids won: this is too many companies to visualize
MATCH (c)-[wo:WINNER_OF]->() 
WITH c, COUNT(wo) as cnt_wo
ORDER BY cnt_wo DESC
LIMIT 20
RETURN c, cnt_wo;
-- List top 20 companies with highest total value won
MATCH (c)-[wo:WINNER_OF]->() 
WITH c, COUNT(wo) as cnt_wo, SUM(wo.agreed_price_or_wages) as sum_wages
ORDER BY sum_wages DESC
LIMIT 20 
RETURN c, cnt_wo, sum_wages;
-- View top companies with highest total value excluding companies with too high edge count (for visualization)
MATCH (c)-[wo:WINNER_OF]->() 
WITH c, COUNT(wo) as cnt_wo, SUM(wo.agreed_price_or_wages) as sum_wages
ORDER BY sum_wages DESC
LIMIT 20
WHERE cnt_wo <= 100
MATCH (c)-[wo:WINNER_OF]->(p) 
RETURN c, wo, p;


-- Some tax ID numbers may have multiple company names (bid_winner). Collect those as a list property of companies.
-- Set 130556 properties, statement executed in 3828 ms.
MATCH (c)-[wo:WINNER_OF]->(p)
WITH c, COLLECT(DISTINCT(p.bid_winner)) as company_names
SET c.company_names = company_names, c.n_company_names = SIZE(company_names)
;

-- View some companies with multiple names
MATCH (c)-[wo:WINNER_OF]->(p)
WHERE c.n_company_names > 1
RETURN c, wo, p
LIMIT 20
;

-- Remove properties bid_winner and company_name from project nodes
-- Set 435317 properties, statement executed in 8851 ms.
MATCH (p:Project)
REMOVE p.tax_id_number, p.bid_winner
;







