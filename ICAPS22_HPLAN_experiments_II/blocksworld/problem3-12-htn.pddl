( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b94 - block
    b218 - block
    b581 - block
    b232 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b94 )
    ( on b218 b94 )
    ( on b581 b218 )
    ( on b232 b581 )
    ( clear b232 )
  )
  ( :tasks
    ( Make-3Pile b218 b581 b232 )
  )
)
