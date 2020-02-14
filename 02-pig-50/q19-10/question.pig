-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT
--        firstname,
--        color
--    FROM 
--        u 
--    WHERE 
--        color REGEXP '^b';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
fs -put -f data.csv;
datos = LOAD 'data.csv' USING PigStorage(',')    
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
cols = FOREACH datos GENERATE SUBSTRING(color,0,1) AS ini,firstname,color;
filtro = FILTER cols BY (ini == 'b'); 
result = FOREACH filtro GENERATE firstname,color;
STORE result INTO 'output' using PigStorage(',');
fs -get -f output/ .
