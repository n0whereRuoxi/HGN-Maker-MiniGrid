( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b760 - block
    b970 - block
    b304 - block
    b545 - block
    b940 - block
    b841 - block
    b423 - block
    b403 - block
    b494 - block
    b742 - block
    b745 - block
    b136 - block
    b91 - block
    b590 - block
    b294 - block
    b518 - block
    b705 - block
    b144 - block
    b412 - block
    b47 - block
    b298 - block
    b332 - block
    b971 - block
    b216 - block
    b934 - block
    b371 - block
    b153 - block
    b704 - block
    b980 - block
    b725 - block
    b810 - block
    b635 - block
    b976 - block
    b11 - block
    b402 - block
    b935 - block
    b289 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b760 )
    ( on b970 b760 )
    ( on b304 b970 )
    ( on b545 b304 )
    ( on b940 b545 )
    ( on b841 b940 )
    ( on b423 b841 )
    ( on b403 b423 )
    ( on b494 b403 )
    ( on b742 b494 )
    ( on b745 b742 )
    ( on b136 b745 )
    ( on b91 b136 )
    ( on b590 b91 )
    ( on b294 b590 )
    ( on b518 b294 )
    ( on b705 b518 )
    ( on b144 b705 )
    ( on b412 b144 )
    ( on b47 b412 )
    ( on b298 b47 )
    ( on b332 b298 )
    ( on b971 b332 )
    ( on b216 b971 )
    ( on b934 b216 )
    ( on b371 b934 )
    ( on b153 b371 )
    ( on b704 b153 )
    ( on b980 b704 )
    ( on b725 b980 )
    ( on b810 b725 )
    ( on b635 b810 )
    ( on b976 b635 )
    ( on b11 b976 )
    ( on b402 b11 )
    ( on b935 b402 )
    ( on b289 b935 )
    ( clear b289 )
  )
  ( :goal
    ( and
      ( clear b760 )
    )
  )
)
