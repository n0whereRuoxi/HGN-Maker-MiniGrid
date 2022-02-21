( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b264 - block
    b971 - block
    b947 - block
    b599 - block
    b183 - block
    b405 - block
    b181 - block
    b87 - block
    b645 - block
    b269 - block
    b368 - block
    b644 - block
    b708 - block
    b46 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b264 )
    ( on b971 b264 )
    ( on b947 b971 )
    ( on b599 b947 )
    ( on b183 b599 )
    ( on b405 b183 )
    ( on b181 b405 )
    ( on b87 b181 )
    ( on b645 b87 )
    ( on b269 b645 )
    ( on b368 b269 )
    ( on b644 b368 )
    ( on b708 b644 )
    ( on b46 b708 )
    ( clear b46 )
  )
  ( :goal
    ( and
      ( clear b264 )
    )
  )
)
