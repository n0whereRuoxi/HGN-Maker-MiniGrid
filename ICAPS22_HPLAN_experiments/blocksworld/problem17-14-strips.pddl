( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b678 - block
    b654 - block
    b408 - block
    b299 - block
    b12 - block
    b204 - block
    b844 - block
    b453 - block
    b665 - block
    b493 - block
    b557 - block
    b959 - block
    b487 - block
    b522 - block
    b746 - block
    b350 - block
    b529 - block
    b137 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b678 )
    ( on b654 b678 )
    ( on b408 b654 )
    ( on b299 b408 )
    ( on b12 b299 )
    ( on b204 b12 )
    ( on b844 b204 )
    ( on b453 b844 )
    ( on b665 b453 )
    ( on b493 b665 )
    ( on b557 b493 )
    ( on b959 b557 )
    ( on b487 b959 )
    ( on b522 b487 )
    ( on b746 b522 )
    ( on b350 b746 )
    ( on b529 b350 )
    ( on b137 b529 )
    ( clear b137 )
  )
  ( :goal
    ( and
      ( clear b678 )
    )
  )
)
