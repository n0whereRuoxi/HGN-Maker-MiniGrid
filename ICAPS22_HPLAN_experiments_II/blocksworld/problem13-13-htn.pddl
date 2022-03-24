( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b790 - block
    b771 - block
    b667 - block
    b997 - block
    b503 - block
    b56 - block
    b527 - block
    b412 - block
    b664 - block
    b353 - block
    b254 - block
    b595 - block
    b710 - block
    b470 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b790 )
    ( on b771 b790 )
    ( on b667 b771 )
    ( on b997 b667 )
    ( on b503 b997 )
    ( on b56 b503 )
    ( on b527 b56 )
    ( on b412 b527 )
    ( on b664 b412 )
    ( on b353 b664 )
    ( on b254 b353 )
    ( on b595 b254 )
    ( on b710 b595 )
    ( on b470 b710 )
    ( clear b470 )
  )
  ( :tasks
    ( Make-13Pile b771 b667 b997 b503 b56 b527 b412 b664 b353 b254 b595 b710 b470 )
  )
)
