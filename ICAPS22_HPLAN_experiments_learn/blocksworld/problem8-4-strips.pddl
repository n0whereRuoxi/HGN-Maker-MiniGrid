( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b88 - block
    b477 - block
    b674 - block
    b840 - block
    b215 - block
    b94 - block
    b845 - block
    b851 - block
    b330 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b88 )
    ( on b477 b88 )
    ( on b674 b477 )
    ( on b840 b674 )
    ( on b215 b840 )
    ( on b94 b215 )
    ( on b845 b94 )
    ( on b851 b845 )
    ( on b330 b851 )
    ( clear b330 )
  )
  ( :goal
    ( and
      ( clear b88 )
    )
  )
)
