( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b449 - block
    b614 - block
    b812 - block
    b170 - block
    b137 - block
    b345 - block
    b490 - block
    b683 - block
    b454 - block
    b702 - block
    b707 - block
    b558 - block
    b820 - block
    b736 - block
    b693 - block
    b456 - block
    b780 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b449 )
    ( on b614 b449 )
    ( on b812 b614 )
    ( on b170 b812 )
    ( on b137 b170 )
    ( on b345 b137 )
    ( on b490 b345 )
    ( on b683 b490 )
    ( on b454 b683 )
    ( on b702 b454 )
    ( on b707 b702 )
    ( on b558 b707 )
    ( on b820 b558 )
    ( on b736 b820 )
    ( on b693 b736 )
    ( on b456 b693 )
    ( on b780 b456 )
    ( clear b780 )
  )
  ( :goal
    ( and
      ( clear b449 )
    )
  )
)
