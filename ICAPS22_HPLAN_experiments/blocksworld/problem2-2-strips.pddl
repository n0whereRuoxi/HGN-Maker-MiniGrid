( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b675 - block
    b946 - block
    b266 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b675 )
    ( on b946 b675 )
    ( on b266 b946 )
    ( clear b266 )
  )
  ( :goal
    ( and
      ( clear b675 )
      ( clear b675 )
      ( clear b675 )
    )
  )
)
