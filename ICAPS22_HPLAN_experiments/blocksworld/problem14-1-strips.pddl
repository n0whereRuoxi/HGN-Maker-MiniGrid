( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b303 - block
    b995 - block
    b257 - block
    b627 - block
    b925 - block
    b943 - block
    b5 - block
    b315 - block
    b900 - block
    b818 - block
    b75 - block
    b983 - block
    b247 - block
    b539 - block
    b252 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b303 )
    ( on b995 b303 )
    ( on b257 b995 )
    ( on b627 b257 )
    ( on b925 b627 )
    ( on b943 b925 )
    ( on b5 b943 )
    ( on b315 b5 )
    ( on b900 b315 )
    ( on b818 b900 )
    ( on b75 b818 )
    ( on b983 b75 )
    ( on b247 b983 )
    ( on b539 b247 )
    ( on b252 b539 )
    ( clear b252 )
  )
  ( :goal
    ( and
      ( clear b303 )
    )
  )
)
