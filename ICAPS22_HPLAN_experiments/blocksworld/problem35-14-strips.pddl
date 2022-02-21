( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b771 - block
    b456 - block
    b718 - block
    b62 - block
    b375 - block
    b518 - block
    b736 - block
    b627 - block
    b76 - block
    b230 - block
    b49 - block
    b900 - block
    b485 - block
    b633 - block
    b424 - block
    b306 - block
    b498 - block
    b21 - block
    b234 - block
    b665 - block
    b346 - block
    b447 - block
    b477 - block
    b740 - block
    b707 - block
    b991 - block
    b619 - block
    b461 - block
    b530 - block
    b514 - block
    b150 - block
    b105 - block
    b652 - block
    b349 - block
    b492 - block
    b246 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b771 )
    ( on b456 b771 )
    ( on b718 b456 )
    ( on b62 b718 )
    ( on b375 b62 )
    ( on b518 b375 )
    ( on b736 b518 )
    ( on b627 b736 )
    ( on b76 b627 )
    ( on b230 b76 )
    ( on b49 b230 )
    ( on b900 b49 )
    ( on b485 b900 )
    ( on b633 b485 )
    ( on b424 b633 )
    ( on b306 b424 )
    ( on b498 b306 )
    ( on b21 b498 )
    ( on b234 b21 )
    ( on b665 b234 )
    ( on b346 b665 )
    ( on b447 b346 )
    ( on b477 b447 )
    ( on b740 b477 )
    ( on b707 b740 )
    ( on b991 b707 )
    ( on b619 b991 )
    ( on b461 b619 )
    ( on b530 b461 )
    ( on b514 b530 )
    ( on b150 b514 )
    ( on b105 b150 )
    ( on b652 b105 )
    ( on b349 b652 )
    ( on b492 b349 )
    ( on b246 b492 )
    ( clear b246 )
  )
  ( :goal
    ( and
      ( clear b771 )
    )
  )
)
