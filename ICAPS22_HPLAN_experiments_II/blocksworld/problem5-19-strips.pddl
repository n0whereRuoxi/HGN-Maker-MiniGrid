( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b408 - block
    b228 - block
    b929 - block
    b563 - block
    b939 - block
    b897 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b408 )
    ( on b228 b408 )
    ( on b929 b228 )
    ( on b563 b929 )
    ( on b939 b563 )
    ( on b897 b939 )
    ( clear b897 )
  )
  ( :goal
    ( and
      ( clear b408 )
    )
  )
)
