( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b198 - block
    b505 - block
    b548 - block
    b891 - block
    b362 - block
    b605 - block
    b984 - block
    b279 - block
    b636 - block
    b590 - block
    b472 - block
    b650 - block
    b383 - block
    b392 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b198 )
    ( on b505 b198 )
    ( on b548 b505 )
    ( on b891 b548 )
    ( on b362 b891 )
    ( on b605 b362 )
    ( on b984 b605 )
    ( on b279 b984 )
    ( on b636 b279 )
    ( on b590 b636 )
    ( on b472 b590 )
    ( on b650 b472 )
    ( on b383 b650 )
    ( on b392 b383 )
    ( clear b392 )
  )
  ( :goal
    ( and
      ( clear b198 )
    )
  )
)
