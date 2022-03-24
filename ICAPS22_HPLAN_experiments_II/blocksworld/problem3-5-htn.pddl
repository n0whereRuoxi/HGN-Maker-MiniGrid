( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b927 - block
    b892 - block
    b509 - block
    b364 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b927 )
    ( on b892 b927 )
    ( on b509 b892 )
    ( on b364 b509 )
    ( clear b364 )
  )
  ( :tasks
    ( Make-3Pile b892 b509 b364 )
  )
)
