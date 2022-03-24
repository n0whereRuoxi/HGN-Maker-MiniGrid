( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b337 - block
    b683 - block
    b967 - block
    b617 - block
    b500 - block
    b946 - block
    b993 - block
    b545 - block
    b690 - block
    b189 - block
    b511 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b337 )
    ( on b683 b337 )
    ( on b967 b683 )
    ( on b617 b967 )
    ( on b500 b617 )
    ( on b946 b500 )
    ( on b993 b946 )
    ( on b545 b993 )
    ( on b690 b545 )
    ( on b189 b690 )
    ( on b511 b189 )
    ( clear b511 )
  )
  ( :goal
    ( and
      ( clear b337 )
    )
  )
)
