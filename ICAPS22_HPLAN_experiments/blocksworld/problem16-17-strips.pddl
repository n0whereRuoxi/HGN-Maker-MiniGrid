( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b944 - block
    b701 - block
    b338 - block
    b360 - block
    b52 - block
    b269 - block
    b488 - block
    b445 - block
    b374 - block
    b755 - block
    b695 - block
    b621 - block
    b886 - block
    b259 - block
    b698 - block
    b254 - block
    b783 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b944 )
    ( on b701 b944 )
    ( on b338 b701 )
    ( on b360 b338 )
    ( on b52 b360 )
    ( on b269 b52 )
    ( on b488 b269 )
    ( on b445 b488 )
    ( on b374 b445 )
    ( on b755 b374 )
    ( on b695 b755 )
    ( on b621 b695 )
    ( on b886 b621 )
    ( on b259 b886 )
    ( on b698 b259 )
    ( on b254 b698 )
    ( on b783 b254 )
    ( clear b783 )
  )
  ( :goal
    ( and
      ( clear b944 )
    )
  )
)
