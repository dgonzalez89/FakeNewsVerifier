# Fake News Verifier - Docker Setup

This is a Ruby on Rails application to verify news content using OpenAI's GPT model. This project utilizes Docker for containerization making it easy to run in any environment.

## 🚀 Quick Start with Docker

### Clone the Repository 

- ```git clone https://github.com/yourusername/fake-news-verifier.git cd fake-news-verifier```
- Create file .env file in the root directory and add your OpenAI API key: `OPENAI_API_KEY=your_openai_api_key_here` 
- Start the Application with Docker Launch the application with: ```docker compose up --build```

## Prompt mechanism 
Try different types of news content (e.g., political, scientific, health-related) and check how the results vary. Based on the model’s performance, you may want to adjust the templates and improve the prompts further.

![Example Image](./new.png)