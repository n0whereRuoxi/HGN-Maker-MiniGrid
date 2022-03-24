( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b333 - block
    b704 - block
    b652 - block
    b191 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b333 )
    ( on b704 b333 )
    ( on b652 b704 )
    ( on b191 b652 )
    ( clear b191 )
  )
  ( :tasks
    ( Make-3Pile b704 b652 b191 )
  )
)
