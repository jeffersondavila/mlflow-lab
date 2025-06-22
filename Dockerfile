FROM jupyter/all-spark-notebook

RUN pip install mlflow

COPY start.sh /usr/local/bin/start-with-mlflow.sh
RUN chmod +x /usr/local/bin/start-with-mlflow.sh

CMD ["start-with-mlflow.sh"]
