* ---> S4 Migration -05.08.2024 15:05:40 - AG
*  SET PARAMETER ID 'KKB' FIELD hide-kkber.
*  SET PARAMETER ID 'KUN' FIELD hide-kunnr.
*  CALL TRANSACTION 'F.35' AND SKIP FIRST SCREEN.

  DATA: e_partner TYPE  but000-partner,
        e_sgmnt   TYPE  ukmbp_cms_sgm-credit_sgmnt.

  e_partner = hide-kunnr.
  e_sgmnt   = hide-kkber.

  CALL FUNCTION 'ZFSD_F31_TO_UKM_BP_DISPLAY'
    EXPORTING
      i_partner = e_partner
      i_sgmnt   = e_sgmnt.
* <--- S4 Migration -05.08.2024 15:05:40 - AG
