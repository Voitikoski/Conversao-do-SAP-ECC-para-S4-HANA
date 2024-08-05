* ---> S4 Migration -05.08.2024 15:19:56 - FV
*  SET PARAMETER ID 'KKB' FIELD hide-kkber.
*  SET PARAMETER ID 'KUN' FIELD hide-konto.
** HIDE-KUNNR ist evtl. kein Kreditkonto -> Kreditübersicht leer
*  CALL TRANSACTION 'F.31'.

  DATA: e_partner TYPE  but000-partner,
        e_sgmnt   TYPE  ukmbp_cms_sgm-credit_sgmnt.

  e_partner = hide-konto.
  e_sgmnt   = hide-kkber.

  CALL FUNCTION 'ZFSD_F31_TO_UKM_BP_DISPLAY'
    EXPORTING
      i_partner = e_partner
      i_sgmnt   = e_sgmnt.
* <--- S4 Migration -05.08.2024 15:19:56 - FV
