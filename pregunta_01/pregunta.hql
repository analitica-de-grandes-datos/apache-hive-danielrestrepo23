/* 
Pregunta
===========================================================================

Para resolver esta pregunta use el archivo `data.tsv`.

Compute la cantidad de registros por cada letra de la columna 1.
Escriba el resultado ordenado por letra. 

Apache Hive se ejecutará en modo local (sin HDFS).

Escriba el resultado a la carpeta `output` de directorio de trabajo.

        >>> Escriba su respuesta a partir de este punto <<<
*/
DROP TABLE IF EXISTS data;
CREATE TABLE data (line STRING);
LOAD DATA LOCAL INPATH "pregunta_01/Source/" OVERWRITE INTO TABLE data;

INSERT OVERWRITE LOCAL DIRECTORY 'output'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT letter, count(letter) AS value
    FROM
        (SELECT split(line, '\\s')[0] AS letter FROM data) C1
GROUP BY
    letter
ORDER BY
    letter;

