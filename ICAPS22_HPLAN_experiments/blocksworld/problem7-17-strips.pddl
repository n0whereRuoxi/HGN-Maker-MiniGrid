( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b552 - block
    b399 - block
    b931 - block
    b361 - block
    b745 - block
    b198 - block
    b266 - block
    b238 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b552 )
    ( on b399 b552 )
    ( on b931 b399 )
    ( on b361 b931 )
    ( on b745 b361 )
    ( on b198 b745 )
    ( on b266 b198 )
    ( on b238 b266 )
    ( clear b238 )
  )
  ( :goal
    ( and
      ( clear b552 )
    )
  )
)
