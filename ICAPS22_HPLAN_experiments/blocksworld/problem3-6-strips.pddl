( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b755 - block
    b487 - block
    b248 - block
    b198 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b755 )
    ( on b487 b755 )
    ( on b248 b487 )
    ( on b198 b248 )
    ( clear b198 )
  )
  ( :goal
    ( and
      ( clear b755 )
      ( clear b755 )
      ( clear b755 )
      ( clear b755 )
    )
  )
)
