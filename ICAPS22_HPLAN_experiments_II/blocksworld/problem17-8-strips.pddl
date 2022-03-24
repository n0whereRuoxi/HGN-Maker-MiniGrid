( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b873 - block
    b907 - block
    b382 - block
    b28 - block
    b950 - block
    b339 - block
    b560 - block
    b501 - block
    b205 - block
    b733 - block
    b457 - block
    b509 - block
    b201 - block
    b123 - block
    b393 - block
    b468 - block
    b537 - block
    b42 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b873 )
    ( on b907 b873 )
    ( on b382 b907 )
    ( on b28 b382 )
    ( on b950 b28 )
    ( on b339 b950 )
    ( on b560 b339 )
    ( on b501 b560 )
    ( on b205 b501 )
    ( on b733 b205 )
    ( on b457 b733 )
    ( on b509 b457 )
    ( on b201 b509 )
    ( on b123 b201 )
    ( on b393 b123 )
    ( on b468 b393 )
    ( on b537 b468 )
    ( on b42 b537 )
    ( clear b42 )
  )
  ( :goal
    ( and
      ( clear b873 )
    )
  )
)
