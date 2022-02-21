( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b504 - block
    b162 - block
    b370 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b504 )
    ( on b162 b504 )
    ( on b370 b162 )
    ( clear b370 )
  )
  ( :goal
    ( and
      ( clear b504 )
    )
  )
)
