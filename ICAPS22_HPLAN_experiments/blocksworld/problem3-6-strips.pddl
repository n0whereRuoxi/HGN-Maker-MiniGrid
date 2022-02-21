( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b84 - block
    b760 - block
    b935 - block
    b988 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b84 )
    ( on b760 b84 )
    ( on b935 b760 )
    ( on b988 b935 )
    ( clear b988 )
  )
  ( :goal
    ( and
      ( clear b84 )
    )
  )
)
