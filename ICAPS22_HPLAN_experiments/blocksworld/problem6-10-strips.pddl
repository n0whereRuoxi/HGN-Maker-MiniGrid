( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b197 - block
    b732 - block
    b659 - block
    b990 - block
    b497 - block
    b368 - block
    b325 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b197 )
    ( on b732 b197 )
    ( on b659 b732 )
    ( on b990 b659 )
    ( on b497 b990 )
    ( on b368 b497 )
    ( on b325 b368 )
    ( clear b325 )
  )
  ( :goal
    ( and
      ( clear b197 )
    )
  )
)
