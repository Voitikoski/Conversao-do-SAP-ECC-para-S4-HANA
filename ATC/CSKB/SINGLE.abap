*---> 20.07.2024 08:08:21 - Migração S4 – BM
*      SELECT SINGLE katyp
*      FROM cskb
*      INTO lv_katyp
*      WHERE kokrs IN r_kokrs
*      AND kstar EQ cobl-saknr
*      AND datbi IN r_datbi.

      DATA: lt_cosel TYPE TABLE OF cosel,
            lt_cskb  TYPE TABLE OF cskb_ex.

      lt_cosel = VALUE #( ( field = 'KSTAR' sign = 'I' option = 'EQ' low = cobl-saknr ) ).

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
        READ TABLE lt_cskb INTO DATA(ls_cskb) INDEX 1.
        lv_katyp = ls_cskb-katyp.
      ENDIF.
*<--- 20.07.2024 08:08:21 - Migração S4 – BM
