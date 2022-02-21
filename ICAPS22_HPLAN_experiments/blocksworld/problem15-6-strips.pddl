( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b363 - block
    b953 - block
    b606 - block
    b937 - block
    b797 - block
    b855 - block
    b989 - block
    b801 - block
    b886 - block
    b95 - block
    b447 - block
    b258 - block
    b200 - block
    b568 - block
    b321 - block
    b795 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b363 )
    ( on b953 b363 )
    ( on b606 b953 )
    ( on b937 b606 )
    ( on b797 b937 )
    ( on b855 b797 )
    ( on b989 b855 )
    ( on b801 b989 )
    ( on b886 b801 )
    ( on b95 b886 )
    ( on b447 b95 )
    ( on b258 b447 )
    ( on b200 b258 )
    ( on b568 b200 )
    ( on b321 b568 )
    ( on b795 b321 )
    ( clear b795 )
  )
  ( :goal
    ( and
      ( clear b363 )
    )
  )
)
