* ---> S4 Migration - 18/07/2024 - FV          
*          SELECT kwert kbetr
*              UP TO 1 ROWS
*            FROM konv
*            INTO (xkwert, xkomv-kbetr)
*           WHERE knumv = lv_knumv
*             AND kposn = komp-kposn
*             AND kappl = 'V'
*             AND kschl = 'YLFC'.
*          ENDSELECT.
          
          SELECT kwert kbetr
              UP TO 1 ROWS
            FROM v_konv_cds
            INTO (xkwert, xkomv-kbetr)
           WHERE knumv = lv_knumv
             AND kposn = komp-kposn
             AND kappl = 'V'
             AND kschl = 'YLFC'.
          ENDSELECT.          
 
* <--- S4 Migration - 18/07/2024 – FV
