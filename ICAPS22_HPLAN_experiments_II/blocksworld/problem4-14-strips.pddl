( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b520 - block
    b906 - block
    b770 - block
    b967 - block
    b318 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b520 )
    ( on b906 b520 )
    ( on b770 b906 )
    ( on b967 b770 )
    ( on b318 b967 )
    ( clear b318 )
  )
  ( :goal
    ( and
      ( clear b520 )
    )
  )
)
