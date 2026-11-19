FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py Apex.ico ./
# Data (users, mapping, uploaded stock) lives in /data: mount a persistent volume there.
ENV HOST=0.0.0.0 PORT=8000 NO_BROWSER=1 DATA_DIR=/data
VOLUME /data
EXPOSE 8000
CMD ["python", "app.py"]
