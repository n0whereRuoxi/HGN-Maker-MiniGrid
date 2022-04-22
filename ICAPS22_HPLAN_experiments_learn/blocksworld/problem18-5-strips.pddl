( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b279 - block
    b844 - block
    b260 - block
    b698 - block
    b554 - block
    b909 - block
    b489 - block
    b339 - block
    b751 - block
    b394 - block
    b917 - block
    b606 - block
    b57 - block
    b881 - block
    b710 - block
    b514 - block
    b406 - block
    b982 - block
    b857 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b279 )
    ( on b844 b279 )
    ( on b260 b844 )
    ( on b698 b260 )
    ( on b554 b698 )
    ( on b909 b554 )
    ( on b489 b909 )
    ( on b339 b489 )
    ( on b751 b339 )
    ( on b394 b751 )
    ( on b917 b394 )
    ( on b606 b917 )
    ( on b57 b606 )
    ( on b881 b57 )
    ( on b710 b881 )
    ( on b514 b710 )
    ( on b406 b514 )
    ( on b982 b406 )
    ( on b857 b982 )
    ( clear b857 )
  )
  ( :goal
    ( and
      ( clear b279 )
    )
  )
)
