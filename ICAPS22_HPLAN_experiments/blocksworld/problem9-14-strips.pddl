( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b634 - block
    b267 - block
    b469 - block
    b493 - block
    b363 - block
    b385 - block
    b615 - block
    b317 - block
    b673 - block
    b780 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b634 )
    ( on b267 b634 )
    ( on b469 b267 )
    ( on b493 b469 )
    ( on b363 b493 )
    ( on b385 b363 )
    ( on b615 b385 )
    ( on b317 b615 )
    ( on b673 b317 )
    ( on b780 b673 )
    ( clear b780 )
  )
  ( :goal
    ( and
      ( clear b634 )
    )
  )
)
