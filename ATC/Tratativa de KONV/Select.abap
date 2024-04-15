* ---> S4 Migration - 15/04/2024 - FV
*      SELECT knumv kwert
*        FROM konv
*        INTO TABLE gt_konv
*        WHERE knumv EQ lv_knumv
*          AND kschl IN r_kschl.
        
      SELECT knumv, kwert
        FROM v_konv
        INTO TABLE @DATA(lt_konv)
        WHERE knumv EQ @lv_knumv
          AND kschl IN @r_kschl.        
        move-corresponding lt_konv[] to gt_konv[].
 
* <--- S4 Migration - 15/04/2024 – FV
