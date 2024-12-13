*---> S4 MIGRATION 13/12/2024 - MA
*            select * from bseg up to 1 rows
*                where belnr = y_piscofins
*                  and bukrs = bukrs
*                  and zuonr = zyceflemim-emicodi.
*            endselect.

*            data lt_fields type fagl_t_field.
*            data lT_BSEG type  fagl_t_bseg.
*            data: ls_bseg_aux type bseg,
*                  lt_bseg_aux type table of bseg.

            refresh: lt_bseg_aux, lT_BSEG.

            ls_bseg_aux-belnr =  y_piscofins.
            ls_bseg_aux-bukrs =  bukrs.
            ls_bseg_aux-zuonr =  zyceflemim-emicodi.

            append ls_bseg_aux to lt_bseg_aux.

            call function 'FAGL_GET_BSEG_FOR_ALL_ENTRIES'
              exporting
                it_for_all_entries = lt_bseg_aux
                i_where_clause     = |BUKRS = IT_FOR_ALL_ENTRIES-BUKRS AND BELNR = IT_FOR_ALL_ENTRIES-BELNR AND GJAHR = IT_FOR_ALL_ENTRIES-GJAHR AND ZUONR = IT_FOR_ALL_ENTRIES-ZUONR|
*               it_fieldlist       = lt_fields
              importing
                et_bseg            = lT_BSEG
              exceptions
                not_found          = 1.

            if sy-subrc = 0 and lines( lT_BSEG ) > 0.
              read table lT_BSEG into ls_bseg index 1.
              move-corresponding ls_bseg to bseg.
            endif.
*<--- S4 MIGRATION 13/12/2024 - MA
