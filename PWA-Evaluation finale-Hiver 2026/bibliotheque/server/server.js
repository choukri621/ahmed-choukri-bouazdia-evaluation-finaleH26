require("dotenv").config();
const swaggerUi = require("swagger-ui-express");
const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());

const livresRoutes = require("./routes/livresRoutes");

app.use("/api/livres", livresRoutes);

if (require.main === module) {
    app.listen(process.env.PORT, () => {
        console.log(`Serveur lancé sur le port ${process.env.PORT}`);
    });
    const swaggerDocument = {
  openapi: "3.0.0",
  info: {
    title: "API Bibliothèque",
    version: "1.0.0",
    description: "Documentation de l'API de la bibliothèque numérique"
  },
  paths: {
    "/api/livres": {
      get: {
        summary: "Obtenir tous les livres",
        responses: {
          200: {
            description: "Liste des livres"
          }
        }
      }
    },
    "/api/livres/emprunts": {
      get: {
        summary: "Obtenir les emprunts",
        responses: {
          200: {
            description: "Liste des emprunts"
          }
        }
      }
    }
  }
};

app.use("/api-docs", swaggerUi.serve, swaggerUi.setup(swaggerDocument));
}

module.exports = app;