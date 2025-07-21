*>>> MIG-NOW S/4 MIGRATION - START OF DELETION 
*  CALL FUNCTION 'ERP_WEC_GET_USER_DETAIL'
*    EXPORTING
*      username  = sy-uname
*    IMPORTING
*      logondata = w_logon.
*<<< MIG-NOW S/4 MIGRATION - END OF DELETION
*>>> MIG-NOW S/4 MIGRATION - START OF INSERTION 
  DATA lt_return TYPE TABLE OF bapiret2.
  CALL FUNCTION 'BAPI_USER_GET_DETAIL'
    EXPORTING
      username  = sy-uname
    IMPORTING
      logondata = w_logon
    TABLES
      return    = lt_return.
*<<< MIG-NOW S/4 MIGRATION - END OF INSERTION
