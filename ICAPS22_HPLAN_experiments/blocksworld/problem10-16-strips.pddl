( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b976 - block
    b572 - block
    b288 - block
    b401 - block
    b205 - block
    b875 - block
    b810 - block
    b490 - block
    b996 - block
    b445 - block
    b56 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b976 )
    ( on b572 b976 )
    ( on b288 b572 )
    ( on b401 b288 )
    ( on b205 b401 )
    ( on b875 b205 )
    ( on b810 b875 )
    ( on b490 b810 )
    ( on b996 b490 )
    ( on b445 b996 )
    ( on b56 b445 )
    ( clear b56 )
  )
  ( :goal
    ( and
      ( clear b976 )
    )
  )
)
