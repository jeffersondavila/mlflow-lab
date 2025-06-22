FROM jupyter/all-spark-notebook

RUN pip install mlflow

COPY start.sh /home/jovyan/start-with-mlflow.sh

CMD ["bash", "/home/jovyan/start-with-mlflow.sh"]
