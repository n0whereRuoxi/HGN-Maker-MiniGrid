( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b655 - block
    b665 - block
    b187 - block
    b892 - block
    b436 - block
    b631 - block
    b337 - block
    b26 - block
    b454 - block
    b425 - block
    b389 - block
    b251 - block
    b764 - block
    b592 - block
    b595 - block
    b840 - block
    b72 - block
    b339 - block
    b22 - block
    b396 - block
    b733 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b655 )
    ( on b665 b655 )
    ( on b187 b665 )
    ( on b892 b187 )
    ( on b436 b892 )
    ( on b631 b436 )
    ( on b337 b631 )
    ( on b26 b337 )
    ( on b454 b26 )
    ( on b425 b454 )
    ( on b389 b425 )
    ( on b251 b389 )
    ( on b764 b251 )
    ( on b592 b764 )
    ( on b595 b592 )
    ( on b840 b595 )
    ( on b72 b840 )
    ( on b339 b72 )
    ( on b22 b339 )
    ( on b396 b22 )
    ( on b733 b396 )
    ( clear b733 )
  )
  ( :goal
    ( and
      ( clear b655 )
    )
  )
)
