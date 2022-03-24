( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b580 - block
    b817 - block
    b194 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b580 )
    ( on b817 b580 )
    ( on b194 b817 )
    ( clear b194 )
  )
  ( :tasks
    ( Make-2Pile b817 b194 )
  )
)
