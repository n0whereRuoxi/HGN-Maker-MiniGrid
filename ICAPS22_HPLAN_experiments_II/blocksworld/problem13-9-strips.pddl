( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b422 - block
    b543 - block
    b69 - block
    b252 - block
    b390 - block
    b981 - block
    b677 - block
    b795 - block
    b555 - block
    b419 - block
    b381 - block
    b514 - block
    b699 - block
    b922 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b422 )
    ( on b543 b422 )
    ( on b69 b543 )
    ( on b252 b69 )
    ( on b390 b252 )
    ( on b981 b390 )
    ( on b677 b981 )
    ( on b795 b677 )
    ( on b555 b795 )
    ( on b419 b555 )
    ( on b381 b419 )
    ( on b514 b381 )
    ( on b699 b514 )
    ( on b922 b699 )
    ( clear b922 )
  )
  ( :goal
    ( and
      ( clear b422 )
    )
  )
)
