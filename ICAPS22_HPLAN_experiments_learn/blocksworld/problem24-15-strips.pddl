( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b480 - block
    b611 - block
    b285 - block
    b109 - block
    b947 - block
    b367 - block
    b468 - block
    b962 - block
    b821 - block
    b836 - block
    b960 - block
    b342 - block
    b770 - block
    b311 - block
    b411 - block
    b822 - block
    b922 - block
    b838 - block
    b841 - block
    b2 - block
    b943 - block
    b448 - block
    b834 - block
    b312 - block
    b678 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b480 )
    ( on b611 b480 )
    ( on b285 b611 )
    ( on b109 b285 )
    ( on b947 b109 )
    ( on b367 b947 )
    ( on b468 b367 )
    ( on b962 b468 )
    ( on b821 b962 )
    ( on b836 b821 )
    ( on b960 b836 )
    ( on b342 b960 )
    ( on b770 b342 )
    ( on b311 b770 )
    ( on b411 b311 )
    ( on b822 b411 )
    ( on b922 b822 )
    ( on b838 b922 )
    ( on b841 b838 )
    ( on b2 b841 )
    ( on b943 b2 )
    ( on b448 b943 )
    ( on b834 b448 )
    ( on b312 b834 )
    ( on b678 b312 )
    ( clear b678 )
  )
  ( :goal
    ( and
      ( clear b480 )
    )
  )
)
