( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b767 - block
    b986 - block
    b750 - block
    b405 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b767 )
    ( on b986 b767 )
    ( on b750 b986 )
    ( on b405 b750 )
    ( clear b405 )
  )
  ( :goal
    ( and
      ( clear b767 )
    )
  )
)
