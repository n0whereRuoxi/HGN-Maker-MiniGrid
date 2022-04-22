( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b478 - block
    b306 - block
    b317 - block
    b155 - block
    b695 - block
    b897 - block
    b751 - block
    b865 - block
    b14 - block
    b975 - block
    b800 - block
    b30 - block
    b518 - block
    b978 - block
    b229 - block
    b910 - block
    b27 - block
    b771 - block
    b790 - block
    b439 - block
    b340 - block
    b76 - block
    b755 - block
    b389 - block
    b713 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b478 )
    ( on b306 b478 )
    ( on b317 b306 )
    ( on b155 b317 )
    ( on b695 b155 )
    ( on b897 b695 )
    ( on b751 b897 )
    ( on b865 b751 )
    ( on b14 b865 )
    ( on b975 b14 )
    ( on b800 b975 )
    ( on b30 b800 )
    ( on b518 b30 )
    ( on b978 b518 )
    ( on b229 b978 )
    ( on b910 b229 )
    ( on b27 b910 )
    ( on b771 b27 )
    ( on b790 b771 )
    ( on b439 b790 )
    ( on b340 b439 )
    ( on b76 b340 )
    ( on b755 b76 )
    ( on b389 b755 )
    ( on b713 b389 )
    ( clear b713 )
  )
  ( :goal
    ( and
      ( clear b478 )
    )
  )
)
