( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b168 - block
    b384 - block
    b698 - block
    b340 - block
    b180 - block
    b408 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b168 )
    ( on b384 b168 )
    ( on b698 b384 )
    ( on b340 b698 )
    ( on b180 b340 )
    ( on b408 b180 )
    ( clear b408 )
  )
  ( :goal
    ( and
      ( clear b168 )
    )
  )
)
