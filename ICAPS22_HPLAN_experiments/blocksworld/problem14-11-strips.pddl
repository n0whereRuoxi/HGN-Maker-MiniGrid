( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b530 - block
    b406 - block
    b490 - block
    b33 - block
    b667 - block
    b200 - block
    b374 - block
    b67 - block
    b673 - block
    b420 - block
    b562 - block
    b122 - block
    b960 - block
    b700 - block
    b141 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b530 )
    ( on b406 b530 )
    ( on b490 b406 )
    ( on b33 b490 )
    ( on b667 b33 )
    ( on b200 b667 )
    ( on b374 b200 )
    ( on b67 b374 )
    ( on b673 b67 )
    ( on b420 b673 )
    ( on b562 b420 )
    ( on b122 b562 )
    ( on b960 b122 )
    ( on b700 b960 )
    ( on b141 b700 )
    ( clear b141 )
  )
  ( :goal
    ( and
      ( clear b530 )
    )
  )
)
