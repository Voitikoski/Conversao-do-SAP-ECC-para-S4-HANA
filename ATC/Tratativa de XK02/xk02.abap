* ---> S4 Migration - 19/02/2024 - FV
*  CALL TRANSACTION 'XK02' USING gt_bdcdata OPTIONS FROM ls_bdcopt
*                          MESSAGES INTO lt_bdcmsg.

      DATA: lt_bdc    TYPE bdcdata_tab,
            lt_bdcmsg1 TYPE tab_bdcmsgcoll,
            wa_lfa1   type lfa1.

      DATA: lo_migbp TYPE REF TO ZCL_MIGBP.

      lt_bdc = CONV #( gt_bdcdata[] ).

      CREATE OBJECT lo_migbp
        EXPORTING
          im_test    = abap_false
          im_tcode   = 'BP'
          it_bdcdata = lt_bdc.

      CALL METHOD lo_migbp->mt_bp_process_old_shdb(
        CHANGING
          ct_bdcmsg = lt_bdcmsg1 ).

      CALL METHOD lo_migbp->mt_bp_process_data( CHANGING ct_bdcmsg = lt_bdcmsg1 ).

      lt_bdcmsg = CONV #( lt_bdcmsg1[] ).

* <--- S4 Migration - 19/02/2024 – FV
