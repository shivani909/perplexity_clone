# Perplexity_clone

I built this project to understand how AI-powered search engines like Perplexity work behind the scenes.

The idea is simple:
You ask a question → the app searches the web → an LLM reads the results → then generates a real-time AI response streamed word by word, making the experience feel fast and interactive instead of waiting for a full page reload.

The project is built with:

Flutter — Cross-platform frontend for Android, iOS, and Web
FastAPI — Backend API and AI orchestration
WebSockets — Real-time streaming communication between client and server

This started as a learning project, but it turned into a solid foundation for building modern AI search applications.

# Features
AI-powered search experience
Real-time streamed responses
Web search integration
Cross-platform Flutter UI
Clean and responsive interface
WebSocket-based communication
Source references for generated answers

# How it works: 

# 1. User Enters a Query
<img width="2878" height="1559" alt="Image" src="https://github.com/user-attachments/assets/db41f026-dad5-442c-a6ab-b73b1099e079" />

# 2. Loading State Appears
<img width="2878" height="1543" alt="Image" src="https://github.com/user-attachments/assets/7d4ee927-e083-4a8f-9a14-43c01b260d6b" />

# 3. AI Generates the Response
<img width="2878" height="1562" alt="Image" src="https://github.com/user-attachments/assets/325793f3-de61-4521-9ff9-85e16833c091" />

# Running the Project:
# In Flutter
flutter pub get

flutter run

# Backend
cd server

python3 -m venv venv (To create venv folder)

venv\Scripts\activate (To activate venv folder)

pip install fastapi

fastapi dev server/main.py (To run FastApi)

