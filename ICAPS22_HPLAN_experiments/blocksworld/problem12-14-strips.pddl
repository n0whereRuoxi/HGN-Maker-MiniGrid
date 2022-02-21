( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b284 - block
    b844 - block
    b645 - block
    b560 - block
    b681 - block
    b220 - block
    b360 - block
    b573 - block
    b333 - block
    b646 - block
    b841 - block
    b218 - block
    b392 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b284 )
    ( on b844 b284 )
    ( on b645 b844 )
    ( on b560 b645 )
    ( on b681 b560 )
    ( on b220 b681 )
    ( on b360 b220 )
    ( on b573 b360 )
    ( on b333 b573 )
    ( on b646 b333 )
    ( on b841 b646 )
    ( on b218 b841 )
    ( on b392 b218 )
    ( clear b392 )
  )
  ( :goal
    ( and
      ( clear b284 )
    )
  )
)
