( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b575 - block
    b438 - block
    b650 - block
    b553 - block
    b684 - block
    b499 - block
    b863 - block
    b727 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b575 )
    ( on b438 b575 )
    ( on b650 b438 )
    ( on b553 b650 )
    ( on b684 b553 )
    ( on b499 b684 )
    ( on b863 b499 )
    ( on b727 b863 )
    ( clear b727 )
  )
  ( :goal
    ( and
      ( clear b575 )
    )
  )
)
