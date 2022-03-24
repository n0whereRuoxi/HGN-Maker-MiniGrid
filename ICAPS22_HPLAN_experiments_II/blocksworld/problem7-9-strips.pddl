( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b690 - block
    b350 - block
    b821 - block
    b850 - block
    b552 - block
    b322 - block
    b471 - block
    b191 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b690 )
    ( on b350 b690 )
    ( on b821 b350 )
    ( on b850 b821 )
    ( on b552 b850 )
    ( on b322 b552 )
    ( on b471 b322 )
    ( on b191 b471 )
    ( clear b191 )
  )
  ( :goal
    ( and
      ( clear b690 )
    )
  )
)
