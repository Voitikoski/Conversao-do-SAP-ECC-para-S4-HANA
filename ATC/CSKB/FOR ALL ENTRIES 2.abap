*---> 20.07.2024 08:36:40 - Migração S4 – BM
*      select kokrs kstar katyp
*         into table t_cskb
*         from cskb
*            for all entries in h_bseg
*         where kokrs eq 'HYPM'
*           and kstar eq h_bseg-hkont.
      DATA: lt_cosel TYPE TABLE OF cosel,
            lt_cskb  TYPE TABLE OF cskb_ex,
            lt_aux   LIKE TABLE OF t_cskb.

      LOOP AT h_bseg INTO DATA(ls_bseg).

        REFRESH: lt_cosel, lt_cskb, lt_aux.

        lt_cosel = VALUE #( ( field = 'KSTAR' sign = 'I' option = 'EQ' low = ls_bseg-hkont ) ).

        CALL FUNCTION 'K_COSTELEM_SELECT_PAR'
          EXPORTING
            kokrs           = 'HYPM'
          TABLES
            it_cosel        = lt_cosel
            it_result       = lt_cskb
          EXCEPTIONS
            no_record_found = 1
            OTHERS          = 2.

        IF lt_cskb[] IS NOT INITIAL.
          MOVE-CORRESPONDING lt_cskb[] TO lt_aux[].
          APPEND LINES OF lt_aux TO t_cskb.
        ENDIF.

      ENDLOOP.
*<--- 20.07.2024 08:36:40 - Migração S4 – BM
