( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b83 - block
    b45 - block
    b835 - block
    b946 - block
    b250 - block
    b126 - block
    b464 - block
    b97 - block
    b517 - block
    b636 - block
    b672 - block
    b434 - block
    b48 - block
    b669 - block
    b549 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b83 )
    ( on b45 b83 )
    ( on b835 b45 )
    ( on b946 b835 )
    ( on b250 b946 )
    ( on b126 b250 )
    ( on b464 b126 )
    ( on b97 b464 )
    ( on b517 b97 )
    ( on b636 b517 )
    ( on b672 b636 )
    ( on b434 b672 )
    ( on b48 b434 )
    ( on b669 b48 )
    ( on b549 b669 )
    ( clear b549 )
  )
  ( :goal
    ( and
      ( clear b83 )
    )
  )
)
