( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b576 - block
    b746 - block
    b83 - block
    b519 - block
    b600 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b576 )
    ( on b746 b576 )
    ( on b83 b746 )
    ( on b519 b83 )
    ( on b600 b519 )
    ( clear b600 )
  )
  ( :goal
    ( and
      ( clear b576 )
      ( clear b576 )
      ( clear b576 )
      ( clear b576 )
      ( clear b576 )
    )
  )
)
