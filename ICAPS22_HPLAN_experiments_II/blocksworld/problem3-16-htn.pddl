( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b54 - block
    b833 - block
    b190 - block
    b967 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b54 )
    ( on b833 b54 )
    ( on b190 b833 )
    ( on b967 b190 )
    ( clear b967 )
  )
  ( :tasks
    ( Make-3Pile b833 b190 b967 )
  )
)
