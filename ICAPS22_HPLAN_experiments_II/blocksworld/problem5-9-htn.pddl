( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b301 - block
    b191 - block
    b327 - block
    b420 - block
    b361 - block
    b337 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b301 )
    ( on b191 b301 )
    ( on b327 b191 )
    ( on b420 b327 )
    ( on b361 b420 )
    ( on b337 b361 )
    ( clear b337 )
  )
  ( :tasks
    ( Make-5Pile b191 b327 b420 b361 b337 )
  )
)
