( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b189 - block
    b553 - block
    b515 - block
    b240 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b189 )
    ( on b553 b189 )
    ( on b515 b553 )
    ( on b240 b515 )
    ( clear b240 )
  )
  ( :goal
    ( and
      ( clear b189 )
      ( clear b189 )
      ( clear b189 )
      ( clear b189 )
    )
  )
)
