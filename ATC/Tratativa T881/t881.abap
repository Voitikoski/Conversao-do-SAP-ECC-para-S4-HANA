* ---> S4 Migration - 19/11/2024 - FV
*  SELECT SINGLE tab
*    INTO lv_tabname
*    FROM t881
*    WHERE rldnr = i_ledger.

  cl_fins_acdoc_util=>get_t881_emu(
  EXPORTING
    iv_rldnr            = i_ledger
  IMPORTING
    es_t881             = DATA(ls_t881)
  EXCEPTIONS
    not_found           = 1
    OTHERS              = 2
).
  IF ls_t881 IS NOT INITIAL.
    sy-subrc = 0.
  ELSE.
    sy-subrc = 4.
  ENDIF.

* <--- S4 Migration - 19/11/2024 - FV
