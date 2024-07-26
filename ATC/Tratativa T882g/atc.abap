* ---> S4 Migration - 08.07.2024 11:34:28 - FV
*        SELECT SINGLE periv
*        FROM t882g
*        INTO gs_t001-periv
*        WHERE rbukrs = gs_zscrelacngl-bukrs
*        AND rldnr = gs_zscrelacngl-rldnr.

        cl_fins_acdoc_util=>get_t882g_emu(
          EXPORTING
            iv_rldnr  = CONV rldnr( gs_zscrelacngl-rldnr )
            iv_rbukrs = CONV bukrs( gs_zscrelacngl-bukrs )
          IMPORTING
            es_t882g  =  DATA(ls_t882g)
          EXCEPTIONS
            not_found = 1
            OTHERS    = 2 ).

        IF ls_t882g IS NOT INITIAL.
          gs_t001-periv = ls_t882g-periv.
          sy-subrc = 0.
        ELSE.
          sy-subrc = 4.
        ENDIF.
* <--- S4 Migration - 08.07.2024 11:34:30 - FV
