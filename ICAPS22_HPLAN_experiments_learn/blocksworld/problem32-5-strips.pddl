( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b330 - block
    b665 - block
    b718 - block
    b556 - block
    b689 - block
    b558 - block
    b16 - block
    b833 - block
    b726 - block
    b415 - block
    b778 - block
    b247 - block
    b182 - block
    b60 - block
    b905 - block
    b669 - block
    b914 - block
    b824 - block
    b185 - block
    b667 - block
    b334 - block
    b983 - block
    b912 - block
    b877 - block
    b183 - block
    b418 - block
    b408 - block
    b47 - block
    b287 - block
    b112 - block
    b598 - block
    b566 - block
    b296 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b330 )
    ( on b665 b330 )
    ( on b718 b665 )
    ( on b556 b718 )
    ( on b689 b556 )
    ( on b558 b689 )
    ( on b16 b558 )
    ( on b833 b16 )
    ( on b726 b833 )
    ( on b415 b726 )
    ( on b778 b415 )
    ( on b247 b778 )
    ( on b182 b247 )
    ( on b60 b182 )
    ( on b905 b60 )
    ( on b669 b905 )
    ( on b914 b669 )
    ( on b824 b914 )
    ( on b185 b824 )
    ( on b667 b185 )
    ( on b334 b667 )
    ( on b983 b334 )
    ( on b912 b983 )
    ( on b877 b912 )
    ( on b183 b877 )
    ( on b418 b183 )
    ( on b408 b418 )
    ( on b47 b408 )
    ( on b287 b47 )
    ( on b112 b287 )
    ( on b598 b112 )
    ( on b566 b598 )
    ( on b296 b566 )
    ( clear b296 )
  )
  ( :goal
    ( and
      ( clear b330 )
    )
  )
)
