( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b974 - block
    b146 - block
    b906 - block
    b46 - block
    b453 - block
    b273 - block
    b833 - block
    b877 - block
    b673 - block
    b328 - block
    b832 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b974 )
    ( on b146 b974 )
    ( on b906 b146 )
    ( on b46 b906 )
    ( on b453 b46 )
    ( on b273 b453 )
    ( on b833 b273 )
    ( on b877 b833 )
    ( on b673 b877 )
    ( on b328 b673 )
    ( on b832 b328 )
    ( clear b832 )
  )
  ( :goal
    ( and
      ( clear b974 )
    )
  )
)
