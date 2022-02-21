( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b491 - block
    b768 - block
    b472 - block
    b767 - block
    b612 - block
    b849 - block
    b254 - block
    b349 - block
    b737 - block
    b293 - block
    b312 - block
    b86 - block
    b72 - block
    b197 - block
    b11 - block
    b120 - block
    b660 - block
    b533 - block
    b628 - block
    b700 - block
    b9 - block
    b744 - block
    b771 - block
    b429 - block
    b220 - block
    b411 - block
    b834 - block
    b128 - block
    b155 - block
    b539 - block
    b550 - block
    b487 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b491 )
    ( on b768 b491 )
    ( on b472 b768 )
    ( on b767 b472 )
    ( on b612 b767 )
    ( on b849 b612 )
    ( on b254 b849 )
    ( on b349 b254 )
    ( on b737 b349 )
    ( on b293 b737 )
    ( on b312 b293 )
    ( on b86 b312 )
    ( on b72 b86 )
    ( on b197 b72 )
    ( on b11 b197 )
    ( on b120 b11 )
    ( on b660 b120 )
    ( on b533 b660 )
    ( on b628 b533 )
    ( on b700 b628 )
    ( on b9 b700 )
    ( on b744 b9 )
    ( on b771 b744 )
    ( on b429 b771 )
    ( on b220 b429 )
    ( on b411 b220 )
    ( on b834 b411 )
    ( on b128 b834 )
    ( on b155 b128 )
    ( on b539 b155 )
    ( on b550 b539 )
    ( on b487 b550 )
    ( clear b487 )
  )
  ( :goal
    ( and
      ( clear b491 )
    )
  )
)
