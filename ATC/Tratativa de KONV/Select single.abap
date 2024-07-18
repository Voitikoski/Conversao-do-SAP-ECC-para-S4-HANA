* ---> S4 Migration - 18/07/2024 - FV
*          SELECT SINGLE kwert INTO xkwert
*            FROM konv
*            WHERE knumv = vl_knumv
*              AND kposn = komp-vgpos
*              AND kschl = 'ICMI'.

          SELECT SINGLE kwert INTO xkwert
            FROM v_konv_cds
            WHERE knumv = vl_knumv
              AND kposn = komp-vgpos
              AND kschl = 'ICMI'.

* <--- S4 Migration - 18/07/2024 – FV
