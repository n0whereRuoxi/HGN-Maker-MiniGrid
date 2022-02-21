( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b727 - block
    b81 - block
    b552 - block
    b696 - block
    b616 - block
    b800 - block
    b337 - block
    b118 - block
    b678 - block
    b233 - block
    b763 - block
    b850 - block
    b752 - block
    b171 - block
    b272 - block
    b346 - block
    b294 - block
    b588 - block
    b701 - block
    b484 - block
    b837 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b727 )
    ( on b81 b727 )
    ( on b552 b81 )
    ( on b696 b552 )
    ( on b616 b696 )
    ( on b800 b616 )
    ( on b337 b800 )
    ( on b118 b337 )
    ( on b678 b118 )
    ( on b233 b678 )
    ( on b763 b233 )
    ( on b850 b763 )
    ( on b752 b850 )
    ( on b171 b752 )
    ( on b272 b171 )
    ( on b346 b272 )
    ( on b294 b346 )
    ( on b588 b294 )
    ( on b701 b588 )
    ( on b484 b701 )
    ( on b837 b484 )
    ( clear b837 )
  )
  ( :goal
    ( and
      ( clear b727 )
    )
  )
)
