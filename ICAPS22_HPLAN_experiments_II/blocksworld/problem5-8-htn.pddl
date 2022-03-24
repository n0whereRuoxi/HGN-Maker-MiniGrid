( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b381 - block
    b790 - block
    b436 - block
    b878 - block
    b173 - block
    b258 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b381 )
    ( on b790 b381 )
    ( on b436 b790 )
    ( on b878 b436 )
    ( on b173 b878 )
    ( on b258 b173 )
    ( clear b258 )
  )
  ( :tasks
    ( Make-5Pile b790 b436 b878 b173 b258 )
  )
)
