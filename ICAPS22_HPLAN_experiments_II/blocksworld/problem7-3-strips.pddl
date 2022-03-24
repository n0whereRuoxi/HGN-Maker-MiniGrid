( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b851 - block
    b606 - block
    b573 - block
    b828 - block
    b309 - block
    b297 - block
    b135 - block
    b892 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b851 )
    ( on b606 b851 )
    ( on b573 b606 )
    ( on b828 b573 )
    ( on b309 b828 )
    ( on b297 b309 )
    ( on b135 b297 )
    ( on b892 b135 )
    ( clear b892 )
  )
  ( :goal
    ( and
      ( clear b851 )
    )
  )
)
