* ---> S4 Migration - 17/04/2024 - FV

*    SELECT bukrs belnr gjahr gsber hkont lifnr kunnr prctr augdt nebtr dmbtr
*      APPENDING TABLE gt_bseg
*      FROM bseg
*      FOR ALL ENTRIES IN gt_bsak
*     WHERE bukrs EQ gt_bsak-bukrs
*       AND belnr EQ gt_bsak-belnr.
      
          DATA: t_fields   TYPE fagl_t_field,
                t_bseg_aux TYPE TABLE OF bseg,
                w_gt_bseg LIKE LINE OF gt_bseg.

          t_fields = VALUE #( ( line = 'BUKRS' )
                              ( line = 'BELNR' )
                              ( line = 'GJAHR' )
                              ( line = 'GSBER' )
                              ( line = 'HKONT' )
                              ( line = 'LIFNR' )
                              ( line = 'KUNNR' )
                              ( line = 'PRCTR' )
                              ( line = 'AUGDT' )
                              ( line = 'NEBTR' )
                              ( line = 'DMBTR' ) ).      
CALL FUNCTION 'FAGL_GET_BSEG_FOR_ALL_ENTRIES'
  EXPORTING
    it_for_all_entries       = gt_bsak
    i_where_clause           = |BUKRS = IT_FOR_ALL_ENTRIES-BUKRS AND BELNR = IT_FOR_ALL_ENTRIES-BELNR|
   IT_FIELDLIST             = t_fields
 IMPORTING
   ET_BSEG                  = t_bseg_aux
 EXCEPTIONS
   NOT_FOUND                = 1.
      
IF sy-subrc = 0 AND lines( t_bseg_aux ) > 0.
            LOOP AT t_bseg_aux INTO DATA(w_bseg_aux).
              w_gt_bseg-BUKRS = w_bseg_aux-BUKRS.
              w_gt_bseg-BELNR = w_bseg_aux-BELNR.
              w_gt_bseg-GJAHR = w_bseg_aux-GJAHR.
              w_gt_bseg-GSBER = w_bseg_aux-GSBER.
              w_gt_bseg-HKONT = w_bseg_aux-HKONT.
              w_gt_bseg-LIFNR = w_bseg_aux-LIFNR.
              w_gt_bseg-KUNNR = w_bseg_aux-KUNNR.
              w_gt_bseg-PRCTR = w_bseg_aux-PRCTR.
              w_gt_bseg-AUGDT = w_bseg_aux-AUGDT.
              w_gt_bseg-NEBTR = w_bseg_aux-NEBTR.
              w_gt_bseg-DMBTR = w_bseg_aux-DMBTR.
              APPEND w_gt_bseg TO gt_bseg.
            ENDLOOP.
            sy-dbcnt = lines( t_bseg_aux ).
          ELSE.
            sy-subrc = 4.
            sy-dbcnt = 0.
          ENDIF.
      
* ---> S4 Migration - 17/04/2024 - FV
