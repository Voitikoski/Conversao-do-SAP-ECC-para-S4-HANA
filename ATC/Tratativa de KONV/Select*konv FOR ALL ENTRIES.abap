*<--- 18/12/2023 - Migração S4 - FV
*      SELECT *
*        FROM konv
*        INTO TABLE t_konv
*        FOR ALL ENTRIES IN t_selk
*        WHERE knumv EQ t_selk-knumv AND
*              kposn EQ t_selk-kposn .

      SELECT *
        FROM v_konv
        INTO TABLE @DATA(t_konv_aux)
        FOR ALL ENTRIES IN @t_selk
        WHERE knumv EQ @t_selk-knumv AND
              kposn EQ @t_selk-kposn .

        MOVE-CORRESPONDING t_konv_aux[] TO t_konv[].

*<--- 18/12/2023 - Migração S4 – FV
