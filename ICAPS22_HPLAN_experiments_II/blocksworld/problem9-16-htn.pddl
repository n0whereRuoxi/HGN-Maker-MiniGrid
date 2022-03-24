( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b812 - block
    b965 - block
    b175 - block
    b363 - block
    b64 - block
    b57 - block
    b350 - block
    b953 - block
    b477 - block
    b243 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b812 )
    ( on b965 b812 )
    ( on b175 b965 )
    ( on b363 b175 )
    ( on b64 b363 )
    ( on b57 b64 )
    ( on b350 b57 )
    ( on b953 b350 )
    ( on b477 b953 )
    ( on b243 b477 )
    ( clear b243 )
  )
  ( :tasks
    ( Make-9Pile b965 b175 b363 b64 b57 b350 b953 b477 b243 )
  )
)
