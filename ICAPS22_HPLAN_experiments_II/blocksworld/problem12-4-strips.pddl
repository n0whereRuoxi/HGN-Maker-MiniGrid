( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b629 - block
    b459 - block
    b36 - block
    b337 - block
    b900 - block
    b653 - block
    b482 - block
    b785 - block
    b769 - block
    b513 - block
    b618 - block
    b327 - block
    b512 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b629 )
    ( on b459 b629 )
    ( on b36 b459 )
    ( on b337 b36 )
    ( on b900 b337 )
    ( on b653 b900 )
    ( on b482 b653 )
    ( on b785 b482 )
    ( on b769 b785 )
    ( on b513 b769 )
    ( on b618 b513 )
    ( on b327 b618 )
    ( on b512 b327 )
    ( clear b512 )
  )
  ( :goal
    ( and
      ( clear b629 )
    )
  )
)
