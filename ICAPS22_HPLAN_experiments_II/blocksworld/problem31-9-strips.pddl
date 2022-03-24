( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b250 - block
    b667 - block
    b78 - block
    b650 - block
    b573 - block
    b82 - block
    b480 - block
    b190 - block
    b291 - block
    b333 - block
    b978 - block
    b968 - block
    b216 - block
    b498 - block
    b921 - block
    b691 - block
    b271 - block
    b111 - block
    b718 - block
    b665 - block
    b335 - block
    b366 - block
    b915 - block
    b141 - block
    b249 - block
    b378 - block
    b744 - block
    b912 - block
    b888 - block
    b334 - block
    b153 - block
    b734 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b250 )
    ( on b667 b250 )
    ( on b78 b667 )
    ( on b650 b78 )
    ( on b573 b650 )
    ( on b82 b573 )
    ( on b480 b82 )
    ( on b190 b480 )
    ( on b291 b190 )
    ( on b333 b291 )
    ( on b978 b333 )
    ( on b968 b978 )
    ( on b216 b968 )
    ( on b498 b216 )
    ( on b921 b498 )
    ( on b691 b921 )
    ( on b271 b691 )
    ( on b111 b271 )
    ( on b718 b111 )
    ( on b665 b718 )
    ( on b335 b665 )
    ( on b366 b335 )
    ( on b915 b366 )
    ( on b141 b915 )
    ( on b249 b141 )
    ( on b378 b249 )
    ( on b744 b378 )
    ( on b912 b744 )
    ( on b888 b912 )
    ( on b334 b888 )
    ( on b153 b334 )
    ( on b734 b153 )
    ( clear b734 )
  )
  ( :goal
    ( and
      ( clear b250 )
    )
  )
)
