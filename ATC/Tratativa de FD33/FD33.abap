* ---> S4 Migration - 16/02/2024 - FV
*     CALL TRANSACTION 'FD33' AND SKIP FIRST SCREEN.


      SET PARAMETER ID 'UKM_SEGMENT' FIELD  w_kkber.

      DATA(lo_request) = NEW cl_bupa_navigation_request( ).
      lo_request->set_partner_number( w_kunnr ).

      lo_request->set_bupa_activity( '03' ). " 01 - Create, 02 - Change, 03 - Display
      lo_request->set_maintenance_id( 'B' ). " B - Partner

      DATA(lo_options) = NEW cl_bupa_dialog_joel_options( ).

      lo_options->set_locator_visible( space ).

      CALL METHOD cl_bupa_dialog_joel=>start_with_navigation
        EXPORTING
          iv_request              = lo_request
          iv_options              = lo_options
          iv_in_new_internal_mode = abap_true
        EXCEPTIONS
          already_started         = 1
          not_allowed             = 2
          OTHERS                  = 3.
* <--- S4 Migration - 16/02/2024 – FV
