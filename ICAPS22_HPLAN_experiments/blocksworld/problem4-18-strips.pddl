( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b145 - block
    b906 - block
    b567 - block
    b733 - block
    b817 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b145 )
    ( on b906 b145 )
    ( on b567 b906 )
    ( on b733 b567 )
    ( on b817 b733 )
    ( clear b817 )
  )
  ( :goal
    ( and
      ( clear b145 )
    )
  )
)
