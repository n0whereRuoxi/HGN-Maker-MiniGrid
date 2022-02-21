( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b539 - block
    b334 - block
    b135 - block
    b608 - block
    b212 - block
    b298 - block
    b784 - block
    b427 - block
    b950 - block
    b67 - block
    b571 - block
    b821 - block
    b564 - block
    b238 - block
    b254 - block
    b203 - block
    b594 - block
    b217 - block
    b769 - block
    b949 - block
    b941 - block
    b857 - block
    b946 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b539 )
    ( on b334 b539 )
    ( on b135 b334 )
    ( on b608 b135 )
    ( on b212 b608 )
    ( on b298 b212 )
    ( on b784 b298 )
    ( on b427 b784 )
    ( on b950 b427 )
    ( on b67 b950 )
    ( on b571 b67 )
    ( on b821 b571 )
    ( on b564 b821 )
    ( on b238 b564 )
    ( on b254 b238 )
    ( on b203 b254 )
    ( on b594 b203 )
    ( on b217 b594 )
    ( on b769 b217 )
    ( on b949 b769 )
    ( on b941 b949 )
    ( on b857 b941 )
    ( on b946 b857 )
    ( clear b946 )
  )
  ( :goal
    ( and
      ( clear b539 )
    )
  )
)
