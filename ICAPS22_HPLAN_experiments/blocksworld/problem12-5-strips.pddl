( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b180 - block
    b77 - block
    b592 - block
    b311 - block
    b459 - block
    b99 - block
    b276 - block
    b908 - block
    b556 - block
    b725 - block
    b472 - block
    b9 - block
    b901 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b180 )
    ( on b77 b180 )
    ( on b592 b77 )
    ( on b311 b592 )
    ( on b459 b311 )
    ( on b99 b459 )
    ( on b276 b99 )
    ( on b908 b276 )
    ( on b556 b908 )
    ( on b725 b556 )
    ( on b472 b725 )
    ( on b9 b472 )
    ( on b901 b9 )
    ( clear b901 )
  )
  ( :goal
    ( and
      ( clear b180 )
    )
  )
)
