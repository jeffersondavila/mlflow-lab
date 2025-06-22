# Utiliza como base la imagen oficial de Jupyter que ya incluye Apache Spark, JupyterLab y otras herramientas de ciencia de datos.
FROM jupyter/all-spark-notebook

# Instala MLflow dentro del contenedor para permitir el tracking de experimentos de Machine Learning.
RUN pip install mlflow pyspark

# Copia el script de inicio personalizado (start.sh) desde tu máquina local al contenedor,
# colocándolo en el directorio del usuario 'jovyan' (el usuario por defecto en esta imagen base).
COPY start.sh /home/jovyan/start-with-mlflow.sh

# Define el comando que se ejecutará cuando el contenedor arranque.
# Este script inicia MLflow en segundo plano y JupyterLab en primer plano.
CMD ["bash", "/home/jovyan/start-with-mlflow.sh"]
