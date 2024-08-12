# FeedCo React

FeedCo React is a demo application showcasing a Rails API backend with a React frontend. This project uses PostgreSQL as its database, with the frontend built using Yarn and placed in a top-level folder called `frontend`.

## Table of Contents
- [Installation](#installation)
- [Database Configuration](#database-configuration)
- [Running the App](#running-the-app)
- [Seeding the Database](#seeding-the-database)
- [Testing](#testing)
- [Deployment](#deployment)
- [License](#license)

## Installation

### Clone the Repository

```bash
git clone https://github.com/yourusername/feedco-react.git
cd feedco-react
```

### Backend Setup

1. **Install Gems**  
   Ensure you have Bundler installed:

   ```bash
   gem install bundler
   ```

   Install the necessary gems:

   ```bash
   bundle install
   ```

2. **Database Setup**  
   Create and migrate the database:

   ```bash
   rails db:create
   rails db:migrate
   ```

### Frontend Setup

Navigate to the `frontend` folder and install dependencies:

```bash
cd frontend
yarn install
```

## Database Configuration

The database is configured using PostgreSQL. 
Ensure to set up the necessary environment variables for your database credentials.

## Running the App

### Backend

Start the Rails server:

```bash
rails server
```

The Rails API will run on `http://localhost:3000`.

### Frontend

Navigate to the `frontend` directory and start the React development server:

```bash
cd frontend
yarn start
```

The React app will run on `http://localhost:3001`.

### Proxy Setup

In `frontend/package.json`, ensure the `proxy` is set to your Rails backend:

```json
"proxy": "http://localhost:3000"
```

This will proxy requests from the React app to the Rails API.

## Seeding the Database

An extensive seed file is included to populate your database with sample data. To seed the database, run:

```bash
rails db:seed
```

This will create the necessary records in your database to get started.

## Testing

To run the test suite, use the following command:

```bash
rails test
```

Ensure your test database is up-to-date with the latest migrations:

```bash
rails db:test:prepare
```

## Deployment

For deployment, ensure all environment variables are set, including your production database credentials. You can deploy the frontend and backend separately, with the backend deployed to a platform like Heroku and the frontend to a service like Netlify or Vercel.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
