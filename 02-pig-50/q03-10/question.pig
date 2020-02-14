-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
fs -put -f data.tsv

datos = LOAD 'data.tsv' USING PigStorage('\t') AS (col1:CHARARRAY, col2:CHARARRAY, col3:INT);
orden = ORDER datos BY col3;
top = LIMIT orden 5;
col = FOREACH top GENERATE col3;
-- escribe el archivo de salida
STORE col INTO 'output';

fs -get -f output/ .
