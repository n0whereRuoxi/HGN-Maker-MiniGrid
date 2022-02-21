( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b660 - block
    b200 - block
    b474 - block
    b831 - block
    b415 - block
    b127 - block
    b108 - block
    b494 - block
    b468 - block
    b721 - block
    b344 - block
    b311 - block
    b758 - block
    b654 - block
    b546 - block
    b622 - block
    b90 - block
    b342 - block
    b749 - block
    b902 - block
    b609 - block
    b375 - block
    b743 - block
    b197 - block
    b843 - block
    b646 - block
    b454 - block
    b398 - block
    b119 - block
    b581 - block
    b210 - block
    b433 - block
    b3 - block
    b626 - block
    b171 - block
    b913 - block
    b726 - block
    b869 - block
    b381 - block
    b574 - block
    b98 - block
    b480 - block
    b662 - block
    b418 - block
    b740 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b660 )
    ( on b200 b660 )
    ( on b474 b200 )
    ( on b831 b474 )
    ( on b415 b831 )
    ( on b127 b415 )
    ( on b108 b127 )
    ( on b494 b108 )
    ( on b468 b494 )
    ( on b721 b468 )
    ( on b344 b721 )
    ( on b311 b344 )
    ( on b758 b311 )
    ( on b654 b758 )
    ( on b546 b654 )
    ( on b622 b546 )
    ( on b90 b622 )
    ( on b342 b90 )
    ( on b749 b342 )
    ( on b902 b749 )
    ( on b609 b902 )
    ( on b375 b609 )
    ( on b743 b375 )
    ( on b197 b743 )
    ( on b843 b197 )
    ( on b646 b843 )
    ( on b454 b646 )
    ( on b398 b454 )
    ( on b119 b398 )
    ( on b581 b119 )
    ( on b210 b581 )
    ( on b433 b210 )
    ( on b3 b433 )
    ( on b626 b3 )
    ( on b171 b626 )
    ( on b913 b171 )
    ( on b726 b913 )
    ( on b869 b726 )
    ( on b381 b869 )
    ( on b574 b381 )
    ( on b98 b574 )
    ( on b480 b98 )
    ( on b662 b480 )
    ( on b418 b662 )
    ( on b740 b418 )
    ( clear b740 )
  )
  ( :goal
    ( and
      ( clear b660 )
    )
  )
)
