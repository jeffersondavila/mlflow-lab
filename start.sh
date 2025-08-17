#!/bin/bash
set -e

# Crea carpetas necesarias (idempotente)
mkdir -p "${MLFLOW_ARTIFACT_ROOT:-/home/jovyan/mlruns}"
mkdir -p "/home/jovyan/state"

# MLflow server con backend SQLite y proxy de artifacts
mlflow server \
  --host "${MLFLOW_HOST:-0.0.0.0}" \
  --port "${MLFLOW_PORT:-5000}" \
  --backend-store-uri "${MLFLOW_BACKEND_URI:-sqlite:////home/jovyan/state/mlflow.db}" \
  --serve-artifacts \
  --artifacts-destination "${MLFLOW_ARTIFACT_ROOT:-/home/jovyan/mlruns}" &

# JupyterLab (entorno local)
jupyter lab --NotebookApp.token='' --ip=0.0.0.0 --port="${JUPYTER_PORT:-8888}" --no-browser
