## ETL Decisions

### Decision 1 — Date Standardization
Problem: The dataset contained multiple date formats such as 29/08/2023, 12-12-2023, and 2023-02-05.

Resolution: All dates were converted to ISO format (YYYY-MM-DD) before loading into the dim_date table.

### Decision 2 — Category Standardization
Problem: Product categories had inconsistent casing such as electronics, Electronics, and Groceries.

Resolution: Categories were standardized to three consistent values: Electronics, Grocery, and Clothing.

### Decision 3 — Handling NULL Store Cities
Problem: Some rows had NULL values in the store_city column.

Resolution: Missing cities were filled using known mappings between store names and their corresponding cities before loading the dim_store table.