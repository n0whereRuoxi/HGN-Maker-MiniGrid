( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b136 - block
    b78 - block
    b390 - block
    b462 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b136 )
    ( on b78 b136 )
    ( on b390 b78 )
    ( on b462 b390 )
    ( clear b462 )
  )
  ( :goal
    ( and
      ( clear b136 )
    )
  )
)
