( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b888 - block
    b263 - block
    b941 - block
    b106 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b888 )
    ( on b263 b888 )
    ( on b941 b263 )
    ( on b106 b941 )
    ( clear b106 )
  )
  ( :goal
    ( and
      ( clear b888 )
    )
  )
)
