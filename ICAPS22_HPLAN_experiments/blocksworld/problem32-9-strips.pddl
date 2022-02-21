( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b237 - block
    b25 - block
    b306 - block
    b2 - block
    b721 - block
    b528 - block
    b151 - block
    b790 - block
    b932 - block
    b351 - block
    b898 - block
    b396 - block
    b800 - block
    b221 - block
    b756 - block
    b211 - block
    b383 - block
    b8 - block
    b621 - block
    b362 - block
    b910 - block
    b311 - block
    b423 - block
    b250 - block
    b467 - block
    b505 - block
    b260 - block
    b232 - block
    b182 - block
    b766 - block
    b861 - block
    b189 - block
    b454 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b237 )
    ( on b25 b237 )
    ( on b306 b25 )
    ( on b2 b306 )
    ( on b721 b2 )
    ( on b528 b721 )
    ( on b151 b528 )
    ( on b790 b151 )
    ( on b932 b790 )
    ( on b351 b932 )
    ( on b898 b351 )
    ( on b396 b898 )
    ( on b800 b396 )
    ( on b221 b800 )
    ( on b756 b221 )
    ( on b211 b756 )
    ( on b383 b211 )
    ( on b8 b383 )
    ( on b621 b8 )
    ( on b362 b621 )
    ( on b910 b362 )
    ( on b311 b910 )
    ( on b423 b311 )
    ( on b250 b423 )
    ( on b467 b250 )
    ( on b505 b467 )
    ( on b260 b505 )
    ( on b232 b260 )
    ( on b182 b232 )
    ( on b766 b182 )
    ( on b861 b766 )
    ( on b189 b861 )
    ( on b454 b189 )
    ( clear b454 )
  )
  ( :goal
    ( and
      ( clear b237 )
    )
  )
)
