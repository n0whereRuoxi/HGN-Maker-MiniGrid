( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b909 - block
    b841 - block
    b969 - block
    b553 - block
    b110 - block
    b946 - block
    b839 - block
    b179 - block
    b303 - block
    b498 - block
    b115 - block
    b965 - block
    b699 - block
    b276 - block
    b8 - block
    b538 - block
    b45 - block
    b349 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b909 )
    ( on b841 b909 )
    ( on b969 b841 )
    ( on b553 b969 )
    ( on b110 b553 )
    ( on b946 b110 )
    ( on b839 b946 )
    ( on b179 b839 )
    ( on b303 b179 )
    ( on b498 b303 )
    ( on b115 b498 )
    ( on b965 b115 )
    ( on b699 b965 )
    ( on b276 b699 )
    ( on b8 b276 )
    ( on b538 b8 )
    ( on b45 b538 )
    ( on b349 b45 )
    ( clear b349 )
  )
  ( :goal
    ( and
      ( clear b909 )
    )
  )
)
