import requests
import os
import sys

OPENAI_KEY = os.getenv("OPENAI_KEY")
OPENAI_URL = os.getenv("OPENAI_URL")

CHAT_URL = f"{OPENAI_URL}/chat"

output_path = os.environ.get('GITHUB_OUTPUT')
if output_path is None:
    print("Error: GITHUB_OUTPUT environment variable is not set.", file=sys.stderr)
    sys.exit(1)

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

with open(output_path, 'a') as f:
    # 3. Write your outputs as key=value pairs, one per line
    f.write(f"message={response.get("choices")[0].get("message").get("content")}\n")
print("Script finished with no issues")