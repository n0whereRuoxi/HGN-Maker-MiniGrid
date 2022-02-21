( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b283 - block
    b826 - block
    b565 - block
    b413 - block
    b935 - block
    b544 - block
    b856 - block
    b383 - block
    b141 - block
    b290 - block
    b175 - block
    b359 - block
    b705 - block
    b248 - block
    b230 - block
    b906 - block
    b399 - block
    b301 - block
    b886 - block
    b47 - block
    b202 - block
    b552 - block
    b762 - block
    b524 - block
    b803 - block
    b605 - block
    b45 - block
    b746 - block
    b795 - block
    b124 - block
    b727 - block
    b204 - block
    b332 - block
    b433 - block
    b129 - block
    b191 - block
    b388 - block
    b77 - block
    b116 - block
    b412 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b283 )
    ( on b826 b283 )
    ( on b565 b826 )
    ( on b413 b565 )
    ( on b935 b413 )
    ( on b544 b935 )
    ( on b856 b544 )
    ( on b383 b856 )
    ( on b141 b383 )
    ( on b290 b141 )
    ( on b175 b290 )
    ( on b359 b175 )
    ( on b705 b359 )
    ( on b248 b705 )
    ( on b230 b248 )
    ( on b906 b230 )
    ( on b399 b906 )
    ( on b301 b399 )
    ( on b886 b301 )
    ( on b47 b886 )
    ( on b202 b47 )
    ( on b552 b202 )
    ( on b762 b552 )
    ( on b524 b762 )
    ( on b803 b524 )
    ( on b605 b803 )
    ( on b45 b605 )
    ( on b746 b45 )
    ( on b795 b746 )
    ( on b124 b795 )
    ( on b727 b124 )
    ( on b204 b727 )
    ( on b332 b204 )
    ( on b433 b332 )
    ( on b129 b433 )
    ( on b191 b129 )
    ( on b388 b191 )
    ( on b77 b388 )
    ( on b116 b77 )
    ( on b412 b116 )
    ( clear b412 )
  )
  ( :goal
    ( and
      ( clear b283 )
    )
  )
)
