( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b320 - block
    b568 - block
    b821 - block
    b641 - block
    b891 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b320 )
    ( on b568 b320 )
    ( on b821 b568 )
    ( on b641 b821 )
    ( on b891 b641 )
    ( clear b891 )
  )
  ( :goal
    ( and
      ( clear b320 )
      ( clear b320 )
      ( clear b320 )
      ( clear b320 )
      ( clear b320 )
    )
  )
)
