( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b153 - block
    b587 - block
    b837 - block
    b608 - block
    b681 - block
    b416 - block
    b826 - block
    b315 - block
    b272 - block
    b321 - block
    b700 - block
    b77 - block
    b135 - block
    b550 - block
    b960 - block
    b227 - block
    b95 - block
    b355 - block
    b678 - block
    b783 - block
    b465 - block
    b458 - block
    b746 - block
    b276 - block
    b237 - block
    b497 - block
    b9 - block
    b271 - block
    b721 - block
    b8 - block
    b525 - block
    b835 - block
    b184 - block
    b36 - block
    b138 - block
    b654 - block
    b686 - block
    b171 - block
    b202 - block
    b131 - block
    b808 - block
    b294 - block
    b27 - block
    b98 - block
    b548 - block
    b155 - block
    b520 - block
    b480 - block
    b198 - block
    b540 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b153 )
    ( on b587 b153 )
    ( on b837 b587 )
    ( on b608 b837 )
    ( on b681 b608 )
    ( on b416 b681 )
    ( on b826 b416 )
    ( on b315 b826 )
    ( on b272 b315 )
    ( on b321 b272 )
    ( on b700 b321 )
    ( on b77 b700 )
    ( on b135 b77 )
    ( on b550 b135 )
    ( on b960 b550 )
    ( on b227 b960 )
    ( on b95 b227 )
    ( on b355 b95 )
    ( on b678 b355 )
    ( on b783 b678 )
    ( on b465 b783 )
    ( on b458 b465 )
    ( on b746 b458 )
    ( on b276 b746 )
    ( on b237 b276 )
    ( on b497 b237 )
    ( on b9 b497 )
    ( on b271 b9 )
    ( on b721 b271 )
    ( on b8 b721 )
    ( on b525 b8 )
    ( on b835 b525 )
    ( on b184 b835 )
    ( on b36 b184 )
    ( on b138 b36 )
    ( on b654 b138 )
    ( on b686 b654 )
    ( on b171 b686 )
    ( on b202 b171 )
    ( on b131 b202 )
    ( on b808 b131 )
    ( on b294 b808 )
    ( on b27 b294 )
    ( on b98 b27 )
    ( on b548 b98 )
    ( on b155 b548 )
    ( on b520 b155 )
    ( on b480 b520 )
    ( on b198 b480 )
    ( on b540 b198 )
    ( clear b540 )
  )
  ( :goal
    ( and
      ( clear b153 )
    )
  )
)
