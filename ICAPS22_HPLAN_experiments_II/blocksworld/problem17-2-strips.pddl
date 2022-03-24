( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b399 - block
    b19 - block
    b396 - block
    b405 - block
    b367 - block
    b879 - block
    b344 - block
    b874 - block
    b23 - block
    b841 - block
    b850 - block
    b527 - block
    b968 - block
    b890 - block
    b316 - block
    b241 - block
    b870 - block
    b213 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b399 )
    ( on b19 b399 )
    ( on b396 b19 )
    ( on b405 b396 )
    ( on b367 b405 )
    ( on b879 b367 )
    ( on b344 b879 )
    ( on b874 b344 )
    ( on b23 b874 )
    ( on b841 b23 )
    ( on b850 b841 )
    ( on b527 b850 )
    ( on b968 b527 )
    ( on b890 b968 )
    ( on b316 b890 )
    ( on b241 b316 )
    ( on b870 b241 )
    ( on b213 b870 )
    ( clear b213 )
  )
  ( :goal
    ( and
      ( clear b399 )
    )
  )
)
