* ---> S4 Migration - 02/04/2024 - FV
*        SELECT kwert UP TO 1 ROWS
*          INTO @DATA(ln_vr_inss_parc)
*          FROM konv
*         WHERE knumv = @lc_knumv
*           AND kappl = @gc_sd
*           AND kschl = @gc_inss.
*        ENDSELECT.

        SELECT kwert UP TO 1 ROWS
          INTO @DATA(ln_vr_inss_parc)
          FROM v_konv_cds
         WHERE knumv = @lc_knumv
           AND kappl = @gc_sd
           AND kschl = @gc_inss.
        ENDSELECT.

* <--- S4 Migration - 02/04/2024 – FV
