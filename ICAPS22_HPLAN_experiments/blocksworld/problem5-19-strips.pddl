( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b89 - block
    b709 - block
    b418 - block
    b673 - block
    b471 - block
    b477 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b89 )
    ( on b709 b89 )
    ( on b418 b709 )
    ( on b673 b418 )
    ( on b471 b673 )
    ( on b477 b471 )
    ( clear b477 )
  )
  ( :goal
    ( and
      ( clear b89 )
    )
  )
)
