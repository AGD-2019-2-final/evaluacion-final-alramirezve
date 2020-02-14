-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
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
result = FOREACH datos GENERATE col1,SIZE(col2),SIZE(col3);
orden = ORDER result BY $0,$1,$2;
STORE orden INTO 'output' using PigStorage(',');
fs -get -f output/ .