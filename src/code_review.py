import requests
import os

OPENAI_KEY = os.getenv("OPENAI_KEY")
OPENAI_URL = os.getenv("OPENAI_URL")

CHAT_URL = f"{OPENAI_URL}/chat"

headers = {
    "Authorization" : f"Bearer {OPENAI_KEY}",
    "Content-Type": "application/json"
}

body = {
    "model" : "saia:agent:716241b4-6c1c-49a4-8482-b353963108cd",
    "messages" : [{
        "role" : "user",
        "content" : "Hi, what can you do?"
    }]
}

chat_request = requests.post(CHAT_URL, headers=headers, json=body)
response = chat_request.json()
print(response.get("choices")[0].get("message").get("content"))