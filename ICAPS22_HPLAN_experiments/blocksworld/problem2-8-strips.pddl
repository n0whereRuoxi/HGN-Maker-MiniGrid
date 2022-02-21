( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b733 - block
    b495 - block
    b205 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b733 )
    ( on b495 b733 )
    ( on b205 b495 )
    ( clear b205 )
  )
  ( :goal
    ( and
      ( clear b733 )
    )
  )
)
