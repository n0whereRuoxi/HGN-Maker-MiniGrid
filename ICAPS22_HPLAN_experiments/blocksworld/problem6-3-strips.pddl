( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b732 - block
    b428 - block
    b32 - block
    b302 - block
    b903 - block
    b600 - block
    b123 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b732 )
    ( on b428 b732 )
    ( on b32 b428 )
    ( on b302 b32 )
    ( on b903 b302 )
    ( on b600 b903 )
    ( on b123 b600 )
    ( clear b123 )
  )
  ( :goal
    ( and
      ( clear b732 )
      ( clear b732 )
      ( clear b732 )
      ( clear b732 )
      ( clear b732 )
      ( clear b732 )
      ( clear b732 )
    )
  )
)
