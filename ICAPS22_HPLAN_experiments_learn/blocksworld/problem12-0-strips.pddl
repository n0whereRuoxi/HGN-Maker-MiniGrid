( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b583 - block
    b338 - block
    b261 - block
    b316 - block
    b548 - block
    b425 - block
    b566 - block
    b343 - block
    b212 - block
    b310 - block
    b778 - block
    b469 - block
    b117 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b583 )
    ( on b338 b583 )
    ( on b261 b338 )
    ( on b316 b261 )
    ( on b548 b316 )
    ( on b425 b548 )
    ( on b566 b425 )
    ( on b343 b566 )
    ( on b212 b343 )
    ( on b310 b212 )
    ( on b778 b310 )
    ( on b469 b778 )
    ( on b117 b469 )
    ( clear b117 )
  )
  ( :goal
    ( and
      ( clear b583 )
    )
  )
)
