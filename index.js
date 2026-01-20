const { Pool } = require("pg");
const express = require("express");
const app = express();
const port = 8080;

const pool = new Pool({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  database: process.env.DB_NAME,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  max: 10,
  idleTimeoutMillis: 30000,
  connectionTimeoutMillis: 2000,
});

app.get("/", async (req, res) => {
  try {
    const dbRes = await pool.query("SELECT NOW()"); // שאילתה לבדיקת זמן
    res.send(`
      <h1>Connected to RDS Successfully!</h1>
      <p>Server time from PostgreSQL: ${dbRes.rows[0].now}</p>
      <p>Region: us-east-1</p>
    `);
  } catch (err) {
    res.send(`<h1>Connection Failed!</h1><p>Error: ${err.message}</p>`);
  }
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});
