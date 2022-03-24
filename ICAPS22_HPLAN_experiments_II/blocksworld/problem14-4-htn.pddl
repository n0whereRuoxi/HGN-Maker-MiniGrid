( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b551 - block
    b12 - block
    b858 - block
    b184 - block
    b54 - block
    b779 - block
    b613 - block
    b860 - block
    b954 - block
    b477 - block
    b245 - block
    b373 - block
    b123 - block
    b217 - block
    b459 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b551 )
    ( on b12 b551 )
    ( on b858 b12 )
    ( on b184 b858 )
    ( on b54 b184 )
    ( on b779 b54 )
    ( on b613 b779 )
    ( on b860 b613 )
    ( on b954 b860 )
    ( on b477 b954 )
    ( on b245 b477 )
    ( on b373 b245 )
    ( on b123 b373 )
    ( on b217 b123 )
    ( on b459 b217 )
    ( clear b459 )
  )
  ( :tasks
    ( Make-14Pile b12 b858 b184 b54 b779 b613 b860 b954 b477 b245 b373 b123 b217 b459 )
  )
)
