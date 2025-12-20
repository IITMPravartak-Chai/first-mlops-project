# # Dockerfile
# FROM python:3.10
# WORKDIR /app
# COPY . /app
# RUN pip install -r requirements.txt
# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]


FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY main.py .
COPY train.py .

# ❗ REQUIRED: copy model file
COPY diabetes_model.pkl .

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
