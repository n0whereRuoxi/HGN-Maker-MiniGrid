( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b775 - block
    b355 - block
    b297 - block
    b423 - block
    b540 - block
    b134 - block
    b673 - block
    b465 - block
    b550 - block
    b748 - block
    b342 - block
    b344 - block
    b69 - block
    b652 - block
    b335 - block
    b557 - block
    b321 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b775 )
    ( on b355 b775 )
    ( on b297 b355 )
    ( on b423 b297 )
    ( on b540 b423 )
    ( on b134 b540 )
    ( on b673 b134 )
    ( on b465 b673 )
    ( on b550 b465 )
    ( on b748 b550 )
    ( on b342 b748 )
    ( on b344 b342 )
    ( on b69 b344 )
    ( on b652 b69 )
    ( on b335 b652 )
    ( on b557 b335 )
    ( on b321 b557 )
    ( clear b321 )
  )
  ( :goal
    ( and
      ( clear b775 )
    )
  )
)
