( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b146 - block
    b10 - block
    b233 - block
    b796 - block
    b431 - block
    b489 - block
    b938 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b146 )
    ( on b10 b146 )
    ( on b233 b10 )
    ( on b796 b233 )
    ( on b431 b796 )
    ( on b489 b431 )
    ( on b938 b489 )
    ( clear b938 )
  )
  ( :goal
    ( and
      ( clear b146 )
      ( clear b146 )
      ( clear b146 )
      ( clear b146 )
      ( clear b146 )
      ( clear b146 )
      ( clear b146 )
    )
  )
)
