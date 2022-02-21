( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b368 - block
    b554 - block
    b930 - block
    b293 - block
    b731 - block
    b818 - block
    b945 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b368 )
    ( on b554 b368 )
    ( on b930 b554 )
    ( on b293 b930 )
    ( on b731 b293 )
    ( on b818 b731 )
    ( on b945 b818 )
    ( clear b945 )
  )
  ( :goal
    ( and
      ( clear b368 )
    )
  )
)
