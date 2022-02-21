( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b86 - block
    b548 - block
    b763 - block
    b814 - block
    b432 - block
    b370 - block
    b652 - block
    b803 - block
    b936 - block
    b20 - block
    b985 - block
    b975 - block
    b408 - block
    b458 - block
    b56 - block
    b331 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b86 )
    ( on b548 b86 )
    ( on b763 b548 )
    ( on b814 b763 )
    ( on b432 b814 )
    ( on b370 b432 )
    ( on b652 b370 )
    ( on b803 b652 )
    ( on b936 b803 )
    ( on b20 b936 )
    ( on b985 b20 )
    ( on b975 b985 )
    ( on b408 b975 )
    ( on b458 b408 )
    ( on b56 b458 )
    ( on b331 b56 )
    ( clear b331 )
  )
  ( :goal
    ( and
      ( clear b86 )
    )
  )
)
