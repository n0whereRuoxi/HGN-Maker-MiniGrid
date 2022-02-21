( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b347 - block
    b775 - block
    b580 - block
    b643 - block
    b988 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b347 )
    ( on b775 b347 )
    ( on b580 b775 )
    ( on b643 b580 )
    ( on b988 b643 )
    ( clear b988 )
  )
  ( :goal
    ( and
      ( clear b347 )
    )
  )
)
