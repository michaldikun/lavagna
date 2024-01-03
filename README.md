# Lavagna

Welcome to the Lavagna! This project is built using Docker Compose, utilizing a custom Dockerfile. It incorporates MySQL as the database and Nginx as the web server. To get started quickly, follow the instructions below.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Docker
- Docker Compose

## Getting Started

1. Clone the repository to your local machine:

   ```bash
   git clone [repository-url]
   ```

2. Navigate to the project directory:

   ```bash
   cd [project-directory]
   ```

3. Run the initialization script:

   ```bash
   ./init.sh
   ```

   This script will handle the Docker Compose build and run processes, setting up the necessary containers and configurations.

4. Access the application:

   Once the initialization process is complete, you can access the application through your web browser at [http://localhost](http://localhost). The MySQL database is also accessible through the default port.

## Custom Dockerfile

The project uses a custom Dockerfile to define the environment and dependencies required to run the application. 

## Docker Compose

Docker Compose is utilized to orchestrate the containers and simplify the deployment process. The configuration file, `docker-compose.yml`, is located in the project directory.

## Directory Structure

- `app`: Contains the application source code.
- `sql`: Contains MySQL database configurations and initialization scripts.
- `nginx`: Contains Nginx server configurations.

## Important Notes

- Make sure the necessary ports (e.g., 80 for Nginx) are not in use on your machine.
- Customize the MySQL configurations in the `docker-compose.yml` file as needed.



## Project Architecture

The architecture of this project follows a three-tier model, designed to efficiently handle user interactions, process business logic, and manage data. The components of the architecture are as follows:

- **User Interface:**
  Represents the point of interaction for the user.

- **Nginx (Web Server):**
  Serves as a reverse proxy, efficiently handling incoming requests from the user and directing them to the appropriate components of the application.

- **Application (App Server):**
  Contains the core business logic and acts as the intermediary between the user interface and the database. It processes incoming requests, performs necessary operations, and communicates with the database as needed.

- **Database:**
  Stores and manages the data necessary for the application.

### Communication Flow

The communication within the architecture follows a structured flow:

1. **User communicates with Nginx:**
   - Users interact with the application by making requests through the User Interface.

2. **Nginx forwards the request to the Application:**
   - Nginx, as a reverse proxy, forwards user requests to the Application layer.

3. **The Application processes the request and may communicate with the Database:**
   - The Application layer processes incoming requests, performs business logic operations, and may interact with the Database layer to fetch or update data.

4. **The Application sends the response back through Nginx to the User Interface:**
   - The Application layer generates a response based on the processed request, and Nginx delivers this response back to the User Interface for presentation to the user.

This structured flow ensures a clear separation of concerns and efficient communication between the various components, contributing to a robust and scalable architecture. Feel free to explore each layer for a deeper understanding of their functionalities and interactions.
 
![img](nginx.png)
