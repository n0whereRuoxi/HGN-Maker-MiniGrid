( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b209 - block
    b560 - block
    b683 - block
    b735 - block
    b413 - block
    b520 - block
    b233 - block
    b102 - block
    b348 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b209 )
    ( on b560 b209 )
    ( on b683 b560 )
    ( on b735 b683 )
    ( on b413 b735 )
    ( on b520 b413 )
    ( on b233 b520 )
    ( on b102 b233 )
    ( on b348 b102 )
    ( clear b348 )
  )
  ( :goal
    ( and
      ( clear b209 )
    )
  )
)
