( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b650 - block
    b46 - block
    b140 - block
    b290 - block
    b213 - block
    b390 - block
    b257 - block
    b515 - block
    b380 - block
    b300 - block
    b878 - block
    b143 - block
    b881 - block
    b392 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b650 )
    ( on b46 b650 )
    ( on b140 b46 )
    ( on b290 b140 )
    ( on b213 b290 )
    ( on b390 b213 )
    ( on b257 b390 )
    ( on b515 b257 )
    ( on b380 b515 )
    ( on b300 b380 )
    ( on b878 b300 )
    ( on b143 b878 )
    ( on b881 b143 )
    ( on b392 b881 )
    ( clear b392 )
  )
  ( :goal
    ( and
      ( clear b650 )
    )
  )
)
