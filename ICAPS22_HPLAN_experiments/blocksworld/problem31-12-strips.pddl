( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b306 - block
    b237 - block
    b108 - block
    b533 - block
    b790 - block
    b261 - block
    b846 - block
    b752 - block
    b107 - block
    b228 - block
    b101 - block
    b127 - block
    b265 - block
    b267 - block
    b849 - block
    b854 - block
    b915 - block
    b287 - block
    b578 - block
    b976 - block
    b12 - block
    b612 - block
    b706 - block
    b660 - block
    b79 - block
    b759 - block
    b655 - block
    b829 - block
    b76 - block
    b62 - block
    b7 - block
    b820 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b306 )
    ( on b237 b306 )
    ( on b108 b237 )
    ( on b533 b108 )
    ( on b790 b533 )
    ( on b261 b790 )
    ( on b846 b261 )
    ( on b752 b846 )
    ( on b107 b752 )
    ( on b228 b107 )
    ( on b101 b228 )
    ( on b127 b101 )
    ( on b265 b127 )
    ( on b267 b265 )
    ( on b849 b267 )
    ( on b854 b849 )
    ( on b915 b854 )
    ( on b287 b915 )
    ( on b578 b287 )
    ( on b976 b578 )
    ( on b12 b976 )
    ( on b612 b12 )
    ( on b706 b612 )
    ( on b660 b706 )
    ( on b79 b660 )
    ( on b759 b79 )
    ( on b655 b759 )
    ( on b829 b655 )
    ( on b76 b829 )
    ( on b62 b76 )
    ( on b7 b62 )
    ( on b820 b7 )
    ( clear b820 )
  )
  ( :goal
    ( and
      ( clear b306 )
    )
  )
)
