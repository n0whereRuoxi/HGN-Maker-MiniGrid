( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b143 - block
    b211 - block
    b910 - block
    b392 - block
    b324 - block
    b594 - block
    b507 - block
    b269 - block
    b702 - block
    b516 - block
    b792 - block
    b693 - block
    b522 - block
    b209 - block
    b145 - block
    b767 - block
    b404 - block
    b423 - block
    b714 - block
    b135 - block
    b589 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b143 )
    ( on b211 b143 )
    ( on b910 b211 )
    ( on b392 b910 )
    ( on b324 b392 )
    ( on b594 b324 )
    ( on b507 b594 )
    ( on b269 b507 )
    ( on b702 b269 )
    ( on b516 b702 )
    ( on b792 b516 )
    ( on b693 b792 )
    ( on b522 b693 )
    ( on b209 b522 )
    ( on b145 b209 )
    ( on b767 b145 )
    ( on b404 b767 )
    ( on b423 b404 )
    ( on b714 b423 )
    ( on b135 b714 )
    ( on b589 b135 )
    ( clear b589 )
  )
  ( :goal
    ( and
      ( clear b143 )
    )
  )
)
