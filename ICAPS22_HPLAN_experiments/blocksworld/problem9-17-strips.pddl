( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b71 - block
    b828 - block
    b497 - block
    b715 - block
    b388 - block
    b490 - block
    b233 - block
    b200 - block
    b387 - block
    b725 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b71 )
    ( on b828 b71 )
    ( on b497 b828 )
    ( on b715 b497 )
    ( on b388 b715 )
    ( on b490 b388 )
    ( on b233 b490 )
    ( on b200 b233 )
    ( on b387 b200 )
    ( on b725 b387 )
    ( clear b725 )
  )
  ( :goal
    ( and
      ( clear b71 )
    )
  )
)
