import mysql.connector
import pandas as pd

def connect_db():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="password",
        database="ESGDataWarehouse"
    )

def extract_data():
    df = pd.read_csv("esg_data.csv")
    return df

def transform_data(df):
    df.fillna(0, inplace=True)
    df["ESG_Rating"] = df["ESG_Rating"].astype(float)
    return df

def load_data(df, db):
    cursor = db.cursor()
    for _, row in df.iterrows():
        cursor.execute("""
            INSERT INTO Fact_Company_Metrics (CompanyID, IndustryID, RegionID, TimeID, ESG_Rating, Carbon_Emissions, 
                                             Energy_Consumption, Employee_Turnover, Diversity_Score, Governance_Score)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (row["CompanyID"], row["IndustryID"], row["RegionID"], row["TimeID"], row["ESG_Rating"],
              row["Carbon_Emissions"], row["Energy_Consumption"], row["Employee_Turnover"], 
              row["Diversity_Score"], row["Governance_Score"]))
    db.commit()

def etl_pipeline():
    db = connect_db()
    data = extract_data()
    transformed_data = transform_data(data)
    load_data(transformed_data, db)
    db.close()

if __name__ == "__main__":
    etl_pipeline()
