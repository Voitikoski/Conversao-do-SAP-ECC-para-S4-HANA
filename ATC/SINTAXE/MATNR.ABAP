ERRO DE SINTAXE MATNR40 E MATERIAL 18
Entrar na pocomponents:  POCOMPONENTS like BAPIMEPOCOMPONENT
Entrar na BAPIMEPOCOMPONENT procurar se temos material_long ASSIM PODEMOS SUBSTITUIR O MATERIAL POR MATERIAL_LONG 18 POR 40


* ---> S4 Migration - 02/01/2025 - FV
*    select matnr mtart
*      from mara
*      into table it_mara_comp
*       for all entries in pocomponents
*     where matnr eq pocomponents-material.

    select matnr mtart
      from mara
      into table it_mara_comp
       for all entries in pocomponents
     where matnr eq pocomponents-material_long.
* <--- S4 Migration - 02/01/2025 - FV
