( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b138 - block
    b56 - block
    b476 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b138 )
    ( on b56 b138 )
    ( on b476 b56 )
    ( clear b476 )
  )
  ( :goal
    ( and
      ( clear b138 )
    )
  )
)
