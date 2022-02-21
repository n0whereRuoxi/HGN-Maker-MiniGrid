( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b842 - block
    b66 - block
    b317 - block
    b392 - block
    b972 - block
    b207 - block
    b512 - block
    b437 - block
    b342 - block
    b840 - block
    b39 - block
    b986 - block
    b424 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b842 )
    ( on b66 b842 )
    ( on b317 b66 )
    ( on b392 b317 )
    ( on b972 b392 )
    ( on b207 b972 )
    ( on b512 b207 )
    ( on b437 b512 )
    ( on b342 b437 )
    ( on b840 b342 )
    ( on b39 b840 )
    ( on b986 b39 )
    ( on b424 b986 )
    ( clear b424 )
  )
  ( :goal
    ( and
      ( clear b842 )
    )
  )
)
