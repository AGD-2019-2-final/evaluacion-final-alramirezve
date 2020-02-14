-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -put -f data.tsv;

datos = LOAD 'data.tsv' USING PigStorage('\t') AS (
        col1:CHARARRAY,
        col2:BAG{t:(p:CHARARRAY)},
        col3:MAP[]
        );
aplanado = FOREACH datos GENERATE FLATTEN(col2) AS clave,FLATTEN(KEYSET(col3)) AS valor;
grupo = GROUP aplanado BY (clave,valor);
cuenta = FOREACH grupo GENERATE group, COUNT(aplanado) AS conteo;
STORE cuenta INTO 'output' using PigStorage('\t');
fs -get -f output/ .