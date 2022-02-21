( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b489 - block
    b365 - block
    b560 - block
    b325 - block
    b554 - block
    b504 - block
    b838 - block
    b84 - block
    b486 - block
    b493 - block
    b79 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b489 )
    ( on b365 b489 )
    ( on b560 b365 )
    ( on b325 b560 )
    ( on b554 b325 )
    ( on b504 b554 )
    ( on b838 b504 )
    ( on b84 b838 )
    ( on b486 b84 )
    ( on b493 b486 )
    ( on b79 b493 )
    ( clear b79 )
  )
  ( :goal
    ( and
      ( clear b489 )
    )
  )
)
