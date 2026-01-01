#!/bin/bash
apt update -y
apt install -y python3 python3-pip

pip3 install flask

cat <<EOF > app.py
from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from Flask Backend"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
EOF

nohup python3 app.py &
