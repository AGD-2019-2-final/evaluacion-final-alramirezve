-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código en Pig para manipulación de fechas que genere la siguiente 
-- salida.
-- 
--    1971-07-08,jul,07,7
--    1974-05-23,may,05,5
--    1973-04-22,abr,04,4
--    1975-01-29,ene,01,1
--    1974-07-03,jul,07,7
--    1974-10-18,oct,10,10
--    1970-10-05,oct,10,10
--    1969-02-24,feb,02,2
--    1974-10-17,oct,10,10
--    1975-02-28,feb,02,2
--    1969-12-07,dic,12,12
--    1973-12-24,dic,12,12
--    1970-08-27,ago,08,8
--    1972-12-12,dic,12,12
--    1970-07-01,jul,07,7
--    1974-02-11,feb,02,2
--    1973-04-01,abr,04,4
--    1973-04-29,abr,04,4
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
cols = FOREACH datos GENERATE birthday,ToDate(birthday,'yyyy-mm-dd') as fecha;
anio = FOREACH cols GENERATE birthday,ToString(fecha,'mm') as mes2,ToString(fecha,'m') as mes1;
nom = FOREACH anio GENERATE birthday, (mes1 == '1' ? 'ene' : (mes1 == '2' ? 'feb' : (mes1 == '3' ? 'mar' : (mes1 == '4' ? 'abr' : (mes1 == '5' ? 'may' : (mes1 == '6' ? 'jun' : (mes1 == '7' ? 'jul' : (mes1 == '8' ? 'ago' : (mes1 == '9' ? 'sep' : (mes1 == '10' ? 'oct' : (mes1 == '11' ? 'nov' : 'dic'))))))))))),mes2,mes1;
STORE nom INTO 'output' using PigStorage(',');
fs -get -f output/ .