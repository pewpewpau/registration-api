import { RegistrationPayload } from "../../backend/src/types";

const BASE_URL = "http://localhost:3000";

export class RegistrationClient {
  async register(data: RegistrationPayload): Promise<any> {
    const res = await fetch(`${BASE_URL}/registrations`, {
      method:  "POST",
      headers: { "Content-Type": "application/json" },
      body:    JSON.stringify(data),
    });
    if (!res.ok) throw await res.json();
    return res.json();
  }

  async getAll(): Promise<any[]> {
    const res = await fetch(`${BASE_URL}/registrations`);
    if (!res.ok) throw await res.json();
    return res.json();
  }

  async getById(id: number): Promise<any> {
    const res = await fetch(`${BASE_URL}/registrations/${id}`);
    if (!res.ok) throw await res.json();
    return res.json();
  }
}