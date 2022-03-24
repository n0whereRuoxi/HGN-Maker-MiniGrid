( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b968 - block
    b394 - block
    b397 - block
    b477 - block
    b255 - block
    b289 - block
    b176 - block
    b414 - block
    b445 - block
    b24 - block
    b27 - block
    b310 - block
    b112 - block
    b455 - block
    b25 - block
    b333 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b968 )
    ( on b394 b968 )
    ( on b397 b394 )
    ( on b477 b397 )
    ( on b255 b477 )
    ( on b289 b255 )
    ( on b176 b289 )
    ( on b414 b176 )
    ( on b445 b414 )
    ( on b24 b445 )
    ( on b27 b24 )
    ( on b310 b27 )
    ( on b112 b310 )
    ( on b455 b112 )
    ( on b25 b455 )
    ( on b333 b25 )
    ( clear b333 )
  )
  ( :tasks
    ( Make-15Pile b394 b397 b477 b255 b289 b176 b414 b445 b24 b27 b310 b112 b455 b25 b333 )
  )
)
