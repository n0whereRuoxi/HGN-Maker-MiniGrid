( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b18 - block
    b581 - block
    b155 - block
    b907 - block
    b750 - block
    b500 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b18 )
    ( on b581 b18 )
    ( on b155 b581 )
    ( on b907 b155 )
    ( on b750 b907 )
    ( on b500 b750 )
    ( clear b500 )
  )
  ( :goal
    ( and
      ( clear b18 )
    )
  )
)
