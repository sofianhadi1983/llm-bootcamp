from openai import OpenAI
import yaml
import os

yaml_file_path = 'env.yaml'

if not os.path.exists(yaml_file_path):
    print(f"Error: File '{yaml_file_path}' does not exist. Please check the file path.")
else:
    with open(yaml_file_path, 'r') as file:
        try:
            config = yaml.safe_load(file)  
        except yaml.YAMLError as e:
            print(f"Error loading YAML file: {e}")


client = OpenAI(
  api_key=config['OPENAI_KEY']
)

completion = client.chat.completions.create(
  model="gpt-4o-mini",
  store=True,
  messages=[
    {"role": "user", "content": "bisa jelaskan mengenai karakter Leo"}
  ]
)

print(completion.choices[0].message);
