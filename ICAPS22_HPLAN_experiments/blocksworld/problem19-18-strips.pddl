( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b11 - block
    b971 - block
    b113 - block
    b972 - block
    b368 - block
    b761 - block
    b385 - block
    b349 - block
    b514 - block
    b182 - block
    b379 - block
    b244 - block
    b779 - block
    b497 - block
    b364 - block
    b466 - block
    b388 - block
    b199 - block
    b350 - block
    b415 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b11 )
    ( on b971 b11 )
    ( on b113 b971 )
    ( on b972 b113 )
    ( on b368 b972 )
    ( on b761 b368 )
    ( on b385 b761 )
    ( on b349 b385 )
    ( on b514 b349 )
    ( on b182 b514 )
    ( on b379 b182 )
    ( on b244 b379 )
    ( on b779 b244 )
    ( on b497 b779 )
    ( on b364 b497 )
    ( on b466 b364 )
    ( on b388 b466 )
    ( on b199 b388 )
    ( on b350 b199 )
    ( on b415 b350 )
    ( clear b415 )
  )
  ( :goal
    ( and
      ( clear b11 )
    )
  )
)
