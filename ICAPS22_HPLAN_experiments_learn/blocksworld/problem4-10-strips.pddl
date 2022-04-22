( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b36 - block
    b268 - block
    b931 - block
    b864 - block
    b464 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b36 )
    ( on b268 b36 )
    ( on b931 b268 )
    ( on b864 b931 )
    ( on b464 b864 )
    ( clear b464 )
  )
  ( :goal
    ( and
      ( clear b36 )
    )
  )
)
