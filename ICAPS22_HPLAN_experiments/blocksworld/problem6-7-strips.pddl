( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b936 - block
    b298 - block
    b967 - block
    b87 - block
    b641 - block
    b965 - block
    b188 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b936 )
    ( on b298 b936 )
    ( on b967 b298 )
    ( on b87 b967 )
    ( on b641 b87 )
    ( on b965 b641 )
    ( on b188 b965 )
    ( clear b188 )
  )
  ( :goal
    ( and
      ( clear b936 )
      ( clear b936 )
      ( clear b936 )
      ( clear b936 )
      ( clear b936 )
      ( clear b936 )
      ( clear b936 )
    )
  )
)
