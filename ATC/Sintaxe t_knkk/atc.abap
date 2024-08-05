Erro de sintaxe:
The type of the database table and work area (or internal table) "T_KNKK" are not Unicode convertible


      SELECT *
*---> MIG-NOW AUTOMATION - S4 MIGRATION – BEGIN
      "FROM knkk
      FROM zcdscm_cred
*<--- MIG-NOW AUTOMATION - S4 MIGRATION – END

* ---> S4 Migration - 02/08/2024 - FV        
*      INTO TABLE t_knkk
      INTO CORRESPONDING FIELDS OF TABLE t_knkk
*<--- S4 Migration - 02/08/2024 - FV 

      FOR ALL ENTRIES IN t_kna1
      WHERE kunnr EQ t_kna1-kunnr AND
      kkber EQ c_kkber AND
      knkli IN s_knkli AND
      ctlpc IN s_ctlpc AND
      nxtrv IN s_nxtrv AND
      klimk IN s_klimk.
