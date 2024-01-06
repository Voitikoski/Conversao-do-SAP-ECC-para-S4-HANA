* ---> S4 Migration - 06/09/2023 - FV

*  SELECT *
*    FROM bseg
*    INTO TABLE gt_bseg
*    FOR ALL ENTRIES IN gt_with_item
*    WHERE bukrs = p_bukrs
*      AND belnr = gt_with_item-belnr
*      AND gjahr = gt_with_item-gjahr
*      AND buzei = gt_with_item-buzei
*      AND lifnr IN s_lifnr
*      AND bupla IN s_bupla.

   DATA: lt_bseg TYPE TABLE OF bseg.

   CALL FUNCTION 'FAGL_GET_BSEG_FOR_ALL_ENTRIES'
     EXPORTING
       it_for_all_entries       = gt_with_item
       i_where_clause           = |BELNR = IT_FOR_ALL_ENTRIES-BELNR AND GJAHR = IT_FOR_ALL_ENTRIES-GJAHR AND BUZEI = IT_FOR_ALL_ENTRIES-BUZEI|
     IMPORTING
       ET_BSEG                  = lt_bseg
     EXCEPTIONS
       NOT_FOUND                = 1
       INVALID_CALL             = 2
       OTHERS                   = 3.

   IF sy-subrc = 0.
     DELETE lt_bseg WHERE bukrs <> p_bukrs AND lifnr NOT IN s_lifnr AND bupla NOT IN s_bupla.
     MOVE-CORRESPONDING lt_bseg TO gt_bseg.
   ENDIF.

* ---> S4 Migration - 06/09/2023 - FV
