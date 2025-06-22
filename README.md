# 🚀 spark-mlflow

Entorno Docker personalizado que combina:

- 📘 **JupyterLab**: Entorno interactivo para notebooks con PySpark.
- 🔥 **Apache Spark**: Motor de procesamiento distribuido.
- 🧪 **MLflow**: Seguimiento y visualización de experimentos de Machine Learning.

Ideal para proyectos locales de ciencia de datos, pruebas de modelos y desarrollo reproducible.

---

## ✅ ¿Qué incluye este entorno?

- Una imagen Docker basada en `jupyter/all-spark-notebook`.
- MLflow instalado y ejecutándose automáticamente.
- Un único contenedor que expone JupyterLab, MLflow UI y Spark UI.
- Carpeta `./notebooks` montada como volumen persistente para guardar tu trabajo.

---

## 📦 Requisitos

Antes de usar este entorno, asegúrate de tener instalado:

- Docker: https://docs.docker.com/get-docker/
- Docker Compose: https://docs.docker.com/compose/install/

---

## ▶️ Cómo usar

1. Clona este repositorio:
`git clone https://github.com/jeffersondavila/spark-mlflow.git`
`cd spark-mlflow`

2. Ejecuta el entorno con Docker Compose:
`docker-compose up --build`

3. Accede a los servicios:
- JupyterLab: http://localhost:8888
- MLflow UI: http://localhost:5000
- Spark UI: http://localhost:4040

4. Para detener el entorno:
`docker-compose down`
