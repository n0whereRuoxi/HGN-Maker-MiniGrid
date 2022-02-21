( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b987 - block
    b622 - block
    b721 - block
    b72 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b987 )
    ( on b622 b987 )
    ( on b721 b622 )
    ( on b72 b721 )
    ( clear b72 )
  )
  ( :goal
    ( and
      ( clear b987 )
    )
  )
)
