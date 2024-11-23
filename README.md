Fake News Verifier - Docker Setup
A Ruby on Rails application to verify news content using OpenAI's GPT model. This project utilizes Docker for containerization, making it easy to run in any environment.

🚀 Quick Start with Docker
1. Clone the Repository
bash
Copy code
git clone https://github.com/yourusername/fake-news-verifier.git
cd fake-news-verifier
2. Create .env File
Create a .env file in the root directory and add your OpenAI API key:

bash
Copy code
OPENAI_API_KEY=your_openai_api_key_here
3. Build Docker Images
Build the Docker images using Docker Compose:

bash
Copy code
docker-compose build
4. Start the Application with Docker
Launch the application and its database with:

bash
Copy code
docker-compose up
This will start both the Rails app and PostgreSQL container.

5. Set Up the Database
Once the containers are running, set up the database:

bash
Copy code
docker-compose run web rake db:create
docker-compose run web rake db:migrate
6. Access the App
Visit the application at http://localhost:3000 in your browser.

