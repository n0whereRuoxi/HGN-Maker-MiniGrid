( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b271 - block
    b230 - block
    b821 - block
    b897 - block
    b32 - block
    b881 - block
    b878 - block
    b410 - block
    b390 - block
    b444 - block
    b401 - block
    b625 - block
    b565 - block
    b636 - block
    b756 - block
    b37 - block
    b412 - block
    b346 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b271 )
    ( on b230 b271 )
    ( on b821 b230 )
    ( on b897 b821 )
    ( on b32 b897 )
    ( on b881 b32 )
    ( on b878 b881 )
    ( on b410 b878 )
    ( on b390 b410 )
    ( on b444 b390 )
    ( on b401 b444 )
    ( on b625 b401 )
    ( on b565 b625 )
    ( on b636 b565 )
    ( on b756 b636 )
    ( on b37 b756 )
    ( on b412 b37 )
    ( on b346 b412 )
    ( clear b346 )
  )
  ( :goal
    ( and
      ( clear b271 )
    )
  )
)
