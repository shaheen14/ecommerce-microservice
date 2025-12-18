from flask import Flask, jsonify
import os
import psycopg2


from flask import Flask, jsonify
import psycopg2
import os

app = Flask(__name__)

def get_db_connection():
    return psycopg2.connect(
        host=os.getenv("DB_HOST"),
        database=os.getenv("DB_NAME"),
        user=os.getenv("DB_USER"),
        password=os.getenv("DB_PASSWORD")
    )

@app.route("/sales")
def sales():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT product_name, amount, currency FROM sales;")
    rows = cur.fetchall()
    cur.close()
    conn.close()

    data = [
        {"product": r[0], "amount": r[1], "currency": r[2]}
        for r in rows
    ]
    return jsonify(data)

if __name__ == "__main__":
    PORT = int(os.getenv("APP_PORT", 8000))
    app.run(host="0.0.0.0", port=PORT)
#new comment for github action pipeline
