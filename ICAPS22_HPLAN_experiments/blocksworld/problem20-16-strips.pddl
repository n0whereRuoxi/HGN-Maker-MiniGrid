( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b80 - block
    b40 - block
    b935 - block
    b775 - block
    b872 - block
    b75 - block
    b824 - block
    b211 - block
    b192 - block
    b818 - block
    b727 - block
    b755 - block
    b491 - block
    b429 - block
    b295 - block
    b488 - block
    b661 - block
    b238 - block
    b176 - block
    b523 - block
    b196 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b80 )
    ( on b40 b80 )
    ( on b935 b40 )
    ( on b775 b935 )
    ( on b872 b775 )
    ( on b75 b872 )
    ( on b824 b75 )
    ( on b211 b824 )
    ( on b192 b211 )
    ( on b818 b192 )
    ( on b727 b818 )
    ( on b755 b727 )
    ( on b491 b755 )
    ( on b429 b491 )
    ( on b295 b429 )
    ( on b488 b295 )
    ( on b661 b488 )
    ( on b238 b661 )
    ( on b176 b238 )
    ( on b523 b176 )
    ( on b196 b523 )
    ( clear b196 )
  )
  ( :goal
    ( and
      ( clear b80 )
    )
  )
)
