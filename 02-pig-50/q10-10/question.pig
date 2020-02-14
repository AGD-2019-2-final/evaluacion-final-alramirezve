-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
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
cols = FOREACH datos GENERATE surname,SIZE(surname) AS tamano;
orden = ORDER cols BY tamano DESC,surname ASC;
limite = LIMIT orden 5;
STORE limite INTO 'output' using PigStorage(',');
fs -get -f output/ .