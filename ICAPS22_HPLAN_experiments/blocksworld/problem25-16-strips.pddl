( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b44 - block
    b635 - block
    b744 - block
    b333 - block
    b821 - block
    b617 - block
    b304 - block
    b778 - block
    b724 - block
    b295 - block
    b954 - block
    b711 - block
    b240 - block
    b882 - block
    b491 - block
    b48 - block
    b466 - block
    b841 - block
    b459 - block
    b108 - block
    b271 - block
    b478 - block
    b998 - block
    b42 - block
    b40 - block
    b593 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b44 )
    ( on b635 b44 )
    ( on b744 b635 )
    ( on b333 b744 )
    ( on b821 b333 )
    ( on b617 b821 )
    ( on b304 b617 )
    ( on b778 b304 )
    ( on b724 b778 )
    ( on b295 b724 )
    ( on b954 b295 )
    ( on b711 b954 )
    ( on b240 b711 )
    ( on b882 b240 )
    ( on b491 b882 )
    ( on b48 b491 )
    ( on b466 b48 )
    ( on b841 b466 )
    ( on b459 b841 )
    ( on b108 b459 )
    ( on b271 b108 )
    ( on b478 b271 )
    ( on b998 b478 )
    ( on b42 b998 )
    ( on b40 b42 )
    ( on b593 b40 )
    ( clear b593 )
  )
  ( :goal
    ( and
      ( clear b44 )
    )
  )
)
