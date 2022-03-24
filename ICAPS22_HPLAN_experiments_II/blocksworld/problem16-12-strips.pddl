( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b167 - block
    b147 - block
    b9 - block
    b837 - block
    b464 - block
    b750 - block
    b814 - block
    b342 - block
    b155 - block
    b453 - block
    b325 - block
    b231 - block
    b906 - block
    b552 - block
    b621 - block
    b294 - block
    b597 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b167 )
    ( on b147 b167 )
    ( on b9 b147 )
    ( on b837 b9 )
    ( on b464 b837 )
    ( on b750 b464 )
    ( on b814 b750 )
    ( on b342 b814 )
    ( on b155 b342 )
    ( on b453 b155 )
    ( on b325 b453 )
    ( on b231 b325 )
    ( on b906 b231 )
    ( on b552 b906 )
    ( on b621 b552 )
    ( on b294 b621 )
    ( on b597 b294 )
    ( clear b597 )
  )
  ( :goal
    ( and
      ( clear b167 )
    )
  )
)
