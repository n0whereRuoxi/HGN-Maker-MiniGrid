( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b532 - block
    b526 - block
    b550 - block
    b633 - block
    b730 - block
    b602 - block
    b271 - block
    b508 - block
    b20 - block
    b239 - block
    b577 - block
    b938 - block
    b833 - block
    b336 - block
    b741 - block
    b180 - block
    b629 - block
    b739 - block
    b7 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b532 )
    ( on b526 b532 )
    ( on b550 b526 )
    ( on b633 b550 )
    ( on b730 b633 )
    ( on b602 b730 )
    ( on b271 b602 )
    ( on b508 b271 )
    ( on b20 b508 )
    ( on b239 b20 )
    ( on b577 b239 )
    ( on b938 b577 )
    ( on b833 b938 )
    ( on b336 b833 )
    ( on b741 b336 )
    ( on b180 b741 )
    ( on b629 b180 )
    ( on b739 b629 )
    ( on b7 b739 )
    ( clear b7 )
  )
  ( :goal
    ( and
      ( clear b532 )
    )
  )
)
