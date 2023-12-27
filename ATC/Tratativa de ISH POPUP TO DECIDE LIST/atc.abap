* ---> S4 Migration - 23/11/2023 - FV
*      CALL FUNCTION 'ISH_POPUP_TO_DECIDE_LIST'
*        EXPORTING
*          show_row    = 10
*          textline1   = l_line1
*          textline2   = l_line2
*          textline3   = ''
*          titel       = 'Remessas pendentes'(002)
*          coltitle    = 'Remessa'(003)
*        TABLES
*          im_ex_liste = l_t_list
*        EXCEPTIONS
*          no_entries  = 1
*          OTHERS      = 2.
*      IF sy-subrc <> 0.
*        REFRESH: l_t_list.
*      ENDIF.
*      l_error = abap_true.
*    ENDIF.
*  ENDIF.

 CALL FUNCTION 'POPUP_TO_DECIDE_LIST'
   EXPORTING
    CURSORLINE               = 1
    MARK_FLAG                = ' '
    MARK_MAX                 = 1
    START_COL                = 10
    START_ROW                = 10
     textline1                = l_line1
    TEXTLINE2                = l_line2
    TEXTLINE3                = ' '
     titel                    = 'Remessas pendentes'(002)
    DISPLAY_ONLY             = ' '
*  IMPORTING
*    ANSWER                   =
   TABLES
     t_spopli                 = l_t_list
  EXCEPTIONS
    NOT_ENOUGH_ANSWERS       = 1
    TOO_MUCH_ANSWERS         = 2
    TOO_MUCH_MARKS           = 3
    OTHERS                   = 4.

      IF sy-subrc <> 0.
        REFRESH: l_t_list.
      ENDIF.
      l_error = abap_true.
    ENDIF.
  ENDIF.

* <--- S4 Migration - 23/11/2023 – FV

**********************************************************************************************************************

* ---> S4 Migration - 23/11/2023 - FV

*      CALL FUNCTION 'ISH_POPUP_TO_DECIDE_LIST'
*        EXPORTING
*          show_row    = 10
*          textline1   = l_line1
*          textline2   = l_line2
*          textline3   = ''
*          titel       = 'Remessas pendentes'(002)
*          coltitle    = 'Remessa'(003)
*        TABLES
*          im_ex_liste = l_t_list
*        EXCEPTIONS
*          no_entries  = 1
*          OTHERS      = 2.
*      IF sy-subrc <> 0.
*        REFRESH: l_t_list.
*      ENDIF.
*      l_error = abap_true.
*    ENDIF.
*  ENDIF.


  CALL FUNCTION 'POPUP_TO_DECIDE_LIST'
    EXPORTING
     CURSORLINE               = 1
     MARK_FLAG                = ' '
     MARK_MAX                 = 1
     START_COL                = 10
     START_ROW                = 10
      textline1                = l_line1
     TEXTLINE2                = l_line2
     TEXTLINE3                = ' '
      titel                    = 'Remessas pendentes'(002)
     DISPLAY_ONLY             = ' '
*   IMPORTING
*     ANSWER                   =
    TABLES
      t_spopli                 = l_t_list
   EXCEPTIONS
     NOT_ENOUGH_ANSWERS       = 1
     TOO_MUCH_ANSWERS         = 2
     TOO_MUCH_MARKS           = 3
     OTHERS                   = 4.

      IF sy-subrc <> 0.
       REFRESH: l_t_list.
      ENDIF.
      l_error = abap_true.
    ENDIF.
  ENDIF.

* <--- S4 Migration - 23/11/2023 – FV

**********************************************************************************************************************

* ---> S4 Migration - 23/11/2023 - FV

*    CALL FUNCTION 'ISH_POPUP_TO_DECIDE_LIST'
*      EXPORTING
*        show_row    = 10
*        textline1   = l_line1
*        textline2   = l_line2
*        textline3   = ''
*        titel       = 'Remessas pendentes'(002)
*        coltitle    = 'Remessa'(003)
*      TABLES
*        im_ex_liste = l_t_list_mat
*      EXCEPTIONS
*        no_entries  = 1
*        OTHERS      = 2.
*    IF sy-subrc <> 0.
*      REFRESH: l_t_list.
*    ENDIF.
*    l_error = abap_true.
*  ENDIF.

CALL FUNCTION 'POPUP_TO_DECIDE_LIST'
  EXPORTING
   CURSORLINE               = 1
   MARK_FLAG                = ' '
   MARK_MAX                 = 1
   START_COL                = 10
   START_ROW                = 10
    textline1                = l_line1
   TEXTLINE2                = l_line2
   TEXTLINE3                = ' '
    titel                    = 'Remessas pendentes'(002)
   DISPLAY_ONLY             = ' '
* IMPORTING
*   ANSWER                   =
  TABLES
    t_spopli                 = l_t_list_mat
 EXCEPTIONS
   NOT_ENOUGH_ANSWERS       = 1
   TOO_MUCH_ANSWERS         = 2
   TOO_MUCH_MARKS           = 3
   OTHERS                   = 4.

    IF sy-subrc <> 0.
      REFRESH: l_t_list.
    ENDIF.
    l_error = abap_true.
  ENDIF.


* <--- S4 Migration - 23/11/2023 – FV

**********************************************************************************************************************

* ---> S4 Migration - 01/11/2023 - FV
*      CALL FUNCTION 'ISH_POPUP_TO_DECIDE_LIST'
*        EXPORTING
*          show_row    = 10
*          textline1   = l_line1
*          textline2   = l_line2
*          textline3   = ''
*          titel       = 'Remessas pendentes'(002)
*          coltitle    = 'Remessa'(003)
*        TABLES
*          im_ex_liste = l_t_list_fat
*        EXCEPTIONS
*          no_entries  = 1
*          OTHERS      = 2.
*      IF sy-subrc <> 0.
*        REFRESH: l_t_list.
*      ENDIF.
*      l_error = abap_true.
*    ENDIF.
*
*    IF l_error = abap_true.
*      "O processamento foi cancelado
*      MESSAGE e610(0d).
*    ENDIF.


      CALL FUNCTION 'POPUP_TO_DECIDE_LIST'
        EXPORTING
          cursorline         = 1
          mark_flag          = ' '
          mark_max           = 1
          start_col          = 10
          start_row          = 10
          textline1          = l_line1
          textline2          = l_line2
          textline3          = ' '
          titel              = 'Remessas pendentes'(002)
          display_only       = ' '
* IMPORTING
*         ANSWER             =
        TABLES
          t_spopli           = l_t_list_fat
        EXCEPTIONS
          not_enough_answers = 1
          too_much_answers   = 2
          too_much_marks     = 3
          OTHERS             = 4.
      IF sy-subrc <> 0.
        REFRESH: l_t_list.
      ENDIF.
      l_error = abap_true.

    ENDIF.

* <--- S4 Migration - 01/11/2023 – FV

