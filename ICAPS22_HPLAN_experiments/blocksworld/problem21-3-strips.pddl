( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b506 - block
    b298 - block
    b801 - block
    b820 - block
    b982 - block
    b500 - block
    b671 - block
    b422 - block
    b876 - block
    b540 - block
    b875 - block
    b158 - block
    b358 - block
    b485 - block
    b126 - block
    b636 - block
    b968 - block
    b967 - block
    b611 - block
    b418 - block
    b686 - block
    b58 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b506 )
    ( on b298 b506 )
    ( on b801 b298 )
    ( on b820 b801 )
    ( on b982 b820 )
    ( on b500 b982 )
    ( on b671 b500 )
    ( on b422 b671 )
    ( on b876 b422 )
    ( on b540 b876 )
    ( on b875 b540 )
    ( on b158 b875 )
    ( on b358 b158 )
    ( on b485 b358 )
    ( on b126 b485 )
    ( on b636 b126 )
    ( on b968 b636 )
    ( on b967 b968 )
    ( on b611 b967 )
    ( on b418 b611 )
    ( on b686 b418 )
    ( on b58 b686 )
    ( clear b58 )
  )
  ( :goal
    ( and
      ( clear b506 )
    )
  )
)
