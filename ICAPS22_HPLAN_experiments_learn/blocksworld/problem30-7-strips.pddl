( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b416 - block
    b482 - block
    b347 - block
    b833 - block
    b857 - block
    b931 - block
    b391 - block
    b993 - block
    b518 - block
    b38 - block
    b723 - block
    b750 - block
    b800 - block
    b617 - block
    b938 - block
    b731 - block
    b415 - block
    b995 - block
    b614 - block
    b650 - block
    b760 - block
    b549 - block
    b444 - block
    b747 - block
    b377 - block
    b884 - block
    b820 - block
    b375 - block
    b504 - block
    b454 - block
    b186 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b416 )
    ( on b482 b416 )
    ( on b347 b482 )
    ( on b833 b347 )
    ( on b857 b833 )
    ( on b931 b857 )
    ( on b391 b931 )
    ( on b993 b391 )
    ( on b518 b993 )
    ( on b38 b518 )
    ( on b723 b38 )
    ( on b750 b723 )
    ( on b800 b750 )
    ( on b617 b800 )
    ( on b938 b617 )
    ( on b731 b938 )
    ( on b415 b731 )
    ( on b995 b415 )
    ( on b614 b995 )
    ( on b650 b614 )
    ( on b760 b650 )
    ( on b549 b760 )
    ( on b444 b549 )
    ( on b747 b444 )
    ( on b377 b747 )
    ( on b884 b377 )
    ( on b820 b884 )
    ( on b375 b820 )
    ( on b504 b375 )
    ( on b454 b504 )
    ( on b186 b454 )
    ( clear b186 )
  )
  ( :goal
    ( and
      ( clear b416 )
    )
  )
)
