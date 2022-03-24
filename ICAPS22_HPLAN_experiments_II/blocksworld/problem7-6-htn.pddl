( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b4 - block
    b910 - block
    b907 - block
    b732 - block
    b72 - block
    b364 - block
    b381 - block
    b918 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b4 )
    ( on b910 b4 )
    ( on b907 b910 )
    ( on b732 b907 )
    ( on b72 b732 )
    ( on b364 b72 )
    ( on b381 b364 )
    ( on b918 b381 )
    ( clear b918 )
  )
  ( :tasks
    ( Make-7Pile b910 b907 b732 b72 b364 b381 b918 )
  )
)
