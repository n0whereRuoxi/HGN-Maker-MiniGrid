( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b470 - block
    b668 - block
    b836 - block
    b40 - block
    b635 - block
    b508 - block
    b888 - block
    b125 - block
    b687 - block
    b941 - block
    b727 - block
    b52 - block
    b398 - block
    b245 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b470 )
    ( on b668 b470 )
    ( on b836 b668 )
    ( on b40 b836 )
    ( on b635 b40 )
    ( on b508 b635 )
    ( on b888 b508 )
    ( on b125 b888 )
    ( on b687 b125 )
    ( on b941 b687 )
    ( on b727 b941 )
    ( on b52 b727 )
    ( on b398 b52 )
    ( on b245 b398 )
    ( clear b245 )
  )
  ( :goal
    ( and
      ( clear b470 )
    )
  )
)
