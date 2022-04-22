( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b28 - block
    b31 - block
    b643 - block
    b488 - block
    b305 - block
    b968 - block
    b418 - block
    b627 - block
    b291 - block
    b151 - block
    b466 - block
    b150 - block
    b898 - block
    b511 - block
    b274 - block
    b237 - block
    b707 - block
    b459 - block
    b428 - block
    b32 - block
    b660 - block
    b316 - block
    b306 - block
    b204 - block
    b972 - block
    b743 - block
    b839 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b28 )
    ( on b31 b28 )
    ( on b643 b31 )
    ( on b488 b643 )
    ( on b305 b488 )
    ( on b968 b305 )
    ( on b418 b968 )
    ( on b627 b418 )
    ( on b291 b627 )
    ( on b151 b291 )
    ( on b466 b151 )
    ( on b150 b466 )
    ( on b898 b150 )
    ( on b511 b898 )
    ( on b274 b511 )
    ( on b237 b274 )
    ( on b707 b237 )
    ( on b459 b707 )
    ( on b428 b459 )
    ( on b32 b428 )
    ( on b660 b32 )
    ( on b316 b660 )
    ( on b306 b316 )
    ( on b204 b306 )
    ( on b972 b204 )
    ( on b743 b972 )
    ( on b839 b743 )
    ( clear b839 )
  )
  ( :goal
    ( and
      ( clear b28 )
    )
  )
)
