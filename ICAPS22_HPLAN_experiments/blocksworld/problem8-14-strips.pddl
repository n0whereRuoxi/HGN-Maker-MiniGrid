( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b232 - block
    b700 - block
    b547 - block
    b455 - block
    b329 - block
    b753 - block
    b791 - block
    b483 - block
    b274 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b232 )
    ( on b700 b232 )
    ( on b547 b700 )
    ( on b455 b547 )
    ( on b329 b455 )
    ( on b753 b329 )
    ( on b791 b753 )
    ( on b483 b791 )
    ( on b274 b483 )
    ( clear b274 )
  )
  ( :goal
    ( and
      ( clear b232 )
    )
  )
)
