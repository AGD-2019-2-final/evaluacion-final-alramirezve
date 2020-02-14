-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
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
r = FOREACH datos GENERATE FLATTEN(col2) AS apl;
grupo = GROUP r BY apl;
cuenta = FOREACH grupo GENERATE group, COUNT(r) AS conteo;
STORE cuenta INTO 'output' using PigStorage('\t');
fs -get -f output/ .