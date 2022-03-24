( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b258 - block
    b655 - block
    b254 - block
    b475 - block
    b644 - block
    b533 - block
    b857 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b258 )
    ( on b655 b258 )
    ( on b254 b655 )
    ( on b475 b254 )
    ( on b644 b475 )
    ( on b533 b644 )
    ( on b857 b533 )
    ( clear b857 )
  )
  ( :tasks
    ( Make-6Pile b655 b254 b475 b644 b533 b857 )
  )
)
