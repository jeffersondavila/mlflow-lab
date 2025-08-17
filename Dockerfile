# Utiliza como base la imagen oficial de Jupyter que ya incluye Apache Spark, JupyterLab y otras herramientas.
FROM jupyter/all-spark-notebook

# ----- Sistema mínimo extra (opcional) -----
USER root
RUN apt-get update && apt-get install -y --no-install-recommends jq && rm -rf /var/lib/apt/lists/*
USER ${NB_UID}

WORKDIR /home/jovyan

# Copia el archivo de requisitos
COPY requirements.txt .

# Instala pip + torch CPU + resto de requirements
RUN pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir --index-url https://download.pytorch.org/whl/cpu torch==2.1.1 \
 && pip install --no-cache-dir -r requirements.txt

# Pre-descarga de recursos NLTK usados en el curso (evita que falle en runtime)
RUN python - <<'PY'
import nltk
nltk.download('punkt'); nltk.download('stopwords')
PY

# Copia con permisos y propietario correctos (evita problemas en Windows)
COPY --chown=${NB_UID}:${NB_GID} --chmod=0755 start.sh /home/jovyan/start-with-mlflow.sh
# Normaliza saltos de línea por si el archivo tiene CRLF
RUN sed -i 's/\r$//' /home/jovyan/start-with-mlflow.sh

# Para que Python encuentre /src del proyecto de Platzi cuando lo montemos
ENV PYTHONPATH=/home/jovyan/workspace:/home/jovyan/workspace/src

EXPOSE 5000 8888 4040

# Lanza MLflow server + JupyterLab
CMD ["bash", "/home/jovyan/start-with-mlflow.sh"]
