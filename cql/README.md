#Neo4j schema scripts
Uses Neo4j community version 2.3.x. Find it [here](http://neo4j.com/download/other-releases/)
## Usage
Install Neo4j on your machine. Launch Neo4j, one way is to use console mode typing `neo4j console` into terminal.<br/>
Set your data import folder's path as value of dbms.security.load_csv_file_url_root property in neo4j.properties file.<br/>
Copy thai_procurement_data.csv to your neo4j data import folder.

To run statements either
* point browser to `localhost:7474` or
* use SQL Workbench/J with Neo4j [JDBC driver](http://mvnrepository.com/artifact/org.neo4j/neo4j/2.3.4)

To style visualization upload graphstyle.grass to Neo4j, one way is to drag and drop the file to web interface.

