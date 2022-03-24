( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b500 - block
    b44 - block
    b740 - block
    b951 - block
    b526 - block
    b361 - block
    b699 - block
    b245 - block
    b830 - block
    b224 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b500 )
    ( on b44 b500 )
    ( on b740 b44 )
    ( on b951 b740 )
    ( on b526 b951 )
    ( on b361 b526 )
    ( on b699 b361 )
    ( on b245 b699 )
    ( on b830 b245 )
    ( on b224 b830 )
    ( clear b224 )
  )
  ( :tasks
    ( Make-9Pile b44 b740 b951 b526 b361 b699 b245 b830 b224 )
  )
)
