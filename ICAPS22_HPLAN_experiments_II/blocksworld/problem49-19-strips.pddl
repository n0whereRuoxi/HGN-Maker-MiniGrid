( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b98 - block
    b862 - block
    b841 - block
    b539 - block
    b751 - block
    b138 - block
    b681 - block
    b298 - block
    b570 - block
    b757 - block
    b211 - block
    b378 - block
    b868 - block
    b97 - block
    b956 - block
    b29 - block
    b255 - block
    b167 - block
    b510 - block
    b802 - block
    b186 - block
    b470 - block
    b202 - block
    b262 - block
    b623 - block
    b828 - block
    b207 - block
    b264 - block
    b732 - block
    b204 - block
    b671 - block
    b852 - block
    b57 - block
    b332 - block
    b810 - block
    b978 - block
    b494 - block
    b383 - block
    b59 - block
    b722 - block
    b404 - block
    b343 - block
    b439 - block
    b600 - block
    b493 - block
    b277 - block
    b160 - block
    b766 - block
    b599 - block
    b456 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b98 )
    ( on b862 b98 )
    ( on b841 b862 )
    ( on b539 b841 )
    ( on b751 b539 )
    ( on b138 b751 )
    ( on b681 b138 )
    ( on b298 b681 )
    ( on b570 b298 )
    ( on b757 b570 )
    ( on b211 b757 )
    ( on b378 b211 )
    ( on b868 b378 )
    ( on b97 b868 )
    ( on b956 b97 )
    ( on b29 b956 )
    ( on b255 b29 )
    ( on b167 b255 )
    ( on b510 b167 )
    ( on b802 b510 )
    ( on b186 b802 )
    ( on b470 b186 )
    ( on b202 b470 )
    ( on b262 b202 )
    ( on b623 b262 )
    ( on b828 b623 )
    ( on b207 b828 )
    ( on b264 b207 )
    ( on b732 b264 )
    ( on b204 b732 )
    ( on b671 b204 )
    ( on b852 b671 )
    ( on b57 b852 )
    ( on b332 b57 )
    ( on b810 b332 )
    ( on b978 b810 )
    ( on b494 b978 )
    ( on b383 b494 )
    ( on b59 b383 )
    ( on b722 b59 )
    ( on b404 b722 )
    ( on b343 b404 )
    ( on b439 b343 )
    ( on b600 b439 )
    ( on b493 b600 )
    ( on b277 b493 )
    ( on b160 b277 )
    ( on b766 b160 )
    ( on b599 b766 )
    ( on b456 b599 )
    ( clear b456 )
  )
  ( :goal
    ( and
      ( clear b98 )
    )
  )
)
