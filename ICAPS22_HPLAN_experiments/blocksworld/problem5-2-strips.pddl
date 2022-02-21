( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b34 - block
    b996 - block
    b606 - block
    b731 - block
    b346 - block
    b402 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b34 )
    ( on b996 b34 )
    ( on b606 b996 )
    ( on b731 b606 )
    ( on b346 b731 )
    ( on b402 b346 )
    ( clear b402 )
  )
  ( :goal
    ( and
      ( clear b34 )
    )
  )
)
