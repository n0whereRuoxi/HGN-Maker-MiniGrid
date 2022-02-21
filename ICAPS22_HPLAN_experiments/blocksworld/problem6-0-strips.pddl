( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b689 - block
    b393 - block
    b470 - block
    b424 - block
    b208 - block
    b539 - block
    b727 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b689 )
    ( on b393 b689 )
    ( on b470 b393 )
    ( on b424 b470 )
    ( on b208 b424 )
    ( on b539 b208 )
    ( on b727 b539 )
    ( clear b727 )
  )
  ( :goal
    ( and
      ( clear b689 )
    )
  )
)
