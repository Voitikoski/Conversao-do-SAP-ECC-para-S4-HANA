*---> 19/09/2023 - Migração S4 – FV
*    SELECT SINGLE *
*      FROM bseg
*      INTO @DATA(st_bseg)
*      WHERE bukrs EQ @e_bsik-bukrs
*      AND belnr EQ @e_bsik-belnr
*      AND gjahr EQ @e_bsik-gjahr
*      AND buzei EQ @e_bsik-buzei.
      DATA: l_RLDNR    TYPE rldnr,
            t_bseg_aux TYPE fagl_t_bseg.

      CALL FUNCTION 'FAGL_GET_LEADING_LEDGER'
        IMPORTING
          e_rldnr       = l_RLDNR
        EXCEPTIONS
          not_found     = 1
          more_than_one = 2.

      IF sy-subrc = 0.
        CALL FUNCTION 'FAGL_GET_GL_DOCUMENT'
          EXPORTING
            i_rldnr   = l_RLDNR
            i_bukrs   = e_bsik-bukrs
            i_belnr   = e_bsik-belnr
            i_gjahr   = e_bsik-gjahr
          IMPORTING
            et_bseg   = t_bseg_aux
          EXCEPTIONS
            not_found = 1.
      ENDIF.

      DELETE t_bseg_aux WHERE buzei NE e_bsik-buzei.

      IF sy-subrc <> 0 OR lines( t_bseg_aux ) = 0.
        sy-subrc = 4.
        sy-dbcnt = 0.
      ELSE.
        sy-dbcnt = lines( t_bseg_aux ).
        READ TABLE t_bseg_aux INTO DATA(w_bseg_aux) INDEX 1.
        IF sy-subrc IS INITIAL.
          DATA(st_bseg) = w_bseg_aux.
        ENDIF.
      ENDIF.

*<--- 19/09/2023 - Migração S4 – FV
