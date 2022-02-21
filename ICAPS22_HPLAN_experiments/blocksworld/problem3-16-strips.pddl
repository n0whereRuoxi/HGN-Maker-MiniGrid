( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b1 - block
    b907 - block
    b418 - block
    b964 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b1 )
    ( on b907 b1 )
    ( on b418 b907 )
    ( on b964 b418 )
    ( clear b964 )
  )
  ( :goal
    ( and
      ( clear b1 )
    )
  )
)
