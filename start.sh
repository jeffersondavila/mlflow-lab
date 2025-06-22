#!/bin/bash

# Inicia MLflow en segundo plano
mlflow ui --host 0.0.0.0 --port 5000 &

# Inicia JupyterLab en primer plano
start-notebook.sh jupyter lab