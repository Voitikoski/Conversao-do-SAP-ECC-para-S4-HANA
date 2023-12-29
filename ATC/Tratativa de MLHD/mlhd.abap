*---> 29/12/2023 - Migração S4 – FV
*            SELECT awref
*              FROM mlhd
*              INTO TABLE lt_mlhd
*              FOR ALL ENTRIES IN lt_mlit
*              WHERE belnr = lt_mlit-belnr
*              AND   kjahr = b1_pdate_low(4)
*              AND   awtyp = 'RMRP'.
*            IF sy-subrc = 0.


            DATA(lt_mlit_aux) = lt_mlreport[].
            SORT lt_mlit_aux BY belnr.
            DELETE ADJACENT DUPLICATES FROM lt_mlit_aux COMPARING belnr.

            LOOP AT lt_mlit_aux ASSIGNING FIELD-SYMBOL(<fs_mlit_aux>).
              lv_belnr = <fs_mlit_aux>-belnr.
              lv_kjahr = b1_pdate_low(4).

              CALL FUNCTION 'CKML_F_DOCUMENT_READ_MLXX'
                EXPORTING
                  i_belnr     = lv_belnr
                  i_kjahr     = lv_kjahr
                TABLES
                  t_mlhd      = lt_mlhd_sec
                  t_mlmst     = lt_mlmst_sec
                  t_mlit      = lt_mlit_sec
                  t_mlpp      = lt_mlpp_sec
                  t_mlppf     = lt_mlppf_sec
                  t_mlcr      = lt_mlcr_sec
                  t_mlcrf     = lt_mlcrf_sec
                  t_mlcrp     = lt_mlcrp_sec
                EXCEPTIONS
                  no_document = 1.

              DELETE lt_mlhd_sec WHERE awtyp NE 'RMRP'.

              READ TABLE lt_mlhd_sec INTO DATA(wa_mlhd_sec) INDEX 1.
              IF sy-subrc EQ 0.
                APPEND INITIAL LINE TO lt_mlhd[] ASSIGNING FIELD-SYMBOL(<fs_mlhd>).
                <fs_mlhd>-awref = wa_mlhd_sec-awref.
              ENDIF.

              CLEAR: lt_mlhd_sec[],  lt_mlmst_sec[], lt_mlit_sec[],  lt_mlpp_sec[],
                     lt_mlppf_sec[], lt_mlcr_sec[],  lt_mlcrf_sec[], lt_mlcrp_sec[],
                     lv_belnr, lv_kjahr.
            ENDLOOP.
            IF lt_mlhd[] IS NOT INITIAL.
*<--- 29/12/2023 - Migração S4 – FV
