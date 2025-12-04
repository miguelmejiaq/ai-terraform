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

response = requests.post(CHAT_URL, headers=headers, json=body)

print(response.json())