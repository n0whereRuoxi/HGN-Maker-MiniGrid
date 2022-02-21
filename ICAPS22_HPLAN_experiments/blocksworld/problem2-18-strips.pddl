( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b349 - block
    b33 - block
    b186 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b349 )
    ( on b33 b349 )
    ( on b186 b33 )
    ( clear b186 )
  )
  ( :goal
    ( and
      ( clear b349 )
      ( clear b349 )
      ( clear b349 )
    )
  )
)
