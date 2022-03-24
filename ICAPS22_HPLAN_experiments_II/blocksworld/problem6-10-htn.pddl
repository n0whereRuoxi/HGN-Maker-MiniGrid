( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b551 - block
    b730 - block
    b820 - block
    b934 - block
    b381 - block
    b787 - block
    b706 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b551 )
    ( on b730 b551 )
    ( on b820 b730 )
    ( on b934 b820 )
    ( on b381 b934 )
    ( on b787 b381 )
    ( on b706 b787 )
    ( clear b706 )
  )
  ( :tasks
    ( Make-6Pile b730 b820 b934 b381 b787 b706 )
  )
)
