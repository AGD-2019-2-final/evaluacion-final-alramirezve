-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
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
r = FOREACH datos GENERATE FLATTEN(col3) AS apl;
grupo = GROUP r BY apl;
cuenta = FOREACH grupo GENERATE group, COUNT(r) AS conteo;
STORE cuenta INTO 'output' using PigStorage(',');

fs -get -f output/ .