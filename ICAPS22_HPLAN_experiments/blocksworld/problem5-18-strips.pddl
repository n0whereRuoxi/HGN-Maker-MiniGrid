( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b864 - block
    b895 - block
    b760 - block
    b878 - block
    b921 - block
    b989 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b864 )
    ( on b895 b864 )
    ( on b760 b895 )
    ( on b878 b760 )
    ( on b921 b878 )
    ( on b989 b921 )
    ( clear b989 )
  )
  ( :goal
    ( and
      ( clear b864 )
    )
  )
)
