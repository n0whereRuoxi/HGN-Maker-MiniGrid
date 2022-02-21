( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b112 - block
    b386 - block
    b438 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b112 )
    ( on b386 b112 )
    ( on b438 b386 )
    ( clear b438 )
  )
  ( :goal
    ( and
      ( clear b112 )
    )
  )
)
