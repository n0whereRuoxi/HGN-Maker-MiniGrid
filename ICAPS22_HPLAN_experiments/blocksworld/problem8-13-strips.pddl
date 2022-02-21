( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b280 - block
    b925 - block
    b421 - block
    b370 - block
    b552 - block
    b676 - block
    b328 - block
    b395 - block
    b230 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b280 )
    ( on b925 b280 )
    ( on b421 b925 )
    ( on b370 b421 )
    ( on b552 b370 )
    ( on b676 b552 )
    ( on b328 b676 )
    ( on b395 b328 )
    ( on b230 b395 )
    ( clear b230 )
  )
  ( :goal
    ( and
      ( clear b280 )
    )
  )
)
