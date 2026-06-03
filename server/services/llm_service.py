from groq import Groq
from config import Settings

settings = Settings()

class LLMService:
    def __init__(self):
        self.client = Groq(api_key=settings.GROQ_API_KEY)

    def generate_response(self, query: str, search_results: list[dict]):
        context_text = "\n\n".join([
            f"Source {i+1} ({result['url']}):\n{result['content'][:500]}"
            for i, result in enumerate(search_results[:3])
        ])
        full_prompt = f"""
        Context from web search:
        {context_text}
        Query: {query}
        """
        stream = self.client.chat.completions.create(
            model="llama-3.3-70b-versatile",
            messages=[{"role": "user", "content": full_prompt}],
            stream=True
        )
        for chunk in stream:
            content = chunk.choices[0].delta.content
            if content:
                yield content