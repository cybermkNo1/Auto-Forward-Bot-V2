# ✅ Latest and stable Python image (buster से bullseye में upgrade किया)
FROM python:3.10-slim-bullseye

# ✅ Avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# ✅ Update and install necessary dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# ✅ Set the working directory
WORKDIR /app

# ✅ Copy requirements.txt if available
COPY requirements.txt .

# ✅ Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# ✅ Copy all files to container
COPY . .

# ✅ Command to run your bot
CMD ["python", "bot.py"]
