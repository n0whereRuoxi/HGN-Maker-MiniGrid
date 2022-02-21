( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b214 - block
    b730 - block
    b241 - block
    b617 - block
    b13 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b214 )
    ( on b730 b214 )
    ( on b241 b730 )
    ( on b617 b241 )
    ( on b13 b617 )
    ( clear b13 )
  )
  ( :goal
    ( and
      ( clear b214 )
    )
  )
)
