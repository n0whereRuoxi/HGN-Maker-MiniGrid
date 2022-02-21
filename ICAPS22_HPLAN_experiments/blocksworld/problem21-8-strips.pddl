( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b79 - block
    b362 - block
    b490 - block
    b203 - block
    b469 - block
    b314 - block
    b138 - block
    b130 - block
    b264 - block
    b962 - block
    b289 - block
    b967 - block
    b765 - block
    b558 - block
    b70 - block
    b58 - block
    b535 - block
    b594 - block
    b93 - block
    b271 - block
    b979 - block
    b87 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b79 )
    ( on b362 b79 )
    ( on b490 b362 )
    ( on b203 b490 )
    ( on b469 b203 )
    ( on b314 b469 )
    ( on b138 b314 )
    ( on b130 b138 )
    ( on b264 b130 )
    ( on b962 b264 )
    ( on b289 b962 )
    ( on b967 b289 )
    ( on b765 b967 )
    ( on b558 b765 )
    ( on b70 b558 )
    ( on b58 b70 )
    ( on b535 b58 )
    ( on b594 b535 )
    ( on b93 b594 )
    ( on b271 b93 )
    ( on b979 b271 )
    ( on b87 b979 )
    ( clear b87 )
  )
  ( :goal
    ( and
      ( clear b79 )
    )
  )
)
