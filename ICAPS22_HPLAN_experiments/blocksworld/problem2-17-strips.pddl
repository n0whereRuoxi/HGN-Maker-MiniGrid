( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b519 - block
    b356 - block
    b72 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b519 )
    ( on b356 b519 )
    ( on b72 b356 )
    ( clear b72 )
  )
  ( :goal
    ( and
      ( clear b519 )
      ( clear b519 )
      ( clear b519 )
    )
  )
)
