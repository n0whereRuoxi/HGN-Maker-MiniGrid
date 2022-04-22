( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b930 - block
    b661 - block
    b169 - block
    b226 - block
    b124 - block
    b692 - block
    b8 - block
    b208 - block
    b207 - block
    b424 - block
    b817 - block
    b105 - block
    b342 - block
    b145 - block
    b737 - block
    b67 - block
    b5 - block
    b254 - block
    b69 - block
    b634 - block
    b841 - block
    b878 - block
    b375 - block
    b488 - block
    b444 - block
    b790 - block
    b450 - block
    b400 - block
    b282 - block
    b573 - block
    b781 - block
    b34 - block
    b62 - block
    b225 - block
    b745 - block
    b987 - block
    b454 - block
    b467 - block
    b760 - block
    b773 - block
    b274 - block
    b418 - block
    b607 - block
    b402 - block
    b570 - block
    b165 - block
    b390 - block
    b329 - block
    b870 - block
    b557 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b930 )
    ( on b661 b930 )
    ( on b169 b661 )
    ( on b226 b169 )
    ( on b124 b226 )
    ( on b692 b124 )
    ( on b8 b692 )
    ( on b208 b8 )
    ( on b207 b208 )
    ( on b424 b207 )
    ( on b817 b424 )
    ( on b105 b817 )
    ( on b342 b105 )
    ( on b145 b342 )
    ( on b737 b145 )
    ( on b67 b737 )
    ( on b5 b67 )
    ( on b254 b5 )
    ( on b69 b254 )
    ( on b634 b69 )
    ( on b841 b634 )
    ( on b878 b841 )
    ( on b375 b878 )
    ( on b488 b375 )
    ( on b444 b488 )
    ( on b790 b444 )
    ( on b450 b790 )
    ( on b400 b450 )
    ( on b282 b400 )
    ( on b573 b282 )
    ( on b781 b573 )
    ( on b34 b781 )
    ( on b62 b34 )
    ( on b225 b62 )
    ( on b745 b225 )
    ( on b987 b745 )
    ( on b454 b987 )
    ( on b467 b454 )
    ( on b760 b467 )
    ( on b773 b760 )
    ( on b274 b773 )
    ( on b418 b274 )
    ( on b607 b418 )
    ( on b402 b607 )
    ( on b570 b402 )
    ( on b165 b570 )
    ( on b390 b165 )
    ( on b329 b390 )
    ( on b870 b329 )
    ( on b557 b870 )
    ( clear b557 )
  )
  ( :goal
    ( and
      ( clear b930 )
    )
  )
)
