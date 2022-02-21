( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b297 - block
    b901 - block
    b450 - block
    b76 - block
    b224 - block
    b213 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b297 )
    ( on b901 b297 )
    ( on b450 b901 )
    ( on b76 b450 )
    ( on b224 b76 )
    ( on b213 b224 )
    ( clear b213 )
  )
  ( :goal
    ( and
      ( clear b297 )
      ( clear b297 )
      ( clear b297 )
      ( clear b297 )
      ( clear b297 )
      ( clear b297 )
    )
  )
)
