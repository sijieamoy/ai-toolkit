FROM python:3.10-slim

ARG HF_TOKEN

# Install git
RUN apt-get update && apt-get install -y git

# Clone the repository
RUN git clone https://github.com/ostris/ai-toolkit.git /app
WORKDIR /app

# Initialize and update submodules
RUN git submodule update --init --recursive

# Install PyTorch and other dependencies
RUN pip install torch
RUN pip install -r requirements.txt
RUN pip install --upgrade accelerate transformers diffusers huggingface_hub

# Set the working directory
WORKDIR /app
