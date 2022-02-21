( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b664 - block
    b15 - block
    b141 - block
    b2 - block
    b8 - block
    b138 - block
    b585 - block
    b37 - block
    b919 - block
    b884 - block
    b52 - block
    b465 - block
    b376 - block
    b348 - block
    b529 - block
    b55 - block
    b248 - block
    b528 - block
    b550 - block
    b922 - block
    b43 - block
    b363 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b664 )
    ( on b15 b664 )
    ( on b141 b15 )
    ( on b2 b141 )
    ( on b8 b2 )
    ( on b138 b8 )
    ( on b585 b138 )
    ( on b37 b585 )
    ( on b919 b37 )
    ( on b884 b919 )
    ( on b52 b884 )
    ( on b465 b52 )
    ( on b376 b465 )
    ( on b348 b376 )
    ( on b529 b348 )
    ( on b55 b529 )
    ( on b248 b55 )
    ( on b528 b248 )
    ( on b550 b528 )
    ( on b922 b550 )
    ( on b43 b922 )
    ( on b363 b43 )
    ( clear b363 )
  )
  ( :goal
    ( and
      ( clear b664 )
    )
  )
)
