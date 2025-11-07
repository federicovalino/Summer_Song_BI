# 🎶 Summer Song BI — Business Intelligence Project

**Autor:** Federico Valiño - Stephanie Dimperio
**Universidad Católica del Uruguay — 2022**  
**Materia:** Business Intelligence  
**Repositorio:** [github.com/federicovalino/Summer_Song_BI](https://github.com/federicovalino/Summer_Song_BI)

---

## 📘 Descripción del proyecto

Este proyecto tiene como objetivo analizar las características de las canciones más populares de los últimos años con el fin de **identificar patrones que determinan el éxito comercial de un hit musical** (“la canción del verano”).

A partir de un conjunto de datos con información sobre canciones, artistas y métricas de popularidad, se construyó un **pipeline de datos** para procesar, transformar y visualizar la información de forma clara y accionable.  

El análisis busca responder:  
> ¿Qué atributos musicales (género, tempo, duración, tonalidad, energía, etc.) aumentan la probabilidad de éxito de una canción?

---

## ⚙️ Tecnologías utilizadas

- **dbt (Data Build Tool):** modelado y transformación de datos (ETL).  
- **SQL:** consultas y limpieza de datos.  
- **Power BI:** diseño de dashboards interactivos y visualizaciones.   

---

## 🧩 Estructura del repositorio
Summer_Song_BI/

│

├── models/ # Modelos y transformaciones dbt

│ ├── staging/ # Limpieza y normalización inicial de los datos

│ └── marts/ # Modelos analíticos y métricas finales

│

├── visualization/ # Carpeta con reportes y dashboards de Power BI

│ ├── Summer_Song_Analysis.pbix

│ └── screenshots/ # Capturas de las visualizaciones

│

├── data/ # Datos fuente (datasets de canciones)

│

└── README.md # Este archivo

---

📁 Visualizaciones

En la carpeta visualization se encuentra el archivo .pbix de Power BI con todas las visualizaciones interactivas, incluyendo:

- Distribución de popularidad por año.
- Popularidad por género.
- Correlación entre tempo, tonalidad y duración.
- Principales KPI’s musicales del período analizado (2016–2020).

---

## 🚀 Ejecución del proyecto

1. **Instalar dependencias de dbt**
   ```bash
   pip install dbt
2. **Configurar la conexión a la base de datos**
   Editar el archivo profiles.yml con tus credenciales locales.
3. **Ejecutar el pipeline**
   dbt run
   dbt test
4. **Visualizar resultados**
   Abrir el proyecto de Power BI ubicado en visualization/Summer_Song_Analysis.pbix.
