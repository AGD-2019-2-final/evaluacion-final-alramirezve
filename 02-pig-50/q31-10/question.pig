-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
fs -put -f data.csv;
datos = LOAD 'data.csv' USING PigStorage(',')    
    AS (id:int,
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
cols = FOREACH datos GENERATE SUBSTRING(birthday,0,4) AS ini;
grupo = GROUP cols BY ini;
cuenta = FOREACH grupo GENERATE group, COUNT(cols) AS conteo;
orden = ORDER cuenta BY group;
STORE orden INTO 'output' using PigStorage(',');
fs -get -f output/ .