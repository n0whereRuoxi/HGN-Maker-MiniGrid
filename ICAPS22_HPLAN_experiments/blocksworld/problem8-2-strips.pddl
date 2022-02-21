( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b821 - block
    b548 - block
    b683 - block
    b578 - block
    b619 - block
    b568 - block
    b283 - block
    b788 - block
    b128 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b821 )
    ( on b548 b821 )
    ( on b683 b548 )
    ( on b578 b683 )
    ( on b619 b578 )
    ( on b568 b619 )
    ( on b283 b568 )
    ( on b788 b283 )
    ( on b128 b788 )
    ( clear b128 )
  )
  ( :goal
    ( and
      ( clear b821 )
    )
  )
)
