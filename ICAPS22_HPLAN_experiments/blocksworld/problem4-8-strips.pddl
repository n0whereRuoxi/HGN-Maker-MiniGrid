( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b450 - block
    b912 - block
    b379 - block
    b628 - block
    b574 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b450 )
    ( on b912 b450 )
    ( on b379 b912 )
    ( on b628 b379 )
    ( on b574 b628 )
    ( clear b574 )
  )
  ( :goal
    ( and
      ( clear b450 )
    )
  )
)
