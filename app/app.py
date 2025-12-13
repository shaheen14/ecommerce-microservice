from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route("/sales", methods=["GET"])
def sales():
    return jsonify([
        {"order_id": 1, "product": "Laptop", "amount": 65000},
        {"order_id": 2, "product": "Phone", "amount": 25000},
        {"order_id": 3, "product": "Headphones", "amount": 3000}
    ])

if __name__ == "__main__":
    PORT = int(os.getenv("APP_PORT", 8000))
    app.run(host="0.0.0.0", port=PORT)


