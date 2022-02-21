( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b863 - block
    b6 - block
    b100 - block
    b541 - block
    b255 - block
    b358 - block
    b121 - block
    b904 - block
    b529 - block
    b591 - block
    b32 - block
    b461 - block
    b160 - block
    b124 - block
    b832 - block
    b727 - block
    b940 - block
    b491 - block
    b513 - block
    b178 - block
    b381 - block
    b610 - block
    b598 - block
    b757 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b863 )
    ( on b6 b863 )
    ( on b100 b6 )
    ( on b541 b100 )
    ( on b255 b541 )
    ( on b358 b255 )
    ( on b121 b358 )
    ( on b904 b121 )
    ( on b529 b904 )
    ( on b591 b529 )
    ( on b32 b591 )
    ( on b461 b32 )
    ( on b160 b461 )
    ( on b124 b160 )
    ( on b832 b124 )
    ( on b727 b832 )
    ( on b940 b727 )
    ( on b491 b940 )
    ( on b513 b491 )
    ( on b178 b513 )
    ( on b381 b178 )
    ( on b610 b381 )
    ( on b598 b610 )
    ( on b757 b598 )
    ( clear b757 )
  )
  ( :goal
    ( and
      ( clear b863 )
    )
  )
)
