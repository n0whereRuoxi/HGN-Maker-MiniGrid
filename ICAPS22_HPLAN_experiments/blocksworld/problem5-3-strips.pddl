( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b335 - block
    b363 - block
    b627 - block
    b565 - block
    b304 - block
    b644 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b335 )
    ( on b363 b335 )
    ( on b627 b363 )
    ( on b565 b627 )
    ( on b304 b565 )
    ( on b644 b304 )
    ( clear b644 )
  )
  ( :goal
    ( and
      ( clear b335 )
      ( clear b335 )
      ( clear b335 )
      ( clear b335 )
      ( clear b335 )
      ( clear b335 )
    )
  )
)
