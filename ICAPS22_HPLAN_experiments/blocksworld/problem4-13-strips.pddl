( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b244 - block
    b602 - block
    b740 - block
    b641 - block
    b955 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b244 )
    ( on b602 b244 )
    ( on b740 b602 )
    ( on b641 b740 )
    ( on b955 b641 )
    ( clear b955 )
  )
  ( :goal
    ( and
      ( clear b244 )
      ( clear b244 )
      ( clear b244 )
      ( clear b244 )
      ( clear b244 )
    )
  )
)
