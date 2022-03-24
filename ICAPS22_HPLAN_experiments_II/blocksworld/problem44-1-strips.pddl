( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b597 - block
    b93 - block
    b896 - block
    b759 - block
    b918 - block
    b692 - block
    b377 - block
    b750 - block
    b276 - block
    b416 - block
    b228 - block
    b484 - block
    b690 - block
    b647 - block
    b257 - block
    b716 - block
    b234 - block
    b382 - block
    b803 - block
    b630 - block
    b201 - block
    b198 - block
    b498 - block
    b592 - block
    b180 - block
    b481 - block
    b543 - block
    b67 - block
    b627 - block
    b545 - block
    b595 - block
    b608 - block
    b282 - block
    b948 - block
    b787 - block
    b312 - block
    b625 - block
    b119 - block
    b286 - block
    b341 - block
    b477 - block
    b808 - block
    b321 - block
    b193 - block
    b24 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b597 )
    ( on b93 b597 )
    ( on b896 b93 )
    ( on b759 b896 )
    ( on b918 b759 )
    ( on b692 b918 )
    ( on b377 b692 )
    ( on b750 b377 )
    ( on b276 b750 )
    ( on b416 b276 )
    ( on b228 b416 )
    ( on b484 b228 )
    ( on b690 b484 )
    ( on b647 b690 )
    ( on b257 b647 )
    ( on b716 b257 )
    ( on b234 b716 )
    ( on b382 b234 )
    ( on b803 b382 )
    ( on b630 b803 )
    ( on b201 b630 )
    ( on b198 b201 )
    ( on b498 b198 )
    ( on b592 b498 )
    ( on b180 b592 )
    ( on b481 b180 )
    ( on b543 b481 )
    ( on b67 b543 )
    ( on b627 b67 )
    ( on b545 b627 )
    ( on b595 b545 )
    ( on b608 b595 )
    ( on b282 b608 )
    ( on b948 b282 )
    ( on b787 b948 )
    ( on b312 b787 )
    ( on b625 b312 )
    ( on b119 b625 )
    ( on b286 b119 )
    ( on b341 b286 )
    ( on b477 b341 )
    ( on b808 b477 )
    ( on b321 b808 )
    ( on b193 b321 )
    ( on b24 b193 )
    ( clear b24 )
  )
  ( :goal
    ( and
      ( clear b597 )
    )
  )
)
