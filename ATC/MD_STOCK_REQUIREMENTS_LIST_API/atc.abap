* ---> S4 Migration – 21/06/2024 - PV
*    CALL FUNCTION 'MD_STOCK_REQUIREMENTS_LIST_API'
*      EXPORTING
*        matnr                    = <fl_lips>-matnr
*        werks                    = <fl_lips>-werks
*        ergbz                    = 'SAP00002'
*      TABLES
*        mdezx                    = tl_mdezx
*      EXCEPTIONS
*        material_plant_not_found = 1
*        plant_not_found          = 2
*        OTHERS                   = 3.

    DATA: ls_mdlv TYPE mdlv.

     CALL FUNCTION 'MD_MRP_AREA_GET' "#EC CI_USAGE_OK[2227532]
       EXPORTING
         i_matnr          = <fl_lips>-matnr
         i_werks          = <fl_lips>-werks
       IMPORTING
         e_db_mdlv        = ls_mdlv
       EXCEPTIONS
         wrong_parameters = 1
         OTHERS           = 2.

    CALL FUNCTION 'MD_STOCK_REQUIREMENTS_LIST_API'
      "#EC CI_USAGE_OK[3211383]
      "#EC CI_USAGE_OK[2227532]
      "#EC CI_USAGE_OK[2227579]
      EXPORTING
        matnr                    = <fl_lips>-matnr
        werks                    = <fl_lips>-werks
        ergbz                    = 'SAP00002'
        berid                    = ls_mdlv-berid
      TABLES
        mdezx                    = tl_mdezx
      EXCEPTIONS
        material_plant_not_found = 1
        plant_not_found          = 2
        OTHERS                   = 3.
* <--- S4 Migration - 21/06/2024 – PV





* ---> S4 Migration - 24.06.2024 11:25:41 - AZ
*      CALL FUNCTION 'MD_STOCK_REQUIREMENTS_LIST_API'  "#EC CI_USAGE_OK[3211383]
*        EXPORTING
*          matnr                    = <lfs_mara>-matnr
*          werks                    = <lfs_mara>-werks
*        TABLES
*          mdezx                    = lt_mdez
*        EXCEPTIONS
*          material_plant_not_found = 1
*          plant_not_found          = 2
*          OTHERS                   = 3.

      DATA: ls_mdlv TYPE mdlv.

      CALL FUNCTION 'MD_MRP_AREA_GET'  "#EC CI_USAGE_OK[2227532]
        EXPORTING
          i_matnr          = <lfs_mara>-matnr
          i_werks          = <lfs_mara>-werks
        IMPORTING
          e_db_mdlv        = ls_mdlv
        EXCEPTIONS
          wrong_parameters = 1
          OTHERS           = 2.

      CALL FUNCTION 'MD_STOCK_REQUIREMENTS_LIST_API' "#EC CI_USAGE_OK[2227532]
        EXPORTING "#EC CI_USAGE_OK[2227579]
          matnr                    = <lfs_mara>-matnr "#EC CI_USAGE_OK[3211383]
          werks                    = <lfs_mara>-werks
        TABLES
          mdezx                    = lt_mdez
        EXCEPTIONS
          material_plant_not_found = 1
          plant_not_found          = 2
          OTHERS                   = 3.
* <--- S4 Migration - 24.06.2024 11:25:47 - AZ


