-- AUTHOR: MARCELLO QUEIROZ
-- DATE: 16/07/2022
-- VERSION: 01
-- CONTACT PHONE: 55 41 99249-1979
-- MAIL: contato@marcelloqueiroz.com.br
-- GITHUB: https://github.com/Mquefi
-- BRAZIL - CURITIBA - PR

(SELECT 'dataset' AS onde, COD_DATASET AS 'o que' FROM serv_dataset WHERE DSL_DATASET LIKE '%FluigDS%') UNION
(SELECT concat('formulario ',nr_documento) AS onde, COD_EVENT AS 'o que' FROM event_ficha WHERE DSL_EVENT LIKE '%FluigDS%') UNION
(SELECT 'evento global' AS onde, COD_EVENT AS 'o que' FROM event_geral WHERE DSL_EVENT LIKE '%FluigDS%') UNION
(SELECT concat('processo ', event_proces.COD_DEF_PROCES) AS onde, COD_EVENT AS 'o que' FROM event_proces WHERE DSL_EVENT LIKE '%FluigDS%')