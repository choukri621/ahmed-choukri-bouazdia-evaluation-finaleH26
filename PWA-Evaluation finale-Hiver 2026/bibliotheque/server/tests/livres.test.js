const request = require("supertest");
const app = require("../server");

describe("Tests API Bibliothèque", () => {

    test("GET /api/livres retourne 200 et un JSON", async () => {
        const res = await request(app).get("/api/livres");

        expect(res.statusCode).toBe(200);
        expect(Array.isArray(res.body)).toBe(true);
    });

    test("GET /api/livres/emprunts sans email retourne 400", async () => {
        const res = await request(app).get("/api/livres/emprunts");

        expect(res.statusCode).toBe(400);
        expect(res.body).toHaveProperty("message");
    });

});