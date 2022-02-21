( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b321 - block
    b41 - block
    b997 - block
    b91 - block
    b968 - block
    b174 - block
    b820 - block
    b479 - block
    b473 - block
    b648 - block
    b851 - block
    b127 - block
    b821 - block
    b262 - block
    b926 - block
    b869 - block
    b563 - block
    b457 - block
    b490 - block
    b255 - block
    b76 - block
    b705 - block
    b632 - block
    b774 - block
    b722 - block
    b947 - block
    b686 - block
    b630 - block
    b428 - block
    b516 - block
    b878 - block
    b462 - block
    b132 - block
    b626 - block
    b396 - block
    b106 - block
    b471 - block
    b236 - block
    b466 - block
    b372 - block
    b360 - block
    b290 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b321 )
    ( on b41 b321 )
    ( on b997 b41 )
    ( on b91 b997 )
    ( on b968 b91 )
    ( on b174 b968 )
    ( on b820 b174 )
    ( on b479 b820 )
    ( on b473 b479 )
    ( on b648 b473 )
    ( on b851 b648 )
    ( on b127 b851 )
    ( on b821 b127 )
    ( on b262 b821 )
    ( on b926 b262 )
    ( on b869 b926 )
    ( on b563 b869 )
    ( on b457 b563 )
    ( on b490 b457 )
    ( on b255 b490 )
    ( on b76 b255 )
    ( on b705 b76 )
    ( on b632 b705 )
    ( on b774 b632 )
    ( on b722 b774 )
    ( on b947 b722 )
    ( on b686 b947 )
    ( on b630 b686 )
    ( on b428 b630 )
    ( on b516 b428 )
    ( on b878 b516 )
    ( on b462 b878 )
    ( on b132 b462 )
    ( on b626 b132 )
    ( on b396 b626 )
    ( on b106 b396 )
    ( on b471 b106 )
    ( on b236 b471 )
    ( on b466 b236 )
    ( on b372 b466 )
    ( on b360 b372 )
    ( on b290 b360 )
    ( clear b290 )
  )
  ( :goal
    ( and
      ( clear b321 )
    )
  )
)
