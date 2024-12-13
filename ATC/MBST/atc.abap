*---> 12.12.2024 10:00:27 - Migration S4 – BM
*            call transaction 'MBST'
*                 using bdc_data
*                 mode w_modo
*                 update 'S'
*                 messages into messtab.
            call function 'ZFM_GOODMVT_MATERIAL'
              exporting
                im_tcode    = 'MBST'
                it_bdcdata  = bdc_data
                im_cancel   = 'X'
              importing
                it_messages = messtab.
*<--- 12.12.2024 10:00:27 - Migration S4 – BM
