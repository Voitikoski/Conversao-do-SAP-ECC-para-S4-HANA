* ---> S4 Migration - 04/05/2023 - FV
* SELECT * FROM bseg WHERE
* bukrs = bkpf-bukrs AND
* belnr = bkpf-belnr AND
* gjahr = bkpf-gjahr AND
* buzei <> space.
"Declara uma tabela interna com os types da tabela da bseg.
DATA: lt_bseg TYPE fagl_t_bseg.
"Chama a função colocando os campos do exporting tal como 
os do where dentro do select e a tabela interna criada como de saída.
CALL FUNCTION 'FAGL_GET_BSEG'
EXPORTING
i_bukrs = bkpf-bukrs
i_belnr = bkpf-belnr
i_gjahr = bkpf-gjahr
IMPORTING
et_bseg = lt_bseg
EXCEPTIONS
OTHERS = 2.
"Deleta os dados da tabela interna dos campos que não estão na função, 
escrevendo o oposto do que está na cláusula where.
DELETE lt_bseg WHERE buzei EQ space.
"Como nesse caso o SELECT não tem um INTO TABLE,
 os dados devem ser movidos para a bseg. 
 Desta forma deve ser feito um loop da tabela interna criada para a bseg.
LOOP at lt_bseg into bseg.
ENDLOOP.
* <--- S4 Migration - 04/05/2023 - FV
