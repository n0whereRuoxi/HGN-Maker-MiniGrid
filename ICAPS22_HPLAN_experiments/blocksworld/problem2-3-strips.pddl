( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b165 - block
    b772 - block
    b910 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b165 )
    ( on b772 b165 )
    ( on b910 b772 )
    ( clear b910 )
  )
  ( :goal
    ( and
      ( clear b165 )
      ( clear b165 )
      ( clear b165 )
    )
  )
)
