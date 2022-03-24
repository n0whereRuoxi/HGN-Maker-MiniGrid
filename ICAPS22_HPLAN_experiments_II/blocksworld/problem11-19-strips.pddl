( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b625 - block
    b385 - block
    b47 - block
    b730 - block
    b258 - block
    b57 - block
    b783 - block
    b430 - block
    b964 - block
    b795 - block
    b327 - block
    b5 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b625 )
    ( on b385 b625 )
    ( on b47 b385 )
    ( on b730 b47 )
    ( on b258 b730 )
    ( on b57 b258 )
    ( on b783 b57 )
    ( on b430 b783 )
    ( on b964 b430 )
    ( on b795 b964 )
    ( on b327 b795 )
    ( on b5 b327 )
    ( clear b5 )
  )
  ( :goal
    ( and
      ( clear b625 )
    )
  )
)
