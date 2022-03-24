( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b303 - block
    b662 - block
    b506 - block
    b705 - block
    b550 - block
    b895 - block
    b266 - block
    b261 - block
    b409 - block
    b614 - block
    b456 - block
    b736 - block
    b71 - block
    b358 - block
    b878 - block
    b169 - block
    b483 - block
    b503 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b303 )
    ( on b662 b303 )
    ( on b506 b662 )
    ( on b705 b506 )
    ( on b550 b705 )
    ( on b895 b550 )
    ( on b266 b895 )
    ( on b261 b266 )
    ( on b409 b261 )
    ( on b614 b409 )
    ( on b456 b614 )
    ( on b736 b456 )
    ( on b71 b736 )
    ( on b358 b71 )
    ( on b878 b358 )
    ( on b169 b878 )
    ( on b483 b169 )
    ( on b503 b483 )
    ( clear b503 )
  )
  ( :tasks
    ( Make-17Pile b662 b506 b705 b550 b895 b266 b261 b409 b614 b456 b736 b71 b358 b878 b169 b483 b503 )
  )
)
