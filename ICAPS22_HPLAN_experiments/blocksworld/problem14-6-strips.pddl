( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b217 - block
    b346 - block
    b533 - block
    b944 - block
    b42 - block
    b273 - block
    b850 - block
    b338 - block
    b373 - block
    b340 - block
    b763 - block
    b364 - block
    b356 - block
    b177 - block
    b455 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b217 )
    ( on b346 b217 )
    ( on b533 b346 )
    ( on b944 b533 )
    ( on b42 b944 )
    ( on b273 b42 )
    ( on b850 b273 )
    ( on b338 b850 )
    ( on b373 b338 )
    ( on b340 b373 )
    ( on b763 b340 )
    ( on b364 b763 )
    ( on b356 b364 )
    ( on b177 b356 )
    ( on b455 b177 )
    ( clear b455 )
  )
  ( :goal
    ( and
      ( clear b217 )
    )
  )
)
