( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b29 - block
    b956 - block
    b918 - block
    b612 - block
    b626 - block
    b908 - block
    b64 - block
    b578 - block
    b625 - block
    b857 - block
    b76 - block
    b424 - block
    b32 - block
    b333 - block
    b730 - block
    b255 - block
    b124 - block
    b889 - block
    b434 - block
    b273 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b29 )
    ( on b956 b29 )
    ( on b918 b956 )
    ( on b612 b918 )
    ( on b626 b612 )
    ( on b908 b626 )
    ( on b64 b908 )
    ( on b578 b64 )
    ( on b625 b578 )
    ( on b857 b625 )
    ( on b76 b857 )
    ( on b424 b76 )
    ( on b32 b424 )
    ( on b333 b32 )
    ( on b730 b333 )
    ( on b255 b730 )
    ( on b124 b255 )
    ( on b889 b124 )
    ( on b434 b889 )
    ( on b273 b434 )
    ( clear b273 )
  )
  ( :goal
    ( and
      ( clear b29 )
    )
  )
)
