import pandas as pd
import mysql.connector

# MySQL Connection Settings
try:
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="YOUR_PASSWORD_HERE", # ဒီနေရာမှာ ကိုယ့် password ပြင်ရုံပါပဲ
        database="inventory_mgmt_adv"
    )
    cursor = conn.cursor()

    # Sample Data to Upload
    data = {
        'name': ['Yangon Tech', 'Mandalay Electronics', 'Naypyidaw IT'],
        'contact_email': ['ygn@tech.com', 'mdy@elec.com', 'npd@it.com']
    }
    df = pd.DataFrame(data)

    # Insert Logic
    for index, row in df.iterrows():
        sql = "INSERT INTO suppliers (name, contact_email) VALUES (%s, %s)"
        cursor.execute(sql, (row['name'], row['contact_email']))

    conn.commit()
    print(f"Successfully loaded {len(df)} records.")

except Exception as e:
    print(f"Error: {e}")
finally:
    if 'conn' in locals() and conn.is_connected():
        cursor.close()
        conn.close()
