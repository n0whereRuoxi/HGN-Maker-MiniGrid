( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b382 - block
    b263 - block
    b229 - block
    b594 - block
    b805 - block
    b749 - block
    b464 - block
    b568 - block
    b321 - block
    b138 - block
    b830 - block
    b817 - block
    b801 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b382 )
    ( on b263 b382 )
    ( on b229 b263 )
    ( on b594 b229 )
    ( on b805 b594 )
    ( on b749 b805 )
    ( on b464 b749 )
    ( on b568 b464 )
    ( on b321 b568 )
    ( on b138 b321 )
    ( on b830 b138 )
    ( on b817 b830 )
    ( on b801 b817 )
    ( clear b801 )
  )
  ( :goal
    ( and
      ( clear b382 )
    )
  )
)
