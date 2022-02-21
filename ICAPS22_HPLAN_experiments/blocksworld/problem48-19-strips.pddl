( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b920 - block
    b600 - block
    b461 - block
    b988 - block
    b437 - block
    b885 - block
    b296 - block
    b75 - block
    b13 - block
    b740 - block
    b952 - block
    b905 - block
    b721 - block
    b693 - block
    b515 - block
    b524 - block
    b598 - block
    b333 - block
    b540 - block
    b804 - block
    b139 - block
    b261 - block
    b682 - block
    b834 - block
    b95 - block
    b517 - block
    b454 - block
    b974 - block
    b237 - block
    b724 - block
    b548 - block
    b594 - block
    b206 - block
    b643 - block
    b634 - block
    b523 - block
    b652 - block
    b299 - block
    b609 - block
    b512 - block
    b190 - block
    b248 - block
    b927 - block
    b623 - block
    b60 - block
    b980 - block
    b85 - block
    b167 - block
    b184 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b920 )
    ( on b600 b920 )
    ( on b461 b600 )
    ( on b988 b461 )
    ( on b437 b988 )
    ( on b885 b437 )
    ( on b296 b885 )
    ( on b75 b296 )
    ( on b13 b75 )
    ( on b740 b13 )
    ( on b952 b740 )
    ( on b905 b952 )
    ( on b721 b905 )
    ( on b693 b721 )
    ( on b515 b693 )
    ( on b524 b515 )
    ( on b598 b524 )
    ( on b333 b598 )
    ( on b540 b333 )
    ( on b804 b540 )
    ( on b139 b804 )
    ( on b261 b139 )
    ( on b682 b261 )
    ( on b834 b682 )
    ( on b95 b834 )
    ( on b517 b95 )
    ( on b454 b517 )
    ( on b974 b454 )
    ( on b237 b974 )
    ( on b724 b237 )
    ( on b548 b724 )
    ( on b594 b548 )
    ( on b206 b594 )
    ( on b643 b206 )
    ( on b634 b643 )
    ( on b523 b634 )
    ( on b652 b523 )
    ( on b299 b652 )
    ( on b609 b299 )
    ( on b512 b609 )
    ( on b190 b512 )
    ( on b248 b190 )
    ( on b927 b248 )
    ( on b623 b927 )
    ( on b60 b623 )
    ( on b980 b60 )
    ( on b85 b980 )
    ( on b167 b85 )
    ( on b184 b167 )
    ( clear b184 )
  )
  ( :goal
    ( and
      ( clear b920 )
    )
  )
)
