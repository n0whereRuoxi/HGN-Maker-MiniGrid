( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b936 - block
    b136 - block
    b388 - block
    b769 - block
    b258 - block
    b350 - block
    b19 - block
    b344 - block
    b529 - block
    b563 - block
    b534 - block
    b502 - block
    b14 - block
    b495 - block
    b657 - block
    b973 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b936 )
    ( on b136 b936 )
    ( on b388 b136 )
    ( on b769 b388 )
    ( on b258 b769 )
    ( on b350 b258 )
    ( on b19 b350 )
    ( on b344 b19 )
    ( on b529 b344 )
    ( on b563 b529 )
    ( on b534 b563 )
    ( on b502 b534 )
    ( on b14 b502 )
    ( on b495 b14 )
    ( on b657 b495 )
    ( on b973 b657 )
    ( clear b973 )
  )
  ( :goal
    ( and
      ( clear b936 )
    )
  )
)
