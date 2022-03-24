( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b493 - block
    b261 - block
    b708 - block
    b748 - block
    b4 - block
    b14 - block
    b772 - block
    b873 - block
    b512 - block
    b870 - block
    b524 - block
    b964 - block
    b568 - block
    b707 - block
    b37 - block
    b645 - block
    b130 - block
    b537 - block
    b352 - block
    b155 - block
    b932 - block
    b919 - block
    b750 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b493 )
    ( on b261 b493 )
    ( on b708 b261 )
    ( on b748 b708 )
    ( on b4 b748 )
    ( on b14 b4 )
    ( on b772 b14 )
    ( on b873 b772 )
    ( on b512 b873 )
    ( on b870 b512 )
    ( on b524 b870 )
    ( on b964 b524 )
    ( on b568 b964 )
    ( on b707 b568 )
    ( on b37 b707 )
    ( on b645 b37 )
    ( on b130 b645 )
    ( on b537 b130 )
    ( on b352 b537 )
    ( on b155 b352 )
    ( on b932 b155 )
    ( on b919 b932 )
    ( on b750 b919 )
    ( clear b750 )
  )
  ( :goal
    ( and
      ( clear b493 )
    )
  )
)
