( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b16 - block
    b36 - block
    b993 - block
    b158 - block
    b375 - block
    b871 - block
    b481 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b16 )
    ( on b36 b16 )
    ( on b993 b36 )
    ( on b158 b993 )
    ( on b375 b158 )
    ( on b871 b375 )
    ( on b481 b871 )
    ( clear b481 )
  )
  ( :goal
    ( and
      ( clear b16 )
    )
  )
)
