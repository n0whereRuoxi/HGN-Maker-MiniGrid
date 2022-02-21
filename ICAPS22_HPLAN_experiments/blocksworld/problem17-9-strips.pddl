( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b916 - block
    b654 - block
    b727 - block
    b76 - block
    b382 - block
    b911 - block
    b150 - block
    b521 - block
    b559 - block
    b775 - block
    b448 - block
    b23 - block
    b907 - block
    b801 - block
    b829 - block
    b948 - block
    b248 - block
    b59 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b916 )
    ( on b654 b916 )
    ( on b727 b654 )
    ( on b76 b727 )
    ( on b382 b76 )
    ( on b911 b382 )
    ( on b150 b911 )
    ( on b521 b150 )
    ( on b559 b521 )
    ( on b775 b559 )
    ( on b448 b775 )
    ( on b23 b448 )
    ( on b907 b23 )
    ( on b801 b907 )
    ( on b829 b801 )
    ( on b948 b829 )
    ( on b248 b948 )
    ( on b59 b248 )
    ( clear b59 )
  )
  ( :goal
    ( and
      ( clear b916 )
    )
  )
)
