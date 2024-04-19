* ---> S4 Migration - 19/04/2024 - FV       
*        SELECT SINGLE werks
*        INTO lw_013-werks
*        FROM bseg
*        WHERE bukrs EQ t_contabil-bukrs
*        AND belnr EQ t_contabil-belnr
*        AND gjahr EQ t_contabil-gjahr
*        AND werks NE space.
        
DATA: lt_bseg TYPE fagl_t_bseg.
                
CALL FUNCTION 'FAGL_GET_BSEG'
  EXPORTING
    i_bukrs                 = t_contabil-bukrs
    i_belnr                 = t_contabil-belnr
    i_gjahr                 = t_contabil-gjahr

 IMPORTING
   ET_BSEG                 = lt_bseg
 EXCEPTIONS
   NOT_FOUND               = 1
   OTHERS                  = 2.
 
DELETE lt_bseg WHERE werks EQ ''.

READ TABLE lt_bseg INTO DATA(wa_bseg) index 1.

IF sy-subrc EQ 0.
 lw_013-werks = wa_bseg-werks.
ENDIF.          
* ---> S4 Migration - 19/04/2024 - FV 
