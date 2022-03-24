( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b341 - block
    b690 - block
    b524 - block
    b655 - block
    b389 - block
    b96 - block
    b460 - block
    b83 - block
    b169 - block
    b877 - block
    b606 - block
    b285 - block
    b241 - block
    b603 - block
    b586 - block
    b730 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b341 )
    ( on b690 b341 )
    ( on b524 b690 )
    ( on b655 b524 )
    ( on b389 b655 )
    ( on b96 b389 )
    ( on b460 b96 )
    ( on b83 b460 )
    ( on b169 b83 )
    ( on b877 b169 )
    ( on b606 b877 )
    ( on b285 b606 )
    ( on b241 b285 )
    ( on b603 b241 )
    ( on b586 b603 )
    ( on b730 b586 )
    ( clear b730 )
  )
  ( :goal
    ( and
      ( clear b341 )
    )
  )
)
