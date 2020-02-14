-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.csv` escriba una consulta en Pig que genere la 
-- siguiente salida:
-- 
--   Vivian@Hamilton
--   Karen@Holcomb
--   Cody@Garrett
--   Roth@Fry
--   Zoe@Conway
--   Gretchen@Kinney
--   Driscoll@Klein
--   Karyn@Diaz
--   Merritt@Guy
--   Kylan@Sexton
--   Jordan@Estes
--   Hope@Coffey
--   Vivian@Crane
--   Clio@Noel
--   Hope@Silva
--   Ayanna@Jarvis
--   Chanda@Boyer
--   Chadwick@Knight
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
fs -put -f data.csv;

datos = LOAD 'data.csv' USING PigStorage(',') AS (
        col1::INT,
        col2:CHARARRAY,
        col3:CHARARRAY,
        col4:CHARARRAY,
        col5:CHARARRAY,
        col6:INT
        );
cols = FOREACH datos GENERATE col2,col3;
STORE cols INTO 'output' using PigStorage('@');
fs -get -f output/ .

