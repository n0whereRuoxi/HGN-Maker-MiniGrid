( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b981 - block
    b238 - block
    b24 - block
    b992 - block
    b191 - block
    b12 - block
    b252 - block
    b365 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b981 )
    ( on b238 b981 )
    ( on b24 b238 )
    ( on b992 b24 )
    ( on b191 b992 )
    ( on b12 b191 )
    ( on b252 b12 )
    ( on b365 b252 )
    ( clear b365 )
  )
  ( :tasks
    ( Make-7Pile b238 b24 b992 b191 b12 b252 b365 )
  )
)
