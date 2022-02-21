( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b812 - block
    b587 - block
    b479 - block
    b470 - block
    b800 - block
    b956 - block
    b498 - block
    b9 - block
    b575 - block
    b308 - block
    b625 - block
    b963 - block
    b604 - block
    b454 - block
    b732 - block
    b234 - block
    b983 - block
    b941 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b812 )
    ( on b587 b812 )
    ( on b479 b587 )
    ( on b470 b479 )
    ( on b800 b470 )
    ( on b956 b800 )
    ( on b498 b956 )
    ( on b9 b498 )
    ( on b575 b9 )
    ( on b308 b575 )
    ( on b625 b308 )
    ( on b963 b625 )
    ( on b604 b963 )
    ( on b454 b604 )
    ( on b732 b454 )
    ( on b234 b732 )
    ( on b983 b234 )
    ( on b941 b983 )
    ( clear b941 )
  )
  ( :goal
    ( and
      ( clear b812 )
    )
  )
)
