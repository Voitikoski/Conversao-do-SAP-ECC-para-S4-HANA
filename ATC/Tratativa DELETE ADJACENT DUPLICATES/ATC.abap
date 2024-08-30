*---> 30.08.2024  - Migração S4 – FV
        SORT t_bsid BY belnr.
*<--- 30.08.2024 - Migração S4 – FV        
        DELETE ADJACENT DUPLICATES FROM t_bsid COMPARING belnr.
