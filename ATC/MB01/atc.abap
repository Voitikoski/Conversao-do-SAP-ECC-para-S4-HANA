* ---> S4 Migration - 11/12/2024 - MA

*  call transaction 'MB01'
*       using bdc_data
*       mode w_modo
*       update 'S'
*       messages into messtab.

  data: it_bdc type bdcdata_tab,
        it_msg type ztt_bdcmsgcoll.

  it_bdc[] = conv #( bdc_data[] ).

  call function 'ZFM_GOODMVT_MATERIAL'
    exporting
      im_tcode    = 'MB01'
      it_bdcdata  = it_bdc[]
    importing
      it_messages = it_msg[].

  messtab[] = conv #( it_msg[] ).

* <--- S4 Migration - 11/12/2024 - MA
