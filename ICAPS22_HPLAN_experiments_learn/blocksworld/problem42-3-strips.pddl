( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b581 - block
    b816 - block
    b661 - block
    b527 - block
    b583 - block
    b235 - block
    b340 - block
    b254 - block
    b903 - block
    b375 - block
    b573 - block
    b853 - block
    b701 - block
    b621 - block
    b269 - block
    b227 - block
    b770 - block
    b212 - block
    b491 - block
    b662 - block
    b241 - block
    b803 - block
    b492 - block
    b784 - block
    b672 - block
    b898 - block
    b284 - block
    b958 - block
    b977 - block
    b409 - block
    b57 - block
    b70 - block
    b556 - block
    b362 - block
    b930 - block
    b595 - block
    b257 - block
    b311 - block
    b31 - block
    b685 - block
    b290 - block
    b540 - block
    b580 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b581 )
    ( on b816 b581 )
    ( on b661 b816 )
    ( on b527 b661 )
    ( on b583 b527 )
    ( on b235 b583 )
    ( on b340 b235 )
    ( on b254 b340 )
    ( on b903 b254 )
    ( on b375 b903 )
    ( on b573 b375 )
    ( on b853 b573 )
    ( on b701 b853 )
    ( on b621 b701 )
    ( on b269 b621 )
    ( on b227 b269 )
    ( on b770 b227 )
    ( on b212 b770 )
    ( on b491 b212 )
    ( on b662 b491 )
    ( on b241 b662 )
    ( on b803 b241 )
    ( on b492 b803 )
    ( on b784 b492 )
    ( on b672 b784 )
    ( on b898 b672 )
    ( on b284 b898 )
    ( on b958 b284 )
    ( on b977 b958 )
    ( on b409 b977 )
    ( on b57 b409 )
    ( on b70 b57 )
    ( on b556 b70 )
    ( on b362 b556 )
    ( on b930 b362 )
    ( on b595 b930 )
    ( on b257 b595 )
    ( on b311 b257 )
    ( on b31 b311 )
    ( on b685 b31 )
    ( on b290 b685 )
    ( on b540 b290 )
    ( on b580 b540 )
    ( clear b580 )
  )
  ( :goal
    ( and
      ( clear b581 )
    )
  )
)
