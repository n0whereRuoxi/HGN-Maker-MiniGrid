( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b196 - block
    b189 - block
    b166 - block
    b539 - block
    b756 - block
    b485 - block
    b978 - block
    b739 - block
    b684 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b196 )
    ( on b189 b196 )
    ( on b166 b189 )
    ( on b539 b166 )
    ( on b756 b539 )
    ( on b485 b756 )
    ( on b978 b485 )
    ( on b739 b978 )
    ( on b684 b739 )
    ( clear b684 )
  )
  ( :goal
    ( and
      ( clear b196 )
    )
  )
)
