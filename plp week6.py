import os
import requests
from urllib.parse import urlparse
from pathlib import Path

def fetch_image():
    url = input("Enter the image URL: ").strip()
    if not url:
        print("No URL provided.")
        return

    dir_name = "Fetched_Images"
    os.makedirs(dir_name, exist_ok=True)

    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        content_type = response.headers.get('content-type', '')
        if 'image' not in content_type:
            print("The URL does not point to an image.")
            return

      
        parsed_url = urlparse(url)
        filename = os.path.basename(parsed_url.path)
        if not filename:
            filename = "downloaded_image"
       
        if '.' not in filename:
            ext = content_type.split('/')[-1]
            filename += f".{ext}"

        file_path = Path(dir_name) / filename

        with open(file_path, 'wb') as f:
            f.write(response.content)
        print(f"Image saved as {file_path}")

    except requests.exceptions.RequestException as e:
        print(f"Failed to fetch image: {e}")

if __name__ == "__main__":
    fetch_image()