( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b97 - block
    b749 - block
    b521 - block
    b703 - block
    b432 - block
    b546 - block
    b504 - block
    b715 - block
    b291 - block
    b943 - block
    b329 - block
    b919 - block
    b71 - block
    b609 - block
    b370 - block
    b643 - block
    b9 - block
    b668 - block
    b957 - block
    b462 - block
    b915 - block
    b742 - block
    b276 - block
    b530 - block
    b448 - block
    b946 - block
    b110 - block
    b438 - block
    b942 - block
    b813 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b97 )
    ( on b749 b97 )
    ( on b521 b749 )
    ( on b703 b521 )
    ( on b432 b703 )
    ( on b546 b432 )
    ( on b504 b546 )
    ( on b715 b504 )
    ( on b291 b715 )
    ( on b943 b291 )
    ( on b329 b943 )
    ( on b919 b329 )
    ( on b71 b919 )
    ( on b609 b71 )
    ( on b370 b609 )
    ( on b643 b370 )
    ( on b9 b643 )
    ( on b668 b9 )
    ( on b957 b668 )
    ( on b462 b957 )
    ( on b915 b462 )
    ( on b742 b915 )
    ( on b276 b742 )
    ( on b530 b276 )
    ( on b448 b530 )
    ( on b946 b448 )
    ( on b110 b946 )
    ( on b438 b110 )
    ( on b942 b438 )
    ( on b813 b942 )
    ( clear b813 )
  )
  ( :goal
    ( and
      ( clear b97 )
    )
  )
)
