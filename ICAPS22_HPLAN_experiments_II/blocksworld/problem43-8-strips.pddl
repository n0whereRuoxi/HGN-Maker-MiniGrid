( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b962 - block
    b390 - block
    b853 - block
    b301 - block
    b94 - block
    b373 - block
    b100 - block
    b172 - block
    b75 - block
    b106 - block
    b699 - block
    b530 - block
    b327 - block
    b35 - block
    b318 - block
    b541 - block
    b179 - block
    b829 - block
    b503 - block
    b586 - block
    b269 - block
    b882 - block
    b505 - block
    b702 - block
    b289 - block
    b97 - block
    b650 - block
    b780 - block
    b251 - block
    b363 - block
    b563 - block
    b130 - block
    b414 - block
    b850 - block
    b160 - block
    b673 - block
    b820 - block
    b342 - block
    b973 - block
    b86 - block
    b810 - block
    b114 - block
    b857 - block
    b239 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b962 )
    ( on b390 b962 )
    ( on b853 b390 )
    ( on b301 b853 )
    ( on b94 b301 )
    ( on b373 b94 )
    ( on b100 b373 )
    ( on b172 b100 )
    ( on b75 b172 )
    ( on b106 b75 )
    ( on b699 b106 )
    ( on b530 b699 )
    ( on b327 b530 )
    ( on b35 b327 )
    ( on b318 b35 )
    ( on b541 b318 )
    ( on b179 b541 )
    ( on b829 b179 )
    ( on b503 b829 )
    ( on b586 b503 )
    ( on b269 b586 )
    ( on b882 b269 )
    ( on b505 b882 )
    ( on b702 b505 )
    ( on b289 b702 )
    ( on b97 b289 )
    ( on b650 b97 )
    ( on b780 b650 )
    ( on b251 b780 )
    ( on b363 b251 )
    ( on b563 b363 )
    ( on b130 b563 )
    ( on b414 b130 )
    ( on b850 b414 )
    ( on b160 b850 )
    ( on b673 b160 )
    ( on b820 b673 )
    ( on b342 b820 )
    ( on b973 b342 )
    ( on b86 b973 )
    ( on b810 b86 )
    ( on b114 b810 )
    ( on b857 b114 )
    ( on b239 b857 )
    ( clear b239 )
  )
  ( :goal
    ( and
      ( clear b962 )
    )
  )
)
