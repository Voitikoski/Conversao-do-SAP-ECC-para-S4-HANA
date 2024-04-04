*---> 28/11/2023 - Migração S4 – FV
*   Seleciona Classes custos
*    SELECT kokrs kstar
*      FROM cskb
*      INTO TABLE t_cskb
*      FOR ALL ENTRIES IN t_fagl_011zc
*      WHERE kstar >= t_fagl_011zc-vonkt
*        AND kstar <= t_fagl_011zc-biskt.

*    IF sy-subrc = 0.
*      SORT t_cskb BY kstar.
*    ENDIF.

     DATA: t_cskb_aux TYPE TABLE OF y_cskb.
     DATA: t_returns  TYPE TABLE OF bapiret2.

     SELECT kokrs
            kstar
       FROM cskb                              "#EC CI_DB_OPERATION_OK[2389136]
       INTO TABLE t_cskb
         FOR ALL ENTRIES IN t_fagl_011zc
      WHERE kokrs IN r_kokrs
       AND kstar >= t_fagl_011zc-vonkt
       AND kstar <= t_fagl_011zc-biskt.

      IF sy-subrc EQ 0.
        t_cskb_aux = VALUE #( FOR w_cskb_r IN t_cskb ( kokrs = w_cskb_r-kokrs kstar = w_cskb_r-kstar ) ).

      SORT t_cskb_aux BY kokrs kstar DESCENDING.
      DELETE ADJACENT DUPLICATES FROM t_cskb_aux COMPARING kokrs kstar.
    ENDIF.

    CLEAR: t_cskb[].

    LOOP AT t_cskb_aux INTO DATA(w_cskb_aux).
      CLEAR: t_returns[].

      CALL FUNCTION 'K_COSTELEM_BAPI_GETDETAIL'
        EXPORTING
          controllingarea   = w_cskb_aux-kokrs
          costelement       = w_cskb_aux-kstar
          keydate           = sy-datum
        TABLES
          return            = t_returns.

      READ TABLE t_returns TRANSPORTING NO FIELDS WITH KEY type = 'E'.

      IF sy-subrc = 0.
      ELSE.
        CLEAR: w_cskb.

        w_cskb-kokrs = w_cskb_aux-kokrs.
        w_cskb-kstar = w_cskb_aux-kstar.
        APPEND w_cskb TO t_cskb.
      ENDIF.

    ENDLOOP.

    SORT t_cskb BY kstar.
*<--- 28/11/2023 - Migração S4 – FV
