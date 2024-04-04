*---> 03.04.2024 - Migração S4 – FV
*      SELECT SINGLE katyp
*             INTO lc_katyp
*             FROM cskb
*             WHERE kokrs EQ cc_gol AND
*                   kstar EQ gs_itens-conta_cont.
      DATA: lw_returns TYPE TABLE OF bapiret2,
            ls_coeldes TYPE bapi1030_ceoutputlist.

      CALL FUNCTION 'K_COSTELEM_BAPI_GETDETAIL'
        EXPORTING
          controllingarea   = cc_gol
          costelement       = gs_itens-conta_cont
          keydate           = sy-datum
        IMPORTING
          costelementdetail = ls_coeldes
        TABLES
          return            = lw_returns.
      READ TABLE lw_returns TRANSPORTING NO FIELDS WITH KEY type = 'E'.
      IF sy-subrc IS NOT INITIAL.
        lc_katyp = ls_coeldes-celem_category.
      ENDIF.
*<--- 03.04.2024 - Migração S4 – FV
