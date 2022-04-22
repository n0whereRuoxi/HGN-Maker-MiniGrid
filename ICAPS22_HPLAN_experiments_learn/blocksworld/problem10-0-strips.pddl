( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b445 - block
    b124 - block
    b584 - block
    b884 - block
    b602 - block
    b242 - block
    b898 - block
    b522 - block
    b575 - block
    b649 - block
    b343 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b445 )
    ( on b124 b445 )
    ( on b584 b124 )
    ( on b884 b584 )
    ( on b602 b884 )
    ( on b242 b602 )
    ( on b898 b242 )
    ( on b522 b898 )
    ( on b575 b522 )
    ( on b649 b575 )
    ( on b343 b649 )
    ( clear b343 )
  )
  ( :goal
    ( and
      ( clear b445 )
    )
  )
)
