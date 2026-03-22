6.2 — Design Justification (400–500 words)


##Storage Systems

The system uses multiple specialized storage solutions optimized for different workloads. For transactional hospital operations such as patient records, billing, and treatment history, a relational OLTP database like PostgreSQL is used. This ensures strong consistency, structured schema, and fast updates.

For real-time ICU monitoring data, a time-series database such as InfluxDB is selected. ICU devices generate high-frequency streaming data (heart rate, oxygen levels), and time-series databases are optimized for efficient ingestion, compression, and querying of such sequential data.

For analytics and reporting, a cloud-based data warehouse like Snowflake or BigQuery is used. This system stores historical and aggregated data from all sources, enabling complex queries for monthly reports such as bed occupancy and departmental costs.

To support natural language queries from doctors, a vector database (e.g., Pinecone or FAISS) is integrated with an LLM-based NLP layer. Patient records are embedded into vectors, allowing semantic search when doctors ask questions in plain English.

##OLTP vs OLAP Boundary

The OLTP system includes the PostgreSQL database handling real-time transactional data such as patient updates, admissions, and billing. This layer prioritizes low latency and high consistency.

The OLAP system begins when data is extracted from OLTP and streamed or batch-loaded into the data warehouse. ETL pipelines transform and aggregate this data for analytical use. The warehouse supports heavy queries without affecting transactional performance.

Thus, the boundary lies at the data ingestion/ETL layer, where operational data is separated and optimized for analytical workloads.

##Trade-offs

A key trade-off in this design is the complexity introduced by multiple storage systems. While each database is optimized for its specific use case, maintaining consistency and synchronization across OLTP, time-series, and warehouse systems can be challenging.

This is mitigated by implementing robust data pipelines using tools like Kafka and Spark, ensuring reliable data streaming and transformation. Additionally, data validation and monitoring systems can detect inconsistencies early.

Another mitigation strategy is adopting a unified data governance layer to manage schema consistency and access control across systems.