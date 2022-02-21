( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b336 - block
    b847 - block
    b76 - block
    b892 - block
    b980 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b336 )
    ( on b847 b336 )
    ( on b76 b847 )
    ( on b892 b76 )
    ( on b980 b892 )
    ( clear b980 )
  )
  ( :goal
    ( and
      ( clear b336 )
    )
  )
)
