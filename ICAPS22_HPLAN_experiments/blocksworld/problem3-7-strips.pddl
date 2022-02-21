( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b85 - block
    b150 - block
    b676 - block
    b336 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b85 )
    ( on b150 b85 )
    ( on b676 b150 )
    ( on b336 b676 )
    ( clear b336 )
  )
  ( :goal
    ( and
      ( clear b85 )
      ( clear b85 )
      ( clear b85 )
      ( clear b85 )
    )
  )
)
