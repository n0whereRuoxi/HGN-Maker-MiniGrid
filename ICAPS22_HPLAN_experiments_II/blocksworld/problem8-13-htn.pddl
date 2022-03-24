( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b54 - block
    b659 - block
    b192 - block
    b541 - block
    b563 - block
    b518 - block
    b755 - block
    b311 - block
    b47 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b54 )
    ( on b659 b54 )
    ( on b192 b659 )
    ( on b541 b192 )
    ( on b563 b541 )
    ( on b518 b563 )
    ( on b755 b518 )
    ( on b311 b755 )
    ( on b47 b311 )
    ( clear b47 )
  )
  ( :tasks
    ( Make-8Pile b659 b192 b541 b563 b518 b755 b311 b47 )
  )
)
