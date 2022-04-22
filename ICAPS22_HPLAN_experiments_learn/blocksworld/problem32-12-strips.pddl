( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b545 - block
    b146 - block
    b823 - block
    b265 - block
    b895 - block
    b529 - block
    b461 - block
    b845 - block
    b859 - block
    b433 - block
    b401 - block
    b963 - block
    b566 - block
    b585 - block
    b382 - block
    b59 - block
    b342 - block
    b636 - block
    b362 - block
    b986 - block
    b627 - block
    b324 - block
    b2 - block
    b483 - block
    b274 - block
    b192 - block
    b261 - block
    b223 - block
    b52 - block
    b827 - block
    b694 - block
    b318 - block
    b519 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b545 )
    ( on b146 b545 )
    ( on b823 b146 )
    ( on b265 b823 )
    ( on b895 b265 )
    ( on b529 b895 )
    ( on b461 b529 )
    ( on b845 b461 )
    ( on b859 b845 )
    ( on b433 b859 )
    ( on b401 b433 )
    ( on b963 b401 )
    ( on b566 b963 )
    ( on b585 b566 )
    ( on b382 b585 )
    ( on b59 b382 )
    ( on b342 b59 )
    ( on b636 b342 )
    ( on b362 b636 )
    ( on b986 b362 )
    ( on b627 b986 )
    ( on b324 b627 )
    ( on b2 b324 )
    ( on b483 b2 )
    ( on b274 b483 )
    ( on b192 b274 )
    ( on b261 b192 )
    ( on b223 b261 )
    ( on b52 b223 )
    ( on b827 b52 )
    ( on b694 b827 )
    ( on b318 b694 )
    ( on b519 b318 )
    ( clear b519 )
  )
  ( :goal
    ( and
      ( clear b545 )
    )
  )
)
