( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b36 - block
    b275 - block
    b404 - block
    b976 - block
    b767 - block
    b141 - block
    b338 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b36 )
    ( on b275 b36 )
    ( on b404 b275 )
    ( on b976 b404 )
    ( on b767 b976 )
    ( on b141 b767 )
    ( on b338 b141 )
    ( clear b338 )
  )
  ( :goal
    ( and
      ( clear b36 )
    )
  )
)
