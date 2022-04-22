( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b521 - block
    b448 - block
    b206 - block
    b583 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b521 )
    ( on b448 b521 )
    ( on b206 b448 )
    ( on b583 b206 )
    ( clear b583 )
  )
  ( :goal
    ( and
      ( clear b521 )
    )
  )
)
