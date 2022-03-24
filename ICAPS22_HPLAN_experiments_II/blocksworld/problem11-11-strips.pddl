( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b513 - block
    b449 - block
    b882 - block
    b979 - block
    b568 - block
    b45 - block
    b370 - block
    b354 - block
    b647 - block
    b516 - block
    b769 - block
    b310 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b513 )
    ( on b449 b513 )
    ( on b882 b449 )
    ( on b979 b882 )
    ( on b568 b979 )
    ( on b45 b568 )
    ( on b370 b45 )
    ( on b354 b370 )
    ( on b647 b354 )
    ( on b516 b647 )
    ( on b769 b516 )
    ( on b310 b769 )
    ( clear b310 )
  )
  ( :goal
    ( and
      ( clear b513 )
    )
  )
)
