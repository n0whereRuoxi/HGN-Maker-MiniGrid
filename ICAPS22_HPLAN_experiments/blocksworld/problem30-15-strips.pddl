( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b343 - block
    b939 - block
    b559 - block
    b349 - block
    b654 - block
    b217 - block
    b8 - block
    b239 - block
    b498 - block
    b518 - block
    b218 - block
    b249 - block
    b499 - block
    b943 - block
    b544 - block
    b94 - block
    b778 - block
    b873 - block
    b171 - block
    b683 - block
    b732 - block
    b56 - block
    b332 - block
    b791 - block
    b737 - block
    b990 - block
    b862 - block
    b638 - block
    b867 - block
    b27 - block
    b309 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b343 )
    ( on b939 b343 )
    ( on b559 b939 )
    ( on b349 b559 )
    ( on b654 b349 )
    ( on b217 b654 )
    ( on b8 b217 )
    ( on b239 b8 )
    ( on b498 b239 )
    ( on b518 b498 )
    ( on b218 b518 )
    ( on b249 b218 )
    ( on b499 b249 )
    ( on b943 b499 )
    ( on b544 b943 )
    ( on b94 b544 )
    ( on b778 b94 )
    ( on b873 b778 )
    ( on b171 b873 )
    ( on b683 b171 )
    ( on b732 b683 )
    ( on b56 b732 )
    ( on b332 b56 )
    ( on b791 b332 )
    ( on b737 b791 )
    ( on b990 b737 )
    ( on b862 b990 )
    ( on b638 b862 )
    ( on b867 b638 )
    ( on b27 b867 )
    ( on b309 b27 )
    ( clear b309 )
  )
  ( :goal
    ( and
      ( clear b343 )
    )
  )
)
