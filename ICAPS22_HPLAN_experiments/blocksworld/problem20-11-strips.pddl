( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b711 - block
    b767 - block
    b158 - block
    b379 - block
    b118 - block
    b556 - block
    b502 - block
    b259 - block
    b945 - block
    b170 - block
    b476 - block
    b642 - block
    b398 - block
    b913 - block
    b345 - block
    b843 - block
    b309 - block
    b238 - block
    b11 - block
    b47 - block
    b390 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b711 )
    ( on b767 b711 )
    ( on b158 b767 )
    ( on b379 b158 )
    ( on b118 b379 )
    ( on b556 b118 )
    ( on b502 b556 )
    ( on b259 b502 )
    ( on b945 b259 )
    ( on b170 b945 )
    ( on b476 b170 )
    ( on b642 b476 )
    ( on b398 b642 )
    ( on b913 b398 )
    ( on b345 b913 )
    ( on b843 b345 )
    ( on b309 b843 )
    ( on b238 b309 )
    ( on b11 b238 )
    ( on b47 b11 )
    ( on b390 b47 )
    ( clear b390 )
  )
  ( :goal
    ( and
      ( clear b711 )
    )
  )
)
