( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b566 - block
    b8 - block
    b338 - block
    b946 - block
    b572 - block
    b259 - block
    b203 - block
    b428 - block
    b271 - block
    b981 - block
    b637 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b566 )
    ( on b8 b566 )
    ( on b338 b8 )
    ( on b946 b338 )
    ( on b572 b946 )
    ( on b259 b572 )
    ( on b203 b259 )
    ( on b428 b203 )
    ( on b271 b428 )
    ( on b981 b271 )
    ( on b637 b981 )
    ( clear b637 )
  )
  ( :goal
    ( and
      ( clear b566 )
    )
  )
)
