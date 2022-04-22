( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b400 - block
    b884 - block
    b685 - block
    b412 - block
    b50 - block
    b796 - block
    b51 - block
    b841 - block
    b525 - block
    b784 - block
    b751 - block
    b210 - block
    b466 - block
    b527 - block
    b149 - block
    b830 - block
    b286 - block
    b690 - block
    b312 - block
    b161 - block
    b900 - block
    b851 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b400 )
    ( on b884 b400 )
    ( on b685 b884 )
    ( on b412 b685 )
    ( on b50 b412 )
    ( on b796 b50 )
    ( on b51 b796 )
    ( on b841 b51 )
    ( on b525 b841 )
    ( on b784 b525 )
    ( on b751 b784 )
    ( on b210 b751 )
    ( on b466 b210 )
    ( on b527 b466 )
    ( on b149 b527 )
    ( on b830 b149 )
    ( on b286 b830 )
    ( on b690 b286 )
    ( on b312 b690 )
    ( on b161 b312 )
    ( on b900 b161 )
    ( on b851 b900 )
    ( clear b851 )
  )
  ( :goal
    ( and
      ( clear b400 )
    )
  )
)
