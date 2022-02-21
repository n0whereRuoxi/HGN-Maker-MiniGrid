( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b539 - block
    b169 - block
    b31 - block
    b30 - block
    b543 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b539 )
    ( on b169 b539 )
    ( on b31 b169 )
    ( on b30 b31 )
    ( on b543 b30 )
    ( clear b543 )
  )
  ( :goal
    ( and
      ( clear b539 )
    )
  )
)
