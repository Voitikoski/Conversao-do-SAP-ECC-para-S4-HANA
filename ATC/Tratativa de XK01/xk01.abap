* ---> S4 Migration - 19/02/2024 - FV
*  CALL TRANSACTION 'XK01'  USING TI_BDCDATA
*                         MESSAGES INTO TI_MESSAGE
*                         MODE   'E'
*                         UPDATE 'S'.

      DATA: lt_bdc    TYPE bdcdata_tab,
            lt_bdcmsg1 TYPE tab_bdcmsgcoll,
            wa_lfa1   type lfa1.

      DATA: lo_migbp TYPE REF TO ZCL_MIGBP.

      lt_bdc = CONV #( TI_BDCDATA[] ).

      CREATE OBJECT lo_migbp
        EXPORTING
          im_test    = abap_false
          im_tcode   = 'BP'
          it_bdcdata = lt_bdc.

      CALL METHOD lo_migbp->mt_bp_process_old_shdb(
        CHANGING
          ct_bdcmsg = lt_bdcmsg1 ).

      CALL METHOD lo_migbp->mt_bp_process_data( CHANGING ct_bdcmsg = lt_bdcmsg1 ).

      TI_MESSAGE[] = CONV #( lt_bdcmsg1[] ).

* <--- S4 Migration - 19/02/2024 – FV
