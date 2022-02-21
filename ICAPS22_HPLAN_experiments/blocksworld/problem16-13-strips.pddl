( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b518 - block
    b964 - block
    b388 - block
    b57 - block
    b924 - block
    b381 - block
    b851 - block
    b651 - block
    b582 - block
    b133 - block
    b692 - block
    b150 - block
    b940 - block
    b549 - block
    b572 - block
    b449 - block
    b240 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b518 )
    ( on b964 b518 )
    ( on b388 b964 )
    ( on b57 b388 )
    ( on b924 b57 )
    ( on b381 b924 )
    ( on b851 b381 )
    ( on b651 b851 )
    ( on b582 b651 )
    ( on b133 b582 )
    ( on b692 b133 )
    ( on b150 b692 )
    ( on b940 b150 )
    ( on b549 b940 )
    ( on b572 b549 )
    ( on b449 b572 )
    ( on b240 b449 )
    ( clear b240 )
  )
  ( :goal
    ( and
      ( clear b518 )
    )
  )
)
