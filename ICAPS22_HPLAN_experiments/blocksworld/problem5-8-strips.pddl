( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b473 - block
    b408 - block
    b366 - block
    b444 - block
    b729 - block
    b435 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b473 )
    ( on b408 b473 )
    ( on b366 b408 )
    ( on b444 b366 )
    ( on b729 b444 )
    ( on b435 b729 )
    ( clear b435 )
  )
  ( :goal
    ( and
      ( clear b473 )
    )
  )
)
