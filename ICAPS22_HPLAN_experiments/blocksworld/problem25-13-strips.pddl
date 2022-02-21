( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b862 - block
    b401 - block
    b945 - block
    b641 - block
    b247 - block
    b173 - block
    b483 - block
    b664 - block
    b185 - block
    b411 - block
    b682 - block
    b654 - block
    b48 - block
    b932 - block
    b453 - block
    b578 - block
    b957 - block
    b39 - block
    b265 - block
    b94 - block
    b763 - block
    b950 - block
    b344 - block
    b135 - block
    b964 - block
    b245 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b862 )
    ( on b401 b862 )
    ( on b945 b401 )
    ( on b641 b945 )
    ( on b247 b641 )
    ( on b173 b247 )
    ( on b483 b173 )
    ( on b664 b483 )
    ( on b185 b664 )
    ( on b411 b185 )
    ( on b682 b411 )
    ( on b654 b682 )
    ( on b48 b654 )
    ( on b932 b48 )
    ( on b453 b932 )
    ( on b578 b453 )
    ( on b957 b578 )
    ( on b39 b957 )
    ( on b265 b39 )
    ( on b94 b265 )
    ( on b763 b94 )
    ( on b950 b763 )
    ( on b344 b950 )
    ( on b135 b344 )
    ( on b964 b135 )
    ( on b245 b964 )
    ( clear b245 )
  )
  ( :goal
    ( and
      ( clear b862 )
    )
  )
)
