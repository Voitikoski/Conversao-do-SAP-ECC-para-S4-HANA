*---> 29/12/2023 - Migração S4 – FV
*          SELECT belnr matnr
*            FROM mlit
*            INTO TABLE lt_mlit
*            FOR ALL ENTRIES IN lt_mlreport
*            WHERE belnr = lt_mlreport-belnr
*              AND kjahr = b1_pdate_low(4)
*              AND kategorie = 'ZU'.
*          IF sy-subrc = 0.

          DATA: lt_mlhd_sec  TYPE TABLE OF mlhd,
                lt_mlmst_sec TYPE TABLE OF mlmst,
                lt_mlit_sec  TYPE TABLE OF mlit,
                lt_mlpp_sec  TYPE TABLE OF mlpp,
                lt_mlppf_sec TYPE TABLE OF mlppf,
                lt_mlcr_sec  TYPE TABLE OF mlcr,
                lt_mlcrf_sec TYPE TABLE OF mlcrf,
                lt_mlcrp_sec TYPE TABLE OF mlcrp.

          DATA: lv_belnr TYPE  ck_belnr,
                lv_kjahr TYPE  ck_kjahr.

          DATA(lt_mlreport_aux) = lt_mlreport[].
          SORT lt_mlreport_aux BY belnr.
          DELETE ADJACENT DUPLICATES FROM lt_mlreport_aux COMPARING belnr.

          LOOP AT lt_mlreport_aux ASSIGNING FIELD-SYMBOL(<fs_mlreport_aux>).
            lv_belnr = <fs_mlreport_aux>-belnr.
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

            DELETE lt_mlit_sec WHERE kategorie NE 'ZU'.

            READ TABLE lt_mlit_sec INTO DATA(wa_mlit_sec) INDEX 1.
            IF sy-subrc EQ 0.
              APPEND INITIAL LINE TO lt_mlit[] ASSIGNING FIELD-SYMBOL(<fs_mlit>).
              <fs_mlit>-belnr = wa_mlit_sec-belnr.
              <fs_mlit>-matnr = wa_mlit_sec-matnr.
            ENDIF.

            CLEAR: lt_mlhd_sec[],  lt_mlmst_sec[], lt_mlit_sec[],  lt_mlpp_sec[],
                   lt_mlppf_sec[], lt_mlcr_sec[],  lt_mlcrf_sec[], lt_mlcrp_sec[],
                   lv_belnr, lv_kjahr.
          ENDLOOP.
          IF lt_mlit[] IS NOT INITIAL.
*<--- 29/12/2023 - Migração S4 – FV

