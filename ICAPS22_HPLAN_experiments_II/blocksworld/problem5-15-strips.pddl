( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b43 - block
    b405 - block
    b24 - block
    b360 - block
    b305 - block
    b170 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b43 )
    ( on b405 b43 )
    ( on b24 b405 )
    ( on b360 b24 )
    ( on b305 b360 )
    ( on b170 b305 )
    ( clear b170 )
  )
  ( :goal
    ( and
      ( clear b43 )
    )
  )
)
