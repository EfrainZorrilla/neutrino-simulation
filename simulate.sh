#!/bin/bash

echo "Iniciando simulación de detección de neutrinos..."
mkdir -p data
start_time=$(date +%s.%N)

for i in $(seq -w 1 1000)
do

filename="data/${i}.txt"
timestamp=$(date)
neutrinos=$((RANDOM % 11))

echo "Evento: $i" > "filename"
echo "Timestamp: $timestamp" >> "filename"
echo "Neutrinos detectados: $neutrinos" >> "filename"
done

echo "Se han generado 1000 archivo de eventos en la carpeta /data."
echo "Procesando resultados..."

cat data/*.txt > results.txt
echo "Archivos combinados en results.txt."

end_time=$(date +%s.%N)
total_time=$(echo "$end_time - $start_time" | bc)
average_time=$(echo "scale=4; $total_time / 1000" | bc)

echo "--- Métricas de Rendimiento de la Simulación ---" > performance.txt
echo "Tiempo total de ejecución: ${total_time} segundos." >> performance.txt
echo "Tiempo promedio por evento: ${average_time} segundos." >> performance.txt

echo "Análisis de rendimiento guardado en performance.txt."
echo "¡Proceso completado!"
