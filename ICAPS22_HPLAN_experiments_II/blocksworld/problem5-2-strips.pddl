( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b645 - block
    b276 - block
    b587 - block
    b396 - block
    b934 - block
    b101 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b645 )
    ( on b276 b645 )
    ( on b587 b276 )
    ( on b396 b587 )
    ( on b934 b396 )
    ( on b101 b934 )
    ( clear b101 )
  )
  ( :goal
    ( and
      ( clear b645 )
    )
  )
)
