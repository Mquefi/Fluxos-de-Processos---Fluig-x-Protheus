-- AUTHOR: MARCELLO QUEIROZ
-- DATE: 16/07/2022
-- VERSION: 01
-- CONTACT PHONE: 55 41 99249-1979
-- MAIL: contato@marcelloqueiroz.com.br
-- GITHUB: https://github.com/Mquefi
-- BRAZIL - CURITIBA - PR

SELECT *
FROM(
        SELECT COD_DATASET,
            '0' AS NR_DOCUMENTO,
            'MD' + right(
                replicate('0', 3) + cast(rtrim(ltrim(COD_EMPRESA)) as varchar(3)),
                3
            ) + right(
                replicate('0', 3) + cast(rtrim(ltrim(COD_LISTA)) as varchar(3)),
                3
            ) AS META_LIST,
            TYPE,
            'jornalizado' as DETAIL
        FROM SERV_DATASET
        WHERE COD_EMPRESA = 1
            AND TYPE = 'CUSTOM'
            AND COD_LISTA IS NOT NULL
        UNION ALL
        SELECT DS.COD_DATASET,
            D.NR_DOCUMENTO,
            'ML' + right(
                replicate('0', 3) + cast(rtrim(ltrim(D.COD_EMPRESA)) as varchar(3)),
                3
            ) + right(
                replicate('0', 3) + cast(rtrim(ltrim(D.COD_LISTA)) as varchar(3)),
                3
            ) AS META_LIST,
            TYPE,
            'principal' as TIPO
        FROM SERV_DATASET DS
            INNER JOIN DOCUMENTO D ON DS.COD_EMPRESA = D.COD_EMPRESA
            AND DS.DSL_DATASET = D.NR_DOCUMENTO
            AND D.VERSAO_ATIVA = 1
        WHERE DS.COD_EMPRESA = 1
            and DS.IS_ACTIVE = 1
            AND DS.DSL_BUILDER = 'com.datasul.technology.webdesk.dataset.MetaListDatasetBuilder'
            AND DS.TYPE = 'BUILTIN'
        UNION all
        SELECT DAD_DS.COD_DATASET,
            MLR.COD_LISTA_PAI as NR_DOCUMENTO,
            'ML' + right(
                replicate('0', 3) + cast(rtrim(ltrim(MLR.COD_EMPRESA)) as varchar(3)),
                3
            ) + right(
                replicate('0', 3) + cast(rtrim(ltrim(MLR.COD_LISTA_FILHO)) as varchar(3)),
                3
            ) AS META_LIST,
            TYPE,
            MLR.COD_TABELA as TIPO
        FROM meta_lista_rel MLR
            INNER JOIN documento DAD on MLR.COD_EMPRESA = DAD.COD_EMPRESA
            and MLR.COD_LISTA_PAI = DAD.COD_LISTA
            and DAD.VERSAO_ATIVA = 1
            INNER JOIN SERV_DATASET DAD_DS on MLR.COD_EMPRESA = DAD_DS.COD_EMPRESA
            and DAD.NR_DOCUMENTO = DAD_DS.DSL_DATASET
            and DAD_DS.IS_ACTIVE = 1
            AND DAD_DS.DSL_BUILDER = 'com.datasul.technology.webdesk.dataset.MetaListDatasetBuilder'
            AND DAD_DS.TYPE = 'BUILTIN'
        WHERE MLR.COD_EMPRESA = 1
    ) AS R
WHERE COD_DATASET like '%'
order by 1 DESC