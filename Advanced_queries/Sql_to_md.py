import pandas as pd
import pyodbc

# Creating the SQL Server connection
server = 'your_server_name'
database = 'your_database_name'
conn = pyodbc.connect(f'DRIVER={{SQL Server}};SERVER={server};DATABASE={database};Trusted_Connection=yes;')
cursor = conn.cursor()

def sql_to_md(query):
    import pandas as pd
    cursor.execute(query)
    data = [list(row) for row in cursor.fetchall()]
    # Getting the column names
    columns = [column[0] for column in cursor.description]
    # Creating the DataFrame
    df = pd.DataFrame(data, columns=columns)
    # Printing the DataFrame as a markdown table 
    return print(df.to_markdown(index=False))

query = '''your query here'''
sql_to_md(query)