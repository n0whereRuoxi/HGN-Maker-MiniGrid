( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b566 - block
    b568 - block
    b705 - block
    b163 - block
    b612 - block
    b646 - block
    b945 - block
    b450 - block
    b104 - block
    b535 - block
    b109 - block
    b505 - block
    b967 - block
    b960 - block
    b3 - block
    b194 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b566 )
    ( on b568 b566 )
    ( on b705 b568 )
    ( on b163 b705 )
    ( on b612 b163 )
    ( on b646 b612 )
    ( on b945 b646 )
    ( on b450 b945 )
    ( on b104 b450 )
    ( on b535 b104 )
    ( on b109 b535 )
    ( on b505 b109 )
    ( on b967 b505 )
    ( on b960 b967 )
    ( on b3 b960 )
    ( on b194 b3 )
    ( clear b194 )
  )
  ( :goal
    ( and
      ( clear b566 )
    )
  )
)
