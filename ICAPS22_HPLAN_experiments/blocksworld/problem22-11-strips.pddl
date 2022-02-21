( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b311 - block
    b176 - block
    b454 - block
    b438 - block
    b854 - block
    b359 - block
    b947 - block
    b193 - block
    b604 - block
    b4 - block
    b306 - block
    b605 - block
    b732 - block
    b140 - block
    b678 - block
    b240 - block
    b756 - block
    b112 - block
    b751 - block
    b60 - block
    b651 - block
    b395 - block
    b340 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b311 )
    ( on b176 b311 )
    ( on b454 b176 )
    ( on b438 b454 )
    ( on b854 b438 )
    ( on b359 b854 )
    ( on b947 b359 )
    ( on b193 b947 )
    ( on b604 b193 )
    ( on b4 b604 )
    ( on b306 b4 )
    ( on b605 b306 )
    ( on b732 b605 )
    ( on b140 b732 )
    ( on b678 b140 )
    ( on b240 b678 )
    ( on b756 b240 )
    ( on b112 b756 )
    ( on b751 b112 )
    ( on b60 b751 )
    ( on b651 b60 )
    ( on b395 b651 )
    ( on b340 b395 )
    ( clear b340 )
  )
  ( :goal
    ( and
      ( clear b311 )
    )
  )
)
