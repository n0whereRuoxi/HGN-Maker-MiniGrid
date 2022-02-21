( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b524 - block
    b102 - block
    b247 - block
    b340 - block
    b240 - block
    b651 - block
    b903 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b524 )
    ( on b102 b524 )
    ( on b247 b102 )
    ( on b340 b247 )
    ( on b240 b340 )
    ( on b651 b240 )
    ( on b903 b651 )
    ( clear b903 )
  )
  ( :goal
    ( and
      ( clear b524 )
    )
  )
)
