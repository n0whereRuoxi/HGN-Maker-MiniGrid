( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b881 - block
    b155 - block
    b89 - block
    b141 - block
    b8 - block
    b98 - block
    b831 - block
    b240 - block
    b903 - block
    b60 - block
    b483 - block
    b159 - block
    b295 - block
    b410 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b881 )
    ( on b155 b881 )
    ( on b89 b155 )
    ( on b141 b89 )
    ( on b8 b141 )
    ( on b98 b8 )
    ( on b831 b98 )
    ( on b240 b831 )
    ( on b903 b240 )
    ( on b60 b903 )
    ( on b483 b60 )
    ( on b159 b483 )
    ( on b295 b159 )
    ( on b410 b295 )
    ( clear b410 )
  )
  ( :goal
    ( and
      ( clear b881 )
    )
  )
)
