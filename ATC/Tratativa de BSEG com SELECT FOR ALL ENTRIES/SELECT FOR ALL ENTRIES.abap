* ---> S4 Migration - 03/01/2023 - JP
*  SELECT bukrs belnr gjahr buzei shkzg dmbtr hkont gsber koart nplnr
*         aufpl projk kostl aufnr anln1 anln2 kokrs lifnr sgtxt augbl
*         augdt umsks umskz rebzz skfbt rebzg rebzj rebzt
*    FROM bseg
*    INTO TABLE t_bseg_k3
*    FOR ALL ENTRIES IN t_bsas_k3_p
*    WHERE bukrs EQ t_bsas_k3_p-bukrs
*      AND belnr EQ t_bsas_k3_p-belnr
*      AND gjahr EQ t_bsas_k3_p-gjahr
*      AND gsber EQ p_gsber.
**      AND koart IN (c_koart_k,c_chars).

  DATA: lt_bseg TYPE fagl_t_bseg.

  CALL FUNCTION 'FAGL_GET_BSEG_FOR_ALL_ENTRIES'
    EXPORTING
      it_for_all_entries = t_bsas_k3_p
      i_where_clause     = |BUKRS = IT_FOR_ALL_ENTRIES-BUKRS AND BELNR = IT_FOR_ALL_ENTRIES-BELNR AND GJAHR = IT_FOR_ALL_ENTRIES-GJAHR|
*     it_fieldlist       = lt_fields
*     i_mode             = abap_true
    IMPORTING
      et_bseg            = lt_bseg
    EXCEPTIONS
      not_found          = 1
      invalid_call       = 2
      OTHERS             = 3.

  IF sy-subrc EQ 0.
    DELETE lt_bseg WHERE gsber NE p_gsber.
    MOVE-CORRESPONDING lt_bseg[] TO t_bseg_k3[].
    CLEAR lt_bseg[].
  ENDIF.

*  CHECK sy-subrc IS INITIAL.
  CHECK t_bseg_k3 IS NOT INITIAL.
* <--- S4 Migration - 03/01/2024 – JP


** ---> S4 Migration - 03/01/2023 - JP
*    SELECT bukrs belnr gjahr buzei shkzg dmbtr hkont gsber koart nplnr
*           aufpl projk kostl aufnr anln1 anln2 kokrs lifnr sgtxt augbl
*           augdt umsks umskz rebzz skfbt rebzg rebzj rebzt
*      FROM bseg
*      INTO TABLE t_bseg_or_c
*      FOR ALL ENTRIES IN t_bsas_or_c
*      WHERE bukrs EQ t_bsas_or_c-bukrs
*        AND belnr EQ t_bsas_or_c-belnr
*        AND gjahr EQ t_bsas_or_c-gjahr
*        AND shkzg EQ c_chars
*        AND gsber EQ p_gsber
*        AND dmbtr >  0.
**        AND koart EQ c_chars.

    CALL FUNCTION 'FAGL_GET_BSEG_FOR_ALL_ENTRIES'
      EXPORTING
        it_for_all_entries = t_bsas_or_c
        i_where_clause     = |BUKRS = IT_FOR_ALL_ENTRIES-BUKRS AND BELNR = IT_FOR_ALL_ENTRIES-BELNR AND GJAHR = IT_FOR_ALL_ENTRIES-GJAHR|
*       it_fieldlist       = lt_fields
*       i_mode             = abap_true
      IMPORTING
        et_bseg            = lt_bseg
      EXCEPTIONS
        not_found          = 1
        invalid_call       = 2
        OTHERS             = 3.

    IF sy-subrc EQ 0.
      DELETE lt_bseg WHERE shkzg NE c_chars.
      DELETE lt_bseg WHERE gsber NE p_gsber.
      DELETE lt_bseg WHERE dmbtr LE p_gsber.

      MOVE-CORRESPONDING lt_bseg[] TO t_bseg_or_c[].
      CLEAR lt_bseg[].
    ENDIF.
* <--- S4 Migration - 03/01/2024 – JP


* ---> S4 Migration - 03/01/2023 - JP
*    SELECT bukrs belnr gjahr buzei shkzg dmbtr hkont gsber koart nplnr
*           aufpl projk kostl aufnr anln1 anln2 kokrs lifnr sgtxt augbl
*           augdt
*      FROM bseg
*      INTO TABLE t_bseg_d3_o
*      FOR ALL ENTRIES IN t_bsas_d3_o
*      WHERE bukrs EQ t_bsas_d3_o-bukrs
*        AND belnr EQ t_bsas_d3_o-belnr
*        AND gjahr EQ t_bsas_d3_o-gjahr
*        AND shkzg EQ c_shkzg_h
*        AND koart EQ c_chars
*        AND gsber EQ p_gsber
*        AND dmbtr GT 0.

    CALL FUNCTION 'FAGL_GET_BSEG_FOR_ALL_ENTRIES'
      EXPORTING
        it_for_all_entries = t_bsas_d3_o
        i_where_clause     = |BUKRS = IT_FOR_ALL_ENTRIES-BUKRS AND BELNR = IT_FOR_ALL_ENTRIES-BELNR AND GJAHR = IT_FOR_ALL_ENTRIES-GJAHR|
*       it_fieldlist       = lt_fields
*       i_mode             = abap_true
      IMPORTING
        et_bseg            = lt_bseg
      EXCEPTIONS
        not_found          = 1
        invalid_call       = 2
        OTHERS             = 3.

    IF sy-subrc EQ 0.
      DELETE lt_bseg WHERE shkzg NE c_shkzg_h.
      DELETE lt_bseg WHERE koart NE c_chars.
      DELETE lt_bseg WHERE gsber NE p_gsber.
      DELETE lt_bseg WHERE dmbtr LE 0.

      MOVE-CORRESPONDING lt_bseg[] TO t_bseg_d3_o[].
      CLEAR lt_bseg[].
    ENDIF.
* <--- S4 Migration - 03/01/2024 – JP

