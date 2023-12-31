"Para tratar a BAPI_ACC_DOCUMENT_CHECK, primeiro colocamos um pragma na frante do nome da BAPI, após isso, fazemos a conversão de campos com "CONV #( ... )", onde 
"for passado algum valor para a tabela que alimentará o parâmetro "currencyamount" da BAPI.
*****************************************************************************************************************************************************************

* ---> S4 Migration - 26/07/2023 - FV - Inicio
      currencyamount-itemno_acc = CONV #( item_pos ).
      currencyamount-currency = CONV #( es_esquemas-cod_moneda ).
* ---> S4 Migration - 26/07/2023 - FV - Fim

  ....
 
      CALL FUNCTION 'BAPI_ACC_DOCUMENT_CHECK'     "#EC CI_USAGE_OK[2628704]   * ---> S4 Migration - 26/07/2023 - FV 
        EXPORTING
          documentheader = documentheader
        TABLES
          accountgl      = accountgl
          currencyamount = currencyamount
          return         = return.
