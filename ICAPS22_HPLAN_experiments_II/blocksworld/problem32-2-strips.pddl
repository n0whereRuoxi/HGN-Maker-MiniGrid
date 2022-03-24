( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b103 - block
    b882 - block
    b126 - block
    b566 - block
    b221 - block
    b706 - block
    b560 - block
    b406 - block
    b511 - block
    b577 - block
    b634 - block
    b647 - block
    b862 - block
    b936 - block
    b508 - block
    b509 - block
    b535 - block
    b812 - block
    b786 - block
    b355 - block
    b531 - block
    b66 - block
    b79 - block
    b733 - block
    b656 - block
    b939 - block
    b976 - block
    b594 - block
    b516 - block
    b213 - block
    b48 - block
    b424 - block
    b945 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b103 )
    ( on b882 b103 )
    ( on b126 b882 )
    ( on b566 b126 )
    ( on b221 b566 )
    ( on b706 b221 )
    ( on b560 b706 )
    ( on b406 b560 )
    ( on b511 b406 )
    ( on b577 b511 )
    ( on b634 b577 )
    ( on b647 b634 )
    ( on b862 b647 )
    ( on b936 b862 )
    ( on b508 b936 )
    ( on b509 b508 )
    ( on b535 b509 )
    ( on b812 b535 )
    ( on b786 b812 )
    ( on b355 b786 )
    ( on b531 b355 )
    ( on b66 b531 )
    ( on b79 b66 )
    ( on b733 b79 )
    ( on b656 b733 )
    ( on b939 b656 )
    ( on b976 b939 )
    ( on b594 b976 )
    ( on b516 b594 )
    ( on b213 b516 )
    ( on b48 b213 )
    ( on b424 b48 )
    ( on b945 b424 )
    ( clear b945 )
  )
  ( :goal
    ( and
      ( clear b103 )
    )
  )
)
