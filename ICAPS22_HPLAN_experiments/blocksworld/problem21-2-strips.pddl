( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b152 - block
    b77 - block
    b215 - block
    b201 - block
    b354 - block
    b524 - block
    b44 - block
    b340 - block
    b514 - block
    b525 - block
    b88 - block
    b623 - block
    b778 - block
    b938 - block
    b75 - block
    b363 - block
    b582 - block
    b688 - block
    b656 - block
    b833 - block
    b506 - block
    b437 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b152 )
    ( on b77 b152 )
    ( on b215 b77 )
    ( on b201 b215 )
    ( on b354 b201 )
    ( on b524 b354 )
    ( on b44 b524 )
    ( on b340 b44 )
    ( on b514 b340 )
    ( on b525 b514 )
    ( on b88 b525 )
    ( on b623 b88 )
    ( on b778 b623 )
    ( on b938 b778 )
    ( on b75 b938 )
    ( on b363 b75 )
    ( on b582 b363 )
    ( on b688 b582 )
    ( on b656 b688 )
    ( on b833 b656 )
    ( on b506 b833 )
    ( on b437 b506 )
    ( clear b437 )
  )
  ( :goal
    ( and
      ( clear b152 )
    )
  )
)
