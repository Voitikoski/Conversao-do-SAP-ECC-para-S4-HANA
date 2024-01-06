* ---> S4 Migration - 05/01/2024 - FV
*    SELECT  segment
*      UP TO 1 ROWS
*    INTO e_postab-zzsegment
*    FROM bseg
*    WHERE bukrs = e_postab-bukrs
*    AND belnr = e_postab-belnr
*    AND gjahr = e_postab-gjahr
*    AND segment <> ''.
*    ENDSELECT.

DATA: lt_bseg TYPE fagl_t_bseg.

CALL FUNCTION 'FAGL_GET_BSEG'
  EXPORTING
    I_BUKRS                 = e_postab-bukrs
    I_BELNR                 = e_postab-belnr
    I_GJAHR                 = e_postab-gjahr

 IMPORTING
   ET_BSEG                 = lt_bseg
 EXCEPTIONS
   NOT_FOUND               = 1
   OTHERS                  = 2.

DELETE lt_bseg WHERE segment EQ ''.
READ TABLE lt_bseg INTO DATA(wa_bseg) index 1.
IF sy-subrc EQ 0.

e_postab-zzsegment = wa_bseg-segment.
ENDIF.

* <--- S4 Migration - 05/01/2024 – FV
