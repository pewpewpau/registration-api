import { Router, Request, Response } from "express";
import { pool } from "../db";
import { RegistrationPayload } from "../types";

const router = Router();

// POST /registrations — Create a new registration
router.post("/", async (req: Request, res: Response) => {
  const p: RegistrationPayload = req.body;

  // Basic validation
  if (!p.first_name || !p.last_name || !p.email) {
    return res.status(400).json({ error: "first_name, last_name, and email are required." });
  }

  try {
    const { rows } = await pool.query(
      `INSERT INTO registrations
        (first_name, last_name, email, phone, date_of_birth,
         res_street, res_city, res_state, res_postal, res_country,
         post_street, post_city, post_state, post_postal, post_country)
       VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15)
       RETURNING *`,
      [
        p.first_name, p.last_name, p.email, p.phone ?? null, p.date_of_birth ?? null,
        p.res_street ?? null, p.res_city ?? null, p.res_erf ?? null, p.res_country ?? null,
        p.postal_address ?? null, p.post_city ?? null, p.post_country ?? null,
      ]
    );
    res.status(201).json(rows[0]);
  } catch (err: any) {
    if (err.code === "23505") // unique violation
      return res.status(409).json({ error: "Email already registered." });
    console.error(err);
    res.status(500).json({ error: "Internal server error." });
  }
});

// GET /registrations — List all registrations
router.get("/", async (_req, res) => {
  const { rows } = await pool.query(
    "SELECT * FROM registrations ORDER BY created_at DESC"
  );
  res.json(rows);
});

// GET /registrations/:id — Get one
router.get("/:id", async (req, res) => {
  const { rows } = await pool.query(
    "SELECT * FROM registrations WHERE id = $1", [req.params.id]
  );
  if (!rows.length) return res.status(404).json({ error: "Not found." });
  res.json(rows[0]);
});

export default router;