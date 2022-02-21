( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b152 - block
    b791 - block
    b529 - block
    b924 - block
    b421 - block
    b467 - block
    b519 - block
    b502 - block
    b209 - block
    b725 - block
    b548 - block
    b300 - block
    b243 - block
    b552 - block
    b22 - block
    b850 - block
    b415 - block
    b479 - block
    b170 - block
    b405 - block
    b217 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b152 )
    ( on b791 b152 )
    ( on b529 b791 )
    ( on b924 b529 )
    ( on b421 b924 )
    ( on b467 b421 )
    ( on b519 b467 )
    ( on b502 b519 )
    ( on b209 b502 )
    ( on b725 b209 )
    ( on b548 b725 )
    ( on b300 b548 )
    ( on b243 b300 )
    ( on b552 b243 )
    ( on b22 b552 )
    ( on b850 b22 )
    ( on b415 b850 )
    ( on b479 b415 )
    ( on b170 b479 )
    ( on b405 b170 )
    ( on b217 b405 )
    ( clear b217 )
  )
  ( :goal
    ( and
      ( clear b152 )
    )
  )
)
