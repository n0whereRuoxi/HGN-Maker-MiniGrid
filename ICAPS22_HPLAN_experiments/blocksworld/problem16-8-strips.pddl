( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b607 - block
    b566 - block
    b13 - block
    b221 - block
    b411 - block
    b775 - block
    b402 - block
    b444 - block
    b638 - block
    b297 - block
    b694 - block
    b216 - block
    b695 - block
    b270 - block
    b504 - block
    b738 - block
    b496 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b607 )
    ( on b566 b607 )
    ( on b13 b566 )
    ( on b221 b13 )
    ( on b411 b221 )
    ( on b775 b411 )
    ( on b402 b775 )
    ( on b444 b402 )
    ( on b638 b444 )
    ( on b297 b638 )
    ( on b694 b297 )
    ( on b216 b694 )
    ( on b695 b216 )
    ( on b270 b695 )
    ( on b504 b270 )
    ( on b738 b504 )
    ( on b496 b738 )
    ( clear b496 )
  )
  ( :goal
    ( and
      ( clear b607 )
    )
  )
)
