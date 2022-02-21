( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b586 - block
    b583 - block
    b298 - block
    b138 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b586 )
    ( on b583 b586 )
    ( on b298 b583 )
    ( on b138 b298 )
    ( clear b138 )
  )
  ( :goal
    ( and
      ( clear b586 )
    )
  )
)
