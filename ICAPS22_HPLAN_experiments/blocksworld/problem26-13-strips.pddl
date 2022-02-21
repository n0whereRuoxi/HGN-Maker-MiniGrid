( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b786 - block
    b370 - block
    b294 - block
    b622 - block
    b488 - block
    b229 - block
    b774 - block
    b73 - block
    b710 - block
    b522 - block
    b354 - block
    b487 - block
    b585 - block
    b357 - block
    b449 - block
    b956 - block
    b145 - block
    b656 - block
    b422 - block
    b328 - block
    b568 - block
    b112 - block
    b181 - block
    b234 - block
    b68 - block
    b375 - block
    b429 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b786 )
    ( on b370 b786 )
    ( on b294 b370 )
    ( on b622 b294 )
    ( on b488 b622 )
    ( on b229 b488 )
    ( on b774 b229 )
    ( on b73 b774 )
    ( on b710 b73 )
    ( on b522 b710 )
    ( on b354 b522 )
    ( on b487 b354 )
    ( on b585 b487 )
    ( on b357 b585 )
    ( on b449 b357 )
    ( on b956 b449 )
    ( on b145 b956 )
    ( on b656 b145 )
    ( on b422 b656 )
    ( on b328 b422 )
    ( on b568 b328 )
    ( on b112 b568 )
    ( on b181 b112 )
    ( on b234 b181 )
    ( on b68 b234 )
    ( on b375 b68 )
    ( on b429 b375 )
    ( clear b429 )
  )
  ( :goal
    ( and
      ( clear b786 )
    )
  )
)
