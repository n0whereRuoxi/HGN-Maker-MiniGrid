( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b789 - block
    b606 - block
    b721 - block
    b135 - block
    b913 - block
    b303 - block
    b623 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b789 )
    ( on b606 b789 )
    ( on b721 b606 )
    ( on b135 b721 )
    ( on b913 b135 )
    ( on b303 b913 )
    ( on b623 b303 )
    ( clear b623 )
  )
  ( :goal
    ( and
      ( clear b789 )
    )
  )
)
