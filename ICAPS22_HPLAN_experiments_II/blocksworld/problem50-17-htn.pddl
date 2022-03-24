( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b800 - block
    b948 - block
    b443 - block
    b722 - block
    b916 - block
    b300 - block
    b586 - block
    b352 - block
    b581 - block
    b988 - block
    b679 - block
    b146 - block
    b699 - block
    b458 - block
    b305 - block
    b269 - block
    b994 - block
    b500 - block
    b751 - block
    b101 - block
    b320 - block
    b199 - block
    b470 - block
    b106 - block
    b482 - block
    b696 - block
    b268 - block
    b118 - block
    b506 - block
    b875 - block
    b649 - block
    b532 - block
    b110 - block
    b488 - block
    b137 - block
    b662 - block
    b297 - block
    b114 - block
    b920 - block
    b854 - block
    b148 - block
    b886 - block
    b550 - block
    b737 - block
    b923 - block
    b372 - block
    b169 - block
    b764 - block
    b902 - block
    b241 - block
    b136 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b800 )
    ( on b948 b800 )
    ( on b443 b948 )
    ( on b722 b443 )
    ( on b916 b722 )
    ( on b300 b916 )
    ( on b586 b300 )
    ( on b352 b586 )
    ( on b581 b352 )
    ( on b988 b581 )
    ( on b679 b988 )
    ( on b146 b679 )
    ( on b699 b146 )
    ( on b458 b699 )
    ( on b305 b458 )
    ( on b269 b305 )
    ( on b994 b269 )
    ( on b500 b994 )
    ( on b751 b500 )
    ( on b101 b751 )
    ( on b320 b101 )
    ( on b199 b320 )
    ( on b470 b199 )
    ( on b106 b470 )
    ( on b482 b106 )
    ( on b696 b482 )
    ( on b268 b696 )
    ( on b118 b268 )
    ( on b506 b118 )
    ( on b875 b506 )
    ( on b649 b875 )
    ( on b532 b649 )
    ( on b110 b532 )
    ( on b488 b110 )
    ( on b137 b488 )
    ( on b662 b137 )
    ( on b297 b662 )
    ( on b114 b297 )
    ( on b920 b114 )
    ( on b854 b920 )
    ( on b148 b854 )
    ( on b886 b148 )
    ( on b550 b886 )
    ( on b737 b550 )
    ( on b923 b737 )
    ( on b372 b923 )
    ( on b169 b372 )
    ( on b764 b169 )
    ( on b902 b764 )
    ( on b241 b902 )
    ( on b136 b241 )
    ( clear b136 )
  )
  ( :tasks
    ( Make-50Pile b948 b443 b722 b916 b300 b586 b352 b581 b988 b679 b146 b699 b458 b305 b269 b994 b500 b751 b101 b320 b199 b470 b106 b482 b696 b268 b118 b506 b875 b649 b532 b110 b488 b137 b662 b297 b114 b920 b854 b148 b886 b550 b737 b923 b372 b169 b764 b902 b241 b136 )
  )
)
