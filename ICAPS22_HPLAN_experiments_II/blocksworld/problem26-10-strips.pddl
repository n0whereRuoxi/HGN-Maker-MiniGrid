( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b688 - block
    b290 - block
    b967 - block
    b873 - block
    b320 - block
    b131 - block
    b456 - block
    b912 - block
    b350 - block
    b977 - block
    b180 - block
    b240 - block
    b34 - block
    b581 - block
    b76 - block
    b452 - block
    b846 - block
    b150 - block
    b551 - block
    b276 - block
    b812 - block
    b955 - block
    b37 - block
    b918 - block
    b116 - block
    b58 - block
    b880 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b688 )
    ( on b290 b688 )
    ( on b967 b290 )
    ( on b873 b967 )
    ( on b320 b873 )
    ( on b131 b320 )
    ( on b456 b131 )
    ( on b912 b456 )
    ( on b350 b912 )
    ( on b977 b350 )
    ( on b180 b977 )
    ( on b240 b180 )
    ( on b34 b240 )
    ( on b581 b34 )
    ( on b76 b581 )
    ( on b452 b76 )
    ( on b846 b452 )
    ( on b150 b846 )
    ( on b551 b150 )
    ( on b276 b551 )
    ( on b812 b276 )
    ( on b955 b812 )
    ( on b37 b955 )
    ( on b918 b37 )
    ( on b116 b918 )
    ( on b58 b116 )
    ( on b880 b58 )
    ( clear b880 )
  )
  ( :goal
    ( and
      ( clear b688 )
    )
  )
)
