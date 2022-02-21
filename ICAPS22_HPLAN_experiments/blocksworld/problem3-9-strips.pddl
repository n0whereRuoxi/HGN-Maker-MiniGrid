( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b60 - block
    b629 - block
    b731 - block
    b935 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b60 )
    ( on b629 b60 )
    ( on b731 b629 )
    ( on b935 b731 )
    ( clear b935 )
  )
  ( :goal
    ( and
      ( clear b60 )
    )
  )
)
