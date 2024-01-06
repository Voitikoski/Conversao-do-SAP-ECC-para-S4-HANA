* ---> S4 Migration - 05/01/2024 - AG
*      SELECT SINGLE hkont FROM bseg INTO outrec-cod_cp WHERE
*                                    bukrs = br_bukrs-low AND
*                                    belnr = bkpf-belnr   AND
*                                    gjahr = v_gjahr      AND
*                                    shkzg = 'H'." Crédito

  DATA: lt_bseg TYPE fagl_t_bseg.

  CALL FUNCTION 'FAGL_GET_BSEG'
    EXPORTING
      i_bukrs = br_bukrs-low
      i_belnr = bkpf-belnr
      i_gjahr = v_gjahr
    IMPORTING
      et_bseg = lt_bseg
    EXCEPTIONS
      OTHERS  = 2.

    DELETE lt_bseg WHERE shkzg NE 'H'.
    READ TABLE lt_bseg INTO DATA(wa_bseg) INDEX 1.

  IF sy-subrc EQ 0.
    outrec-cod_cp = wa_bseg-hkont.
  ENDIF.
* <--- S4 Migration - 05/01/2024 - AG
