( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b570 - block
    b63 - block
    b646 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b570 )
    ( on b63 b570 )
    ( on b646 b63 )
    ( clear b646 )
  )
  ( :goal
    ( and
      ( clear b570 )
    )
  )
)
