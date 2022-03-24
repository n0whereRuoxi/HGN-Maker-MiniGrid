( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b716 - block
    b946 - block
    b558 - block
    b305 - block
    b20 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b716 )
    ( on b946 b716 )
    ( on b558 b946 )
    ( on b305 b558 )
    ( on b20 b305 )
    ( clear b20 )
  )
  ( :goal
    ( and
      ( clear b716 )
    )
  )
)
