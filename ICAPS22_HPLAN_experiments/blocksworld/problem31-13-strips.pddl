( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b543 - block
    b111 - block
    b915 - block
    b488 - block
    b343 - block
    b169 - block
    b309 - block
    b367 - block
    b956 - block
    b282 - block
    b311 - block
    b86 - block
    b486 - block
    b615 - block
    b704 - block
    b517 - block
    b869 - block
    b112 - block
    b975 - block
    b711 - block
    b17 - block
    b754 - block
    b929 - block
    b327 - block
    b399 - block
    b802 - block
    b604 - block
    b133 - block
    b35 - block
    b62 - block
    b412 - block
    b356 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b543 )
    ( on b111 b543 )
    ( on b915 b111 )
    ( on b488 b915 )
    ( on b343 b488 )
    ( on b169 b343 )
    ( on b309 b169 )
    ( on b367 b309 )
    ( on b956 b367 )
    ( on b282 b956 )
    ( on b311 b282 )
    ( on b86 b311 )
    ( on b486 b86 )
    ( on b615 b486 )
    ( on b704 b615 )
    ( on b517 b704 )
    ( on b869 b517 )
    ( on b112 b869 )
    ( on b975 b112 )
    ( on b711 b975 )
    ( on b17 b711 )
    ( on b754 b17 )
    ( on b929 b754 )
    ( on b327 b929 )
    ( on b399 b327 )
    ( on b802 b399 )
    ( on b604 b802 )
    ( on b133 b604 )
    ( on b35 b133 )
    ( on b62 b35 )
    ( on b412 b62 )
    ( on b356 b412 )
    ( clear b356 )
  )
  ( :goal
    ( and
      ( clear b543 )
    )
  )
)
