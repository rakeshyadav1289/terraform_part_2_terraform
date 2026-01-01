#!/bin/bash
apt update -y
apt install -y nodejs npm

npm install -g pm2

mkdir /app && cd /app
npm init -y
npm install express axios

cat <<EOF > index.js
const express = require("express");
const axios = require("axios");
const app = express();

app.get("/", async (req, res) => {
  const response = await axios.get("http://${flask_private_ip}:5000");
  res.send("Frontend → " + response.data);
});

app.listen(3000, "0.0.0.0", () => {
  console.log("Express running on port 3000");
});
EOF

pm2 start index.js
pm2 startup
