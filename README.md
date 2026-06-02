# Perplexity_clone

I built this because I wanted to understand how AI search engines like 
Perplexity actually work under the hood.

You type a question. It searches the web. An LLM reads those results 
and writes you an answer — streamed back word by word so it never 
feels like you're just waiting for a page to load.

Flutter handles the UI (works on Android, iOS and Web), FastAPI runs 
the backend, and WebSockets keep everything connected in real time. 
It's a fun project and a pretty solid starting point if you want to 
build something similar.

How it works: 

User Enters a Query
<img width="2878" height="1559" alt="Image" src="https://github.com/user-attachments/assets/db41f026-dad5-442c-a6ab-b73b1099e079" />
Loading State Appears
<img width="2878" height="1543" alt="Image" src="https://github.com/user-attachments/assets/7d4ee927-e083-4a8f-9a14-43c01b260d6b" />
AI Generates the Response
<img width="2878" height="1562" alt="Image" src="https://github.com/user-attachments/assets/325793f3-de61-4521-9ff9-85e16833c091" />


