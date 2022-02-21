( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b299 - block
    b84 - block
    b551 - block
    b256 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b299 )
    ( on b84 b299 )
    ( on b551 b84 )
    ( on b256 b551 )
    ( clear b256 )
  )
  ( :goal
    ( and
      ( clear b299 )
      ( clear b299 )
      ( clear b299 )
      ( clear b299 )
    )
  )
)
