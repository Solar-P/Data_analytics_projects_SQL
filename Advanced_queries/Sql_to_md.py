import pandas as pd
import pyodbc

# Creating the SQL Server connection
server = 'your_server_name'
database = 'your_database_name'
conn = pyodbc.connect(f'DRIVER={{SQL Server}};SERVER={server};DATABASE={database};Trusted_Connection=yes;')
cursor = conn.cursor()

# Executing the query
cursor.execute("""your_query_here
               """)

# Tranforming the query result into a list of lists
data = [list(row) for row in cursor.fetchall()]

# Getting the column names
columns = [column[0] for column in cursor.description]

# Creating the DataFrame
df = pd.DataFrame(data, columns=columns)

# Printing the DataFrame as a markdown table 
print(df.to_markdown(index=False))