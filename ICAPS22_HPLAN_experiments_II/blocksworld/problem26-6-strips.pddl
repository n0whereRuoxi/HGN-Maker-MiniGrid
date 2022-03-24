( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b510 - block
    b486 - block
    b938 - block
    b956 - block
    b492 - block
    b823 - block
    b877 - block
    b566 - block
    b91 - block
    b410 - block
    b261 - block
    b600 - block
    b389 - block
    b360 - block
    b903 - block
    b70 - block
    b465 - block
    b804 - block
    b397 - block
    b8 - block
    b123 - block
    b40 - block
    b697 - block
    b399 - block
    b786 - block
    b618 - block
    b362 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b510 )
    ( on b486 b510 )
    ( on b938 b486 )
    ( on b956 b938 )
    ( on b492 b956 )
    ( on b823 b492 )
    ( on b877 b823 )
    ( on b566 b877 )
    ( on b91 b566 )
    ( on b410 b91 )
    ( on b261 b410 )
    ( on b600 b261 )
    ( on b389 b600 )
    ( on b360 b389 )
    ( on b903 b360 )
    ( on b70 b903 )
    ( on b465 b70 )
    ( on b804 b465 )
    ( on b397 b804 )
    ( on b8 b397 )
    ( on b123 b8 )
    ( on b40 b123 )
    ( on b697 b40 )
    ( on b399 b697 )
    ( on b786 b399 )
    ( on b618 b786 )
    ( on b362 b618 )
    ( clear b362 )
  )
  ( :goal
    ( and
      ( clear b510 )
    )
  )
)
