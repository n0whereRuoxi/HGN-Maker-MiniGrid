( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b820 - block
    b302 - block
    b34 - block
    b458 - block
    b70 - block
    b313 - block
    b407 - block
    b3 - block
    b763 - block
    b205 - block
    b733 - block
    b379 - block
    b485 - block
    b499 - block
    b511 - block
    b21 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b820 )
    ( on b302 b820 )
    ( on b34 b302 )
    ( on b458 b34 )
    ( on b70 b458 )
    ( on b313 b70 )
    ( on b407 b313 )
    ( on b3 b407 )
    ( on b763 b3 )
    ( on b205 b763 )
    ( on b733 b205 )
    ( on b379 b733 )
    ( on b485 b379 )
    ( on b499 b485 )
    ( on b511 b499 )
    ( on b21 b511 )
    ( clear b21 )
  )
  ( :goal
    ( and
      ( clear b820 )
    )
  )
)
