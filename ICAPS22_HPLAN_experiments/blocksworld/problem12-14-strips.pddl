( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b911 - block
    b821 - block
    b232 - block
    b34 - block
    b976 - block
    b148 - block
    b982 - block
    b980 - block
    b22 - block
    b91 - block
    b922 - block
    b897 - block
    b452 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b911 )
    ( on b821 b911 )
    ( on b232 b821 )
    ( on b34 b232 )
    ( on b976 b34 )
    ( on b148 b976 )
    ( on b982 b148 )
    ( on b980 b982 )
    ( on b22 b980 )
    ( on b91 b22 )
    ( on b922 b91 )
    ( on b897 b922 )
    ( on b452 b897 )
    ( clear b452 )
  )
  ( :goal
    ( and
      ( clear b911 )
    )
  )
)
