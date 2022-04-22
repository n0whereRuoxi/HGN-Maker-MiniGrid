( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b957 - block
    b323 - block
    b920 - block
    b40 - block
    b693 - block
    b841 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b957 )
    ( on b323 b957 )
    ( on b920 b323 )
    ( on b40 b920 )
    ( on b693 b40 )
    ( on b841 b693 )
    ( clear b841 )
  )
  ( :goal
    ( and
      ( clear b957 )
    )
  )
)
