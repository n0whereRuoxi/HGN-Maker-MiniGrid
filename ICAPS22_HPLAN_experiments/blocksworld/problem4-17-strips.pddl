( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b836 - block
    b442 - block
    b897 - block
    b322 - block
    b746 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b836 )
    ( on b442 b836 )
    ( on b897 b442 )
    ( on b322 b897 )
    ( on b746 b322 )
    ( clear b746 )
  )
  ( :goal
    ( and
      ( clear b836 )
    )
  )
)
