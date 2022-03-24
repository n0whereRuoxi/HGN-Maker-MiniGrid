( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b347 - block
    b580 - block
    b59 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b347 )
    ( on b580 b347 )
    ( on b59 b580 )
    ( clear b59 )
  )
  ( :tasks
    ( Make-2Pile b580 b59 )
  )
)
