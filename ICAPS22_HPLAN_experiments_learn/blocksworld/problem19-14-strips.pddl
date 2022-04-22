( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b892 - block
    b536 - block
    b460 - block
    b666 - block
    b219 - block
    b736 - block
    b740 - block
    b599 - block
    b30 - block
    b252 - block
    b232 - block
    b809 - block
    b216 - block
    b146 - block
    b977 - block
    b830 - block
    b582 - block
    b695 - block
    b516 - block
    b730 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b892 )
    ( on b536 b892 )
    ( on b460 b536 )
    ( on b666 b460 )
    ( on b219 b666 )
    ( on b736 b219 )
    ( on b740 b736 )
    ( on b599 b740 )
    ( on b30 b599 )
    ( on b252 b30 )
    ( on b232 b252 )
    ( on b809 b232 )
    ( on b216 b809 )
    ( on b146 b216 )
    ( on b977 b146 )
    ( on b830 b977 )
    ( on b582 b830 )
    ( on b695 b582 )
    ( on b516 b695 )
    ( on b730 b516 )
    ( clear b730 )
  )
  ( :goal
    ( and
      ( clear b892 )
    )
  )
)
