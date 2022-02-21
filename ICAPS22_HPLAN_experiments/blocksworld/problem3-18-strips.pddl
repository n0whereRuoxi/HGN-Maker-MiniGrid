( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b641 - block
    b935 - block
    b233 - block
    b953 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b641 )
    ( on b935 b641 )
    ( on b233 b935 )
    ( on b953 b233 )
    ( clear b953 )
  )
  ( :goal
    ( and
      ( clear b641 )
      ( clear b641 )
      ( clear b641 )
      ( clear b641 )
    )
  )
)
