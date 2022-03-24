( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b687 - block
    b266 - block
    b384 - block
    b690 - block
    b313 - block
    b593 - block
    b674 - block
    b611 - block
    b885 - block
    b261 - block
    b626 - block
    b503 - block
    b282 - block
    b112 - block
    b802 - block
    b238 - block
    b37 - block
    b924 - block
    b14 - block
    b370 - block
    b314 - block
    b401 - block
    b908 - block
    b337 - block
    b412 - block
    b613 - block
    b477 - block
    b570 - block
    b879 - block
    b549 - block
    b94 - block
    b185 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b687 )
    ( on b266 b687 )
    ( on b384 b266 )
    ( on b690 b384 )
    ( on b313 b690 )
    ( on b593 b313 )
    ( on b674 b593 )
    ( on b611 b674 )
    ( on b885 b611 )
    ( on b261 b885 )
    ( on b626 b261 )
    ( on b503 b626 )
    ( on b282 b503 )
    ( on b112 b282 )
    ( on b802 b112 )
    ( on b238 b802 )
    ( on b37 b238 )
    ( on b924 b37 )
    ( on b14 b924 )
    ( on b370 b14 )
    ( on b314 b370 )
    ( on b401 b314 )
    ( on b908 b401 )
    ( on b337 b908 )
    ( on b412 b337 )
    ( on b613 b412 )
    ( on b477 b613 )
    ( on b570 b477 )
    ( on b879 b570 )
    ( on b549 b879 )
    ( on b94 b549 )
    ( on b185 b94 )
    ( clear b185 )
  )
  ( :goal
    ( and
      ( clear b687 )
    )
  )
)
