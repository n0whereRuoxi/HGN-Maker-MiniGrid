( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b329 - block
    b473 - block
    b120 - block
    b433 - block
    b661 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b329 )
    ( on b473 b329 )
    ( on b120 b473 )
    ( on b433 b120 )
    ( on b661 b433 )
    ( clear b661 )
  )
  ( :goal
    ( and
      ( clear b329 )
      ( clear b329 )
      ( clear b329 )
      ( clear b329 )
      ( clear b329 )
    )
  )
)
