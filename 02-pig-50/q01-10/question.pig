-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

fs -put -f data.tsv

datos = LOAD 'data.tsv' USING PigStorage('\t') AS (col1:CHARARRAY, col2:CHARARRAY, col3:INT);
grupo = GROUP datos BY col1;
conteo = FOREACH grupo GENERATE group, COUNT(datos);

-- escribe el archivo de salida
STORE conteo INTO 'output';

fs -get -f output/ .