Boletines Oficiales Wrapper
===
Este es el repositorio (y directorio) que debe contener los otros microservicios (ver repositorios en el mismo grupo) con los siguientes nombres:
- BACK-boletines-oficiales
- NLP-boletines-oficiales

## Install & Dependence
- docker

## Use
- Desde una terminal, para ejecutar toda la plataforma
  ```
  docker-compose up --build
  ```
- Desde una terminal, para compilar y relanzar SOLO un microservicio
  ```
  docker-compose up [nombre del microservicio] --build
  ```
  
---
# Nota
Los puertos:
- 8083
- 8084
serán expuestos y deben estar libres
