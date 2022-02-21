( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b909 - block
    b924 - block
    b187 - block
    b897 - block
    b735 - block
    b489 - block
    b637 - block
    b823 - block
    b677 - block
    b419 - block
    b422 - block
    b518 - block
    b979 - block
    b483 - block
    b353 - block
    b708 - block
    b734 - block
    b239 - block
    b432 - block
    b810 - block
    b70 - block
    b703 - block
    b723 - block
    b339 - block
    b427 - block
    b74 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b909 )
    ( on b924 b909 )
    ( on b187 b924 )
    ( on b897 b187 )
    ( on b735 b897 )
    ( on b489 b735 )
    ( on b637 b489 )
    ( on b823 b637 )
    ( on b677 b823 )
    ( on b419 b677 )
    ( on b422 b419 )
    ( on b518 b422 )
    ( on b979 b518 )
    ( on b483 b979 )
    ( on b353 b483 )
    ( on b708 b353 )
    ( on b734 b708 )
    ( on b239 b734 )
    ( on b432 b239 )
    ( on b810 b432 )
    ( on b70 b810 )
    ( on b703 b70 )
    ( on b723 b703 )
    ( on b339 b723 )
    ( on b427 b339 )
    ( on b74 b427 )
    ( clear b74 )
  )
  ( :goal
    ( and
      ( clear b909 )
    )
  )
)
