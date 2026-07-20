# ======================================
# Dockerfile Semantic Preview
# Docker Container Definition
# ======================================


# ---------- Base Image ----------

FROM ubuntu:24.04



# ---------- Metadata ----------

LABEL maintainer="Esron"

LABEL version="1.0"

LABEL description="AgentOS Container"



# ---------- Environment Variables ----------

ENV APP_NAME="AgentOS"

ENV APP_ENV="production"



# ---------- Working Directory ----------

WORKDIR /app



# ---------- Copy Files ----------

COPY .

/app



COPY requirements.txt .

/app/



# ---------- Install Packages ----------

RUN apt update && \
    apt install -y \
    python3 \
    python3-pip



# ---------- Dependencies ----------

RUN pip install \
    -r requirements.txt



# ---------- User ----------

RUN useradd \
    -m agent



USER agent



# ---------- Expose Port ----------

EXPOSE 8080



# ---------- Volume ----------

VOLUME [

    "/app/data"

]



# ---------- Health Check ----------

HEALTHCHECK \

    --interval=30s \

    --timeout=5s \

    CMD curl -f http://localhost:8080 || exit 1



# ---------- Entry Point ----------

ENTRYPOINT [

    "python3"

]



# ---------- Command ----------

CMD [

    "main.py"

]