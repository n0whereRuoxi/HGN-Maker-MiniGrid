( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b103 - block
    b161 - block
    b205 - block
    b790 - block
    b364 - block
    b524 - block
    b389 - block
    b974 - block
    b141 - block
    b429 - block
    b805 - block
    b245 - block
    b113 - block
    b356 - block
    b749 - block
    b810 - block
    b285 - block
    b553 - block
    b361 - block
    b799 - block
    b320 - block
    b663 - block
    b781 - block
    b824 - block
    b374 - block
    b353 - block
    b976 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b103 )
    ( on b161 b103 )
    ( on b205 b161 )
    ( on b790 b205 )
    ( on b364 b790 )
    ( on b524 b364 )
    ( on b389 b524 )
    ( on b974 b389 )
    ( on b141 b974 )
    ( on b429 b141 )
    ( on b805 b429 )
    ( on b245 b805 )
    ( on b113 b245 )
    ( on b356 b113 )
    ( on b749 b356 )
    ( on b810 b749 )
    ( on b285 b810 )
    ( on b553 b285 )
    ( on b361 b553 )
    ( on b799 b361 )
    ( on b320 b799 )
    ( on b663 b320 )
    ( on b781 b663 )
    ( on b824 b781 )
    ( on b374 b824 )
    ( on b353 b374 )
    ( on b976 b353 )
    ( clear b976 )
  )
  ( :goal
    ( and
      ( clear b103 )
    )
  )
)
