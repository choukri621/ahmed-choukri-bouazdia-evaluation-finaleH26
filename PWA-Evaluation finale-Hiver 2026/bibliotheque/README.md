# Bibliothèque numérique

Projet réalisé dans le cadre du cours Programmation Web avancée (420-VT3-AG).

## Technologies utilisées

### Backend
- Node.js
- Express
- MySQL
- Swagger

### Frontend
- React
- Axios
- React Router

## Installation

### Backend

```bash
cd server
npm install
npm start
```

### Frontend

```bash
cd client
npm install
npm run dev
```

## Variables d'environnement

Créer un fichier `.env` :

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=bibliotheque
PORT=5000
```

## API

### Livres

- GET /api/livres

### Emprunts

- GET /api/livres/emprunts?email=test@test.com

## Documentation Swagger

Disponible à :

https://bibliotheque-api-exo5.onrender.com/api-docs

## Déploiement

### Frontend

https://ahmed-choukri-bouazdia-evaluation-f.vercel.app

### Backend

https://bibliotheque-api-exo5.onrender.com

## Auteur

Ahmed Choukri Bouazdia