*---> 20.07.2024 08:30:39 - Migração S4 – BM
* SELECT kokrs kstar katyp
* INTO TABLE ti_cskb
* FROM cskb
* FOR ALL ENTRIES IN ti_faglflext
* WHERE kokrs EQ ti_faglflext-kokrs
* AND kstar EQ ti_faglflext-racct.
        DATA: lt_cosel2 TYPE TABLE OF cosel,
              lt_cskb2  TYPE TABLE OF cskb_ex,
              lt_aux2   LIKE TABLE OF ti_cskb.

        LOOP AT ti_faglflext INTO DATA(ls_faglflext).

          REFRESH: lt_cosel2, lt_cskb2, lt_aux2.

          lt_cosel2 = VALUE #( ( field = 'KSTAR' sign = 'I' option = 'EQ' low = ls_faglflext-racct ) ).

          CALL FUNCTION 'K_COSTELEM_SELECT_PAR'
            EXPORTING
              kokrs           = ls_faglflext-kokrs
            TABLES
              it_cosel        = lt_cosel2
              it_result       = lt_cskb2
            EXCEPTIONS
              no_record_found = 1
              OTHERS          = 2.

          IF lt_cskb2[] IS NOT INITIAL.
            MOVE-CORRESPONDING lt_cskb2[] TO lt_aux2[].
            APPEND LINES OF lt_aux2 TO ti_cskb.
          ENDIF.

        ENDLOOP.
*<--- 20.07.2024 08:30:39 - Migração S4 – BM
