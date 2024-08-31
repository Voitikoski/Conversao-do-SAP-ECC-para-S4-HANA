* ---> S4 Migration - 24/07/2024 - FV
*      FROM j_1bbranch
      FROM p_businessplace
* <--- S4 Migration - 24/07/2024 - FV


* ---> S4 Migration - 24/07/2024 - FV
*  DATA: ls_j_1bbranch TYPE j_1bbranch,
  DATA: ls_j_1bbranch TYPE p_businessplace,
* <--- S4 Migration - 24/07/2024 - FV

* ---> S4 Migration - 24/07/2024 - FV
*          SELECT SINGLE * FROM j_1bbranch WHERE bukrs  = t001-bukrs
*                                          AND branch = p_bupla-low.
          SELECT SINGLE * FROM p_businessplace INTO @DATA(ls_pbusinessplace)
            WHERE bukrs  = @t001-bukrs
              AND branch = @p_bupla-low.
* <--- S4 Migration - 24/07/2024 - FV
