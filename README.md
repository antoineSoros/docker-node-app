# Node-Postgres App

This project is a simple Node.js API that connects to a PostgreSQL database. It uses Docker to manage the application and its dependencies.

## Project Structure

```
node-postgres-app
├── src
│   └── index.js        # Entry point of the Node.js application
├── docker-compose.yml   # Defines services, networks, and volumes
├── Dockerfile           # Instructions to build the Docker image
├── package.json         # npm configuration file
└── README.md            # Project documentation
```

## Requirements

- Docker
- Docker Compose

## Setup Instructions

1. Clone the repository:

   ```
   git clone <repository-url>
   cd node-postgres-app
   ```

2. Build and start the application using Docker Compose:

   ```
   docker-compose up --build
   ```

3. The API will be available at `http://localhost:3000`.

## Usage

- The application connects to a PostgreSQL database. Ensure that the database is running and accessible.
- You can interact with the API using tools like Postman or curl.

## Stopping the Application

To stop the application, run:

```
docker-compose down
```

This command will stop and remove the containers, but the PostgreSQL data will persist due to the configured volume.

## License

This project is licensed under the MIT License.