( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b515 - block
    b865 - block
    b449 - block
    b82 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b515 )
    ( on b865 b515 )
    ( on b449 b865 )
    ( on b82 b449 )
    ( clear b82 )
  )
  ( :goal
    ( and
      ( clear b515 )
    )
  )
)
