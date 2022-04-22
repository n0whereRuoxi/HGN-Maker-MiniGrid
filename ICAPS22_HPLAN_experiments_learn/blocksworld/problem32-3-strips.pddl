( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b845 - block
    b704 - block
    b236 - block
    b623 - block
    b583 - block
    b901 - block
    b895 - block
    b106 - block
    b666 - block
    b171 - block
    b650 - block
    b693 - block
    b441 - block
    b227 - block
    b642 - block
    b474 - block
    b27 - block
    b788 - block
    b123 - block
    b746 - block
    b160 - block
    b72 - block
    b400 - block
    b967 - block
    b46 - block
    b132 - block
    b688 - block
    b135 - block
    b637 - block
    b284 - block
    b929 - block
    b299 - block
    b869 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b845 )
    ( on b704 b845 )
    ( on b236 b704 )
    ( on b623 b236 )
    ( on b583 b623 )
    ( on b901 b583 )
    ( on b895 b901 )
    ( on b106 b895 )
    ( on b666 b106 )
    ( on b171 b666 )
    ( on b650 b171 )
    ( on b693 b650 )
    ( on b441 b693 )
    ( on b227 b441 )
    ( on b642 b227 )
    ( on b474 b642 )
    ( on b27 b474 )
    ( on b788 b27 )
    ( on b123 b788 )
    ( on b746 b123 )
    ( on b160 b746 )
    ( on b72 b160 )
    ( on b400 b72 )
    ( on b967 b400 )
    ( on b46 b967 )
    ( on b132 b46 )
    ( on b688 b132 )
    ( on b135 b688 )
    ( on b637 b135 )
    ( on b284 b637 )
    ( on b929 b284 )
    ( on b299 b929 )
    ( on b869 b299 )
    ( clear b869 )
  )
  ( :goal
    ( and
      ( clear b845 )
    )
  )
)
