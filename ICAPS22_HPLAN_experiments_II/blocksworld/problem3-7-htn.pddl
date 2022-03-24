( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b337 - block
    b816 - block
    b270 - block
    b560 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b337 )
    ( on b816 b337 )
    ( on b270 b816 )
    ( on b560 b270 )
    ( clear b560 )
  )
  ( :tasks
    ( Make-3Pile b816 b270 b560 )
  )
)
