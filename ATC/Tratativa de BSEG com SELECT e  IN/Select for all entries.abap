* ---> S4 Migration - 24/07/2024 - FV
*        SELECT bukrs belnr gjahr buzei koart augdt augbl hkont lifnr kunnr shkzg wrbtr pswsl kostl gsber sgtxt zzlivro zzcta_corr valut
*          FROM bseg
*          INTO TABLE it_bseg
*          FOR ALL ENTRIES IN it_bkpf
*          WHERE bukrs = it_bkpf-bukrs
*          AND   belnr = it_bkpf-belnr
*          AND   gjahr = it_bkpf-gjahr
*          AND   hkont IN r_saknr.

DATA lt_bseg_1 TYPE TABLE OF bseg.

        CALL FUNCTION 'FAGL_GET_BSEG_FOR_ALL_ENTRIES'
          EXPORTING
            it_for_all_entries = it_bkpf
            i_where_clause     = |BUKRS = IT_FOR_ALL_ENTRIES-BUKRS AND BELNR = IT_FOR_ALL_ENTRIES-BELNR AND GJAHR = IT_FOR_ALL_ENTRIES-GJAHR|
          IMPORTING
            et_bseg            = lt_bseg_1
          EXCEPTIONS
            not_found          = 1.

        IF sy-subrc = 0 AND lines( lt_bseg_1 ) > 0.
          DELETE lt_bseg_1 WHERE hkont NOT IN r_saknr.

          MOVE-CORRESPONDING lt_bseg_1[] TO it_bseg[].
        ENDIF.
* ---> S4 Migration - 24/07/2024 - FV
