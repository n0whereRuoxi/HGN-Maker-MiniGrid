( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b993 - block
    b674 - block
    b118 - block
    b268 - block
    b506 - block
    b69 - block
    b956 - block
    b15 - block
    b998 - block
    b408 - block
    b645 - block
    b754 - block
    b50 - block
    b213 - block
    b941 - block
    b494 - block
    b812 - block
    b712 - block
    b79 - block
    b189 - block
    b224 - block
    b285 - block
    b708 - block
    b365 - block
    b124 - block
    b769 - block
    b381 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b993 )
    ( on b674 b993 )
    ( on b118 b674 )
    ( on b268 b118 )
    ( on b506 b268 )
    ( on b69 b506 )
    ( on b956 b69 )
    ( on b15 b956 )
    ( on b998 b15 )
    ( on b408 b998 )
    ( on b645 b408 )
    ( on b754 b645 )
    ( on b50 b754 )
    ( on b213 b50 )
    ( on b941 b213 )
    ( on b494 b941 )
    ( on b812 b494 )
    ( on b712 b812 )
    ( on b79 b712 )
    ( on b189 b79 )
    ( on b224 b189 )
    ( on b285 b224 )
    ( on b708 b285 )
    ( on b365 b708 )
    ( on b124 b365 )
    ( on b769 b124 )
    ( on b381 b769 )
    ( clear b381 )
  )
  ( :goal
    ( and
      ( clear b993 )
    )
  )
)
