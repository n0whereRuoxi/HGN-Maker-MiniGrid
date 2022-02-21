( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b788 - block
    b472 - block
    b983 - block
    b494 - block
    b174 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b788 )
    ( on b472 b788 )
    ( on b983 b472 )
    ( on b494 b983 )
    ( on b174 b494 )
    ( clear b174 )
  )
  ( :goal
    ( and
      ( clear b788 )
    )
  )
)
