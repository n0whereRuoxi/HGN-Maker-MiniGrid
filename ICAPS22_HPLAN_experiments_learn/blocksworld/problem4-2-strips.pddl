( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b193 - block
    b657 - block
    b593 - block
    b435 - block
    b217 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b193 )
    ( on b657 b193 )
    ( on b593 b657 )
    ( on b435 b593 )
    ( on b217 b435 )
    ( clear b217 )
  )
  ( :goal
    ( and
      ( clear b193 )
    )
  )
)
