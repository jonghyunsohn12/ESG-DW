import mysql.connector

def connect_db():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="yourpassword",
        database="ESGDataWarehouse"
    )

def execute_query(query, params=None):
    db = connect_db()
    cursor = db.cursor()
    cursor.execute(query, params or ())
    result = cursor.fetchall()
    db.close()
    return result

if __name__ == "__main__":
    sample_query = "SELECT * FROM Dim_Company;"
    results = execute_query(sample_query)
    for row in results:
        print(row)
