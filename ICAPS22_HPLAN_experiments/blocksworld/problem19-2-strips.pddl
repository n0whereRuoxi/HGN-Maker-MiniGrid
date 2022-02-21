( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b702 - block
    b84 - block
    b123 - block
    b217 - block
    b582 - block
    b806 - block
    b740 - block
    b70 - block
    b524 - block
    b81 - block
    b296 - block
    b75 - block
    b768 - block
    b865 - block
    b71 - block
    b125 - block
    b611 - block
    b995 - block
    b623 - block
    b756 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b702 )
    ( on b84 b702 )
    ( on b123 b84 )
    ( on b217 b123 )
    ( on b582 b217 )
    ( on b806 b582 )
    ( on b740 b806 )
    ( on b70 b740 )
    ( on b524 b70 )
    ( on b81 b524 )
    ( on b296 b81 )
    ( on b75 b296 )
    ( on b768 b75 )
    ( on b865 b768 )
    ( on b71 b865 )
    ( on b125 b71 )
    ( on b611 b125 )
    ( on b995 b611 )
    ( on b623 b995 )
    ( on b756 b623 )
    ( clear b756 )
  )
  ( :goal
    ( and
      ( clear b702 )
    )
  )
)
