( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b586 - block
    b482 - block
    b630 - block
    b207 - block
    b29 - block
    b958 - block
    b526 - block
    b342 - block
    b877 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b586 )
    ( on b482 b586 )
    ( on b630 b482 )
    ( on b207 b630 )
    ( on b29 b207 )
    ( on b958 b29 )
    ( on b526 b958 )
    ( on b342 b526 )
    ( on b877 b342 )
    ( clear b877 )
  )
  ( :goal
    ( and
      ( clear b586 )
    )
  )
)
