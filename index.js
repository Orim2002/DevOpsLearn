const { Client } = require("pg");
const express = require("express");
const app = express();
const port = 80;

const client = new Client({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  database: process.env.DB_NAME,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
});

app.get("/", async (req, res) => {
  try {
    await client.connect();
    const dbRes = await client.query("SELECT NOW()"); // שאילתה לבדיקת זמן
    res.send(
      `<h1>Connected to RDS Successfully!</h1><p>Server time: ${dbRes.rows[0].now}</p>`,
    );
    await client.end();
  } catch (err) {
    res.send(`<h1>Connection Failed!</h1><p>Error: ${err.message}</p>`);
  }
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});
