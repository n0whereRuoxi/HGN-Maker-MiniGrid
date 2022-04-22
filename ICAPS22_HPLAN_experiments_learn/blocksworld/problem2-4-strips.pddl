( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b303 - block
    b9 - block
    b208 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b303 )
    ( on b9 b303 )
    ( on b208 b9 )
    ( clear b208 )
  )
  ( :goal
    ( and
      ( clear b303 )
    )
  )
)
