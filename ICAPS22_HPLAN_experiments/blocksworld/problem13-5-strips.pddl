( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b504 - block
    b488 - block
    b927 - block
    b201 - block
    b276 - block
    b940 - block
    b760 - block
    b148 - block
    b318 - block
    b285 - block
    b506 - block
    b823 - block
    b480 - block
    b342 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b504 )
    ( on b488 b504 )
    ( on b927 b488 )
    ( on b201 b927 )
    ( on b276 b201 )
    ( on b940 b276 )
    ( on b760 b940 )
    ( on b148 b760 )
    ( on b318 b148 )
    ( on b285 b318 )
    ( on b506 b285 )
    ( on b823 b506 )
    ( on b480 b823 )
    ( on b342 b480 )
    ( clear b342 )
  )
  ( :goal
    ( and
      ( clear b504 )
    )
  )
)
