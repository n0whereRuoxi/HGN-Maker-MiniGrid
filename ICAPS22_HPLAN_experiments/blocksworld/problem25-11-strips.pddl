( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b194 - block
    b188 - block
    b79 - block
    b824 - block
    b273 - block
    b344 - block
    b49 - block
    b848 - block
    b610 - block
    b545 - block
    b930 - block
    b593 - block
    b347 - block
    b95 - block
    b379 - block
    b39 - block
    b461 - block
    b312 - block
    b32 - block
    b633 - block
    b807 - block
    b291 - block
    b959 - block
    b343 - block
    b795 - block
    b443 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b194 )
    ( on b188 b194 )
    ( on b79 b188 )
    ( on b824 b79 )
    ( on b273 b824 )
    ( on b344 b273 )
    ( on b49 b344 )
    ( on b848 b49 )
    ( on b610 b848 )
    ( on b545 b610 )
    ( on b930 b545 )
    ( on b593 b930 )
    ( on b347 b593 )
    ( on b95 b347 )
    ( on b379 b95 )
    ( on b39 b379 )
    ( on b461 b39 )
    ( on b312 b461 )
    ( on b32 b312 )
    ( on b633 b32 )
    ( on b807 b633 )
    ( on b291 b807 )
    ( on b959 b291 )
    ( on b343 b959 )
    ( on b795 b343 )
    ( on b443 b795 )
    ( clear b443 )
  )
  ( :goal
    ( and
      ( clear b194 )
    )
  )
)
