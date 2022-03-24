( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b431 - block
    b126 - block
    b535 - block
    b796 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b431 )
    ( on b126 b431 )
    ( on b535 b126 )
    ( on b796 b535 )
    ( clear b796 )
  )
  ( :goal
    ( and
      ( clear b431 )
    )
  )
)
